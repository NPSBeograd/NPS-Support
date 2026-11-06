# Claude analiza prijava — kako radi

## Tok prijave

```
Klijent otvori issue (Bug Report / Suggestion forma ili prazan issue)
        │   postojeći workflow-i i dalje rade: labela ekstenzije, dodavanje u projekat
        ▼
Prva analiza (Sonnet) ── komentar: kako smo razumeli + pitanja + tehnička analiza (sklopljeno)
        │
        ├─ ima pitanja ──► ceka-klijenta ──► klijent odgovori ──► dopuna analize (Sonnet)
        │                                                          (najviše 3 automatske analize po issue-u,
        │                                                           posle toga ide timu)
        ▼
     za-tim ──► tim pregleda (accepted / rejected, prioritet, dodela)
        │       po potrebi doda labelu  claude-dubinska  ──► dubinska analiza (Opus)
        ▼
Developer radi lokalno (Claude Code nad našim kodom), rešenje, odgovor klijentu, zatvaranje.
```

Analiza postavlja samo:
- `ceka-klijenta` / `za-tim` — status,
- `moguce-standardno` — ponašanje verovatno postoji i u standardnom BC-u, bez naših ekstenzija,
- `bug` / `suggestion` / `question` — samo ako issue još nema nijednu od njih.

Prioritet (`priority …`), ekstenziju, `accepted`/`rejected` i dodelu i dalje postavlja tim.
Predlog prioriteta je samo u tekstu komentara.

## Šta agent vidi i šta sme

- Vidi: prijavu i komentare, druge prijave u ovom repou, dokumentaciju u `doc/docs/` i standardni W1 kod
  za verziju BC-a iz forme (`bc-standard/`, iz StefanMaron/MSDyn365BC.Code.History).
- Ne vidi: kod naših ekstenzija (privatni repoi) ni tajne repoa (osim API ključa za sopstveni rad).
- Ne može: da piše komentare, menja labele, menja fajlove ili pristupa internetu. Komentar i labele objavljuje
  skripta `post.sh` iz strukturisanog izlaza, posle čišćenja (bez HTML-a, slika, tokena i @pominjanja).

## Podešavanje (jednom)

1. **API ključ:** u Claude Console, u workspace-u za GitHub sa mesečnim limitom potrošnje, napravite API ključ
   i unesite ga u repo: *Settings → Secrets and variables → Actions → New repository secret*,
   naziv `ANTHROPIC_API_KEY`. Ključ ne lepite nigde drugde.
2. **Labele:** `bash .github/claude/setup-labels.sh` (lokalno, uz prijavljen `gh`).
3. **Opciono, repo varijable** (*Settings → Secrets and variables → Actions → Variables*):
   - `BC_DEFAULT_MAJOR` — verzija BC-a kada je klijent ne navede (podrazumevano `29`)
   - `CLAUDE_MODEL_AUTO` — model za automatske analize (podrazumevano `claude-sonnet-5-5`)
   - `CLAUDE_MODEL_DUBINSKA` — model za dubinsku analizu (podrazumevano `claude-opus-5-5`)
   - `CLAUDE_MAX_ANALIZA` — koliko automatskih analiza po issue-u (podrazumevano `3`)
4. **Test:** otvorite issue sa naloga koji **nije** član organizacije i proverite komentar i labele.
   Posle testa zakucajte `anthropics/claude-code-action@v1` na konkretan commit SHA.

Claude GitHub App nije potrebna: workflow radi sa ugrađenim `GITHUB_TOKEN`.

## Troškovi i limiti

- Automatska analiza: do 35 koraka i najviše ~1,50 $ po pokretanju (`--max-budget-usd`).
- Dubinska analiza: do 60 koraka i najviše ~4 $ po pokretanju.
- Pravi limit je mesečni limit potrošnje na workspace-u u Console-u.
