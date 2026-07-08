# CONSTRAINTS — atom-sn-docs

Hard rules with source and applicability. Each traces to the tokens file
(`tokens/tokens.json` `$meta.rules`), the README principles, or an explicit
owner directive. Remove a rule only when its source disappears.

## Tokens

- MUST treat `tokens/tokens.json` (DTCG) as the single source of truth for every
  color, size, weight, radius and rule. *(Source: README "Fuente única de verdad".)*
- MUST NOT use pure `#000000` or `#FFFFFF`. Darkest legal ink: `color.ink.900`
  `#0E0D0A`; lightest paper: `color.paper.50` `#FBF8F0`. *(Source: `$meta.rules.forbidden`.)*
- MUST consume only semantic tokens (`semantic.light.*` / `semantic.dark.*`) in
  product/components; base ramps are foundational. *(Source: README principles.)*
- MUST keep green scarce: actions, active/selected states, positive deltas only.
  *(Source: `$meta.rules.accentScarcity`.)*
- MUST use `*.700`/`*.800` variants for status text on paper (AA); `*.500` are
  fill/icon only. In dark mode use `*.300`/`*.400`. *(Source: `$meta.rules.fillVsText`.)*
- MUST NOT rename the base ramps (`color.paper.*`, `color.ink.*`, …): the Flutter
  implementation repo consumes these names. *(Source: rename decision, PR #6, 2026-06-25.)*

## Branding

- MUST use **AtomSN** as the system name; themes are "AtomSN Light" and
  "AtomSN Dark". MUST NOT reintroduce "Newsprint", "Night Press" or "Paper" as
  system/theme names — this applies to every repo depending on the design system.
  *(Source: owner directive, 2026-07-08.)*

## Documentation

- MUST keep every topic doc as an `-es.md` / `-en.md` pair and mirror edits in
  both languages in the same change. English is canonical for AI agents.
  *(Source: owner directive, 2026-07-08.)*
- MUST update the affected topic docs (both languages) whenever `tokens/tokens.json`
  changes. *(Source: decay guard, this file.)*

## Repo / flow

- Documentation-only repo: MUST NOT add application code; implementation lives in
  `UScoreNow/atom-sn-flutter`. *(Source: PR #2 "repo solo documentación".)*
- MUST follow the standard flow: working branch → PR to `dev` → PR to `main`
  (release-please). MUST NOT push directly to `main`/`dev`. *(Source: org contribution guidelines.)*
