// Pokreće Claude analizu prijave preko Agent SDK-a.
//
// Zašto SDK, a ne claude-code-action: action se API-ju predstavlja kao Claude Code,
// a mesečni API kredit Team plana ne pokriva Claude Code. Agent SDK jeste pokriven.
//
// Agent ima samo alate za čitanje (Read, Grep, Glob), nema Bash, mrežu ni GitHub token.
// U log se ne ispisuje tekst modela, samo status, trošak i kratka poruka greške.
import { query } from "@anthropic-ai/claude-agent-sdk";
import { readFileSync, appendFileSync, realpathSync } from "node:fs";
import { resolve, dirname, basename, isAbsolute, sep } from "node:path";

function requireEnv(name) {
  const value = process.env[name];
  if (!value) {
    console.error(`::error::Missing environment variable ${name}`);
    process.exit(1);
  }
  return value;
}

const issue = requireEnv("ISSUE");
const mode = requireEnv("MODE");
const model = requireEnv("MODEL");
const maxTurns = Number(requireEnv("MAX_TURNS"));
const maxBudgetUsd = Number(requireEnv("BUDGET"));
const outputFile = requireEnv("GITHUB_OUTPUT");
const bcBranch = process.env.BC_BRANCH ?? "";

const schema = JSON.parse(readFileSync(".github/claude/triage-schema.json", "utf8"));
const prompt = `/nps-triage ISSUE=${issue} MODE=${mode} BC_BRANCH=${bcBranch}`;

// Agent dobija samo ono što mu treba; ostale promenljive runner-a (tokeni, ACTIONS_*) ne prosleđujemo.
const agentEnv = {
  PATH: process.env.PATH ?? "",
  HOME: process.env.HOME ?? "",
  LANG: "C.UTF-8",
  ANTHROPIC_API_KEY: requireEnv("ANTHROPIC_API_KEY"),
  CLAUDE_AGENT_SDK_CLIENT_APP: "nps-support-triage/1.0",
};
if (process.env.ANTHROPIC_BASE_URL) agentEnv.ANTHROPIC_BASE_URL = process.env.ANTHROPIC_BASE_URL;

// Agent sme da čita samo unutar radnog direktorijuma (workspace).
// Svaka putanja iz Read/Grep/Glob se kanonizuje (realpath) i proverava; sve van workspace-a se odbija.
const workspaceRoot = realpathSync(process.cwd());

function canonicalize(path) {
  const absolute = resolve(workspaceRoot, path);
  try {
    return realpathSync(absolute);
  } catch {
    // Fajl ne postoji: kanonizuj roditeljski folder i dodaj ime.
    try {
      return resolve(realpathSync(dirname(absolute)), basename(absolute));
    } catch {
      return absolute;
    }
  }
}

function isInsideWorkspace(path) {
  const canonical = canonicalize(path);
  return canonical === workspaceRoot || canonical.startsWith(workspaceRoot + sep);
}

function deny(reason) {
  return {
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: reason,
    },
  };
}

async function restrictToWorkspace(input) {
  const toolInput = input.tool_input ?? {};
  const paths = [toolInput.file_path, toolInput.path].filter((value) => typeof value === "string" && value !== "");
  for (const path of paths) {
    if (!isInsideWorkspace(path)) return deny("Only files inside the workspace can be read.");
  }
  // Glob obrazac (Glob.pattern, Grep.glob) ne sme da izađe iz workspace-a. Grep.pattern je regex, ne putanja.
  const globPattern = input.tool_name === "Glob" ? toolInput.pattern : toolInput.glob;
  if (typeof globPattern === "string" &&
      (isAbsolute(globPattern) || globPattern.startsWith("~") || globPattern.split(/[\\/]/).includes(".."))) {
    return deny("Patterns must stay inside the workspace.");
  }
  return {};
}

const options = {
  cwd: process.cwd(),
  env: agentEnv,
  model,
  maxTurns,
  maxBudgetUsd,
  systemPrompt: { type: "preset", preset: "claude_code" },
  settingSources: ["project"],
  skills: ["nps-triage"],
  tools: ["Read", "Grep", "Glob"],
  allowedTools: ["Read", "Grep", "Glob"],
  disallowedTools: ["Bash", "Write", "Edit", "NotebookEdit", "WebFetch", "WebSearch", "Agent", "Task"],
  hooks: {
    // onFailure "block": ako provera baci grešku, poziv alata se odbija, ne propušta.
    PreToolUse: [{ matcher: "Read|Grep|Glob", hooks: [restrictToWorkspace], onFailure: "block" }],
  },
  permissionMode: "dontAsk",
  outputFormat: { type: "json_schema", schema },
};

let result;
try {
  for await (const message of query({ prompt, options })) {
    if (message.type === "result") {
      result = message;
      break;
    }
  }
} catch (error) {
  console.error(`::error::Agent SDK error: ${String(error?.message ?? error).slice(0, 300)}`);
  process.exit(1);
}

const redact = (text) => String(text ?? "").replace(/sk-ant-[A-Za-z0-9_-]+/g, "[removed]").slice(0, 300);

if (!result) {
  console.error("::error::No result message from the agent.");
  process.exit(1);
}

const cost = Number(result.total_cost_usd ?? 0).toFixed(4);
console.log(`Result: subtype=${result.subtype} is_error=${result.is_error} turns=${result.num_turns ?? "?"} cost_usd=${cost}`);

if (result.is_error || result.subtype !== "success" || !result.structured_output) {
  const reason = result.subtype === "success"
    ? (result.is_error ? `API error: ${redact(result.result)}` : "No structured output returned.")
    : `${result.subtype}: ${redact((result.errors ?? []).join("; "))}`;
  console.error(`::error::${reason}`);
  process.exit(1);
}

// JSON.stringify daje jedan red, pa je bezbedan za GITHUB_OUTPUT.
appendFileSync(outputFile, `result=${JSON.stringify(result.structured_output)}\n`);
console.log("Structured output written.");
