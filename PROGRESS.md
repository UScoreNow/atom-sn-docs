# PROGRESS — atom-sn-docs

State as of 2026-07-08 (update when a chapter changes state).

## Done

- Rebrand to **AtomSN**: repo, tokens, docs and preview renamed; the retired
  pre-rebrand theme names removed (PR #6, merged 2026-06-25; list in `CONSTRAINTS.md`).
- Repo converted to documentation-only; Flutter implementation moved to
  `UScoreNow/atom-sn-flutter` (PR #2).
- Contribution flow + release-please automation (PR #3); release 0.2.0 published.
- Chapters populated: `tokens/`, `colors/`, `fonts/`, `icons/`, `spacing/`, `editorial/`.
- Typography unified on a single family (ElmsSans); `font.family.serif` kept as a
  historical alias resolving to ElmsSans.
- Bilingual split: every topic doc and the README exist as `-es` / `-en` pairs;
  agent entry file (`AGENTS.md`), `CONSTRAINTS.md` and `make check` added (this branch).

## In progress

- Nothing active beyond this branch.

## Known gaps / notes

- README notes `Libre Caslon Display` as a documented serif exception, but
  `tokens.json` now resolves `font.family.serif` to ElmsSans (single-family
  unification). The README exception text is historical context; tokens win.
- `preview/index.html` is a hand-maintained mirror of the tokens, not generated —
  verify it visually after token changes.
