# Claude analiza prijava — kako radi

## Tok prijave

```
Klijent otvori issue (Bug Report / Suggestion forma ili prazan issue)
        │   postojeći workflow-i i dalje rade: labela ekstenzije, dodavanje u projekat
        ▼
Prva analiza — initial (Sonnet) ── komentar: kako smo razumeli + pitanja + tehnička analiza (sklopljeno)
        │
        ├─ ima pitanja ──► waiting-for-customer ──► klijent odgovori ──► dopuna analize — followup (Sonnet)
        │                                                          (najviše 3 automatske analize po issue-u,
        │                                                           posle toga ide timu)
        ▼
     ready-for-team ──► tim pregleda (accepted / rejected, prioritet, dodela)
        │       po potrebi doda labelu  claude-deep-analysis  ──► dubinska analiza — deep (Opus)
        │                                     vidi i kod ekstenzije; rezultat = interni issue u privatnom
        │                                     repou ekstenzije, javno samo kratka napomena
        ▼
Developer radi lokalno (Claude Code nad našim kodom), rešenje, odgovor klijentu, zatvaranje.
```

Analiza postavlja samo:
- `waiting-for-customer` / `ready-for-team` — status,
- `possibly-standard` — ponašanje verovatno postoji i u standardnom BC-u, bez naših ekstenzija,
- `bug` / `suggestion` / `question` — samo ako issue još nema nijednu od njih.

Prioritet (`priority …`), ekstenziju, `accepted`/`rejected` i dodelu i dalje postavlja tim.
Predlog prioriteta je samo u tekstu komentara.

## Šta agent vidi i šta sme

- Vidi: prijavu i komentare, druge prijave u ovom repou, dokumentaciju u `doc/docs/` i standardni W1 kod
  za verziju BC-a iz forme (`bc-standard/`, iz StefanMaron/MSDyn365BC.Code.History).
- Kod naših ekstenzija vidi **samo dubinska analiza** (labela `claude-deep-analysis`, koju mogu da dodaju samo
  članovi tima). Repo se bira po labeli ekstenzije na issue-u (LOC, EIN...) preko
  [`extension-repos.json`](extension-repos.json); najviše 3 repoa, prvi je primarni. Rezultat se **ne objavljuje
  javno**: otvara se interni issue u primarnom repou ekstenzije, a u javnoj prijavi ostaje samo fiksna napomena.
  Automatske analize (initial/followup) kod ekstenzija ne vide, jer im je izlaz javan.
- Ne vidi: tajne repoa. Token za privatne repoe koriste samo koraci koji preuzimaju kod i otvaraju interni issue.
- Ne može: da piše komentare, menja labele, menja fajlove, pokreće komande ili pristupa internetu i GitHub-u.
  Prijavu i listu prijava mu unapred preuzima korak "Fetch issue" u `.triage/`. Komentar i labele objavljuje
  skripta `post.sh` iz strukturisanog izlaza, posle čišćenja (bez HTML-a, slika, tokena i @pominjanja).

## Podešavanje (jednom)

1. **API ključ:** u Claude Console, u workspace-u za GitHub sa mesečnim limitom potrošnje, napravite API ključ
   i unesite ga u repo: *Settings → Secrets and variables → Actions → New repository secret*,
   naziv `ANTHROPIC_API_KEY`. Ključ ne lepite nigde drugde.
2. **Labele:** `bash .github/claude/setup-labels.sh` (lokalno, uz prijavljen `gh`).
3. **Opciono, repo varijable** (*Settings → Secrets and variables → Actions → Variables*):
   - `BC_DEFAULT_MAJOR` — verzija BC-a kada je klijent ne navede (podrazumevano `29`)
   - `CLAUDE_MODEL_AUTO` — model za automatske analize (podrazumevano `claude-sonnet-5-5`)
   - `CLAUDE_MODEL_DEEP` — model za dubinsku analizu (podrazumevano `claude-opus-5-5`)
   - `CLAUDE_MAX_AUTO_RUNS` — koliko automatskih analiza po issue-u (podrazumevano `3`)
4. **Kod ekstenzija za dubinsku analizu (opciono):** napravite fine-grained token
   (*GitHub → Settings → Developer settings → Fine-grained tokens*), Resource owner `NPSBeograd`,
   *Only select repositories*: repoi iz `extension-repos.json`, Permissions: **Contents: Read**,
   **Issues: Read and write**. Unesite ga kao secret `EXTENSIONS_TOKEN`. Bez njega dubinska analiza radi
   kao i ranije (bez koda ekstenzije, javni komentar).
5. **Test:** otvorite issue sa naloga koji **nije** član organizacije i proverite komentar i labele.
   Posle testa zakucajte `anthropics/claude-code-action@v1` na konkretan commit SHA.

Claude GitHub App nije potrebna: workflow radi sa ugrađenim `GITHUB_TOKEN`.

## Troškovi i limiti

- Analiza ide preko Claude Agent SDK-a, pa se troši mesečni API kredit Team plana
  (claude-code-action se predstavlja kao Claude Code, koji taj kredit ne pokriva).

- Automatska analiza: do 35 koraka i najviše ~1,50 $ po pokretanju (`--max-budget-usd`).
- Dubinska analiza: do 60 koraka i najviše ~4 $ po pokretanju.
- Pravi limit je mesečni limit potrošnje na workspace-u u Console-u.
