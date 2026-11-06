# NPS Support

Javni repozitorijum za prijave klijenata (greške, predlozi, pitanja) za Business Central ekstenzije firme NPS,
i dokumentacija ekstenzija.

- Jezik: srpski latinica; nazive BC objekata, polja i AL termine ostavi na engleskom kako se zovu u sistemu.
- Tačnost: ako nisi siguran da objekat, polje ili procedura postoji, reci to — ne izmišljaj nazive.
- Kod naših ekstenzija nije u ovom repozitorijumu (privatni repoi u organizaciji NPSBeograd).
- `doc/docs/` — dokumentacija ekstenzija (Docusaurus sajt npsbeograd.github.io).
- `packages/` — RapidStart konfiguracioni paketi po ekstenzijama.
- Kada workflow pokrene analizu, standardni W1 kod Business Central-a je u `bc-standard/`
  (iz StefanMaron/MSDyn365BC.Code.History). Pretražuj ga ciljano (Grep), ne čitaj ceo folder.
- Analizu prijava radi skill `nps-triage` (`.claude/skills/nps-triage/SKILL.md`), opis toka je u `.github/claude/README.md`.
