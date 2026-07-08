# Editorial devices — AtomSN Theme

> Language: English (canonical for AI agents). Versión en español: [editorial-es.md](editorial-es.md)

> **Version:** 2.0 · **Platform:** Flutter (mobile-first + web) · **Themes:** light "AtomSN Light" / dark "AtomSN Dark"

## Visual direction

This chapter does not exist in the previous system. It documents the **newspaper tooling** (editorial devices) that AtomSN adds on top of the color, typography and spacing foundation: the concrete pieces that make a results screen read like a sports press page and not like a neutral UI.

All the tooling resolves to existing tokens in `tokens.json`. It introduces no new tokens: it combines rules (`border.*`), ink (`color.ink.*`), paper (`color.paper.*`), duotone typography (serif `text.masthead`/`text.headline` + sans `text.*`) and the editorial semantics (`accent.ink`, `highlight.mark`, `status.live`, `text.overline`, `spacing.column.gap`, `spacing.overline.gap`).

Cross-cutting principles:

- The newspaper organizes with **rules**, not with shadows or boxes. What separates blocks is an edge, not an elevated surface.
- Competition figures (scores, minutes, stats, table columns) are always **tabular**. The grid must not wobble.
- The serif (`Libre Caslon Display`, w400) is exclusive to masthead/headline at large sizes (≥20px). Kickers, labels, stats and body copy are sans (`ElmsSans`).
- The green accent remains scarce; the editorial tooling is mostly **ink on paper** (`ink.*` / `paper.*`), plus occasional red `status.live` and yellow wash `highlight.mark`.
- Square corners: rules, stamps and tables use `radius.none`.

---

## 1. Rules / hairline edges

**Name:** hairline rule / section rule.
**Purpose:** separate rows, items and editorial blocks with an ink edge instead of a box or a shadow. It is the newspaper's primary layout tool.

**Tokens involved:**

| Element | Thickness | Color (light → dark) | Radius |
|---|---|---|---|
| Hairline edge | `border.hairline` (1px) | `border.hairline` = `paper.300` → `paper.700` | `radius.none` |
| Section rule | `border.section` (2px) | `border.section` = `ink.500` → `paper.400` | `radius.none` |

**Usage guidance in a football app:**

- **Hairline (1px):** separator between rows of a standings table, between matches of a matchday, between lines of a match report (goals, cards, substitutions), bottom border of a list header. The surrounding air comes from `space.*` (see spacing.md), never from the thickness.
- **Section (2px):** under the screen or section masthead/nameplate ("STANDINGS", "MATCHDAY 12"), and to separate major editorial blocks (e.g. "TODAY'S MATCHES" from "YESTERDAY'S RESULTS"). Always with `space.4` of air above/below.
- Do not invent intermediate thicknesses: only `border.hairline` and `border.section`.
- In dark, the edge does not disappear: `paper.700` over `ink.bg` keeps the separation; the section rule steps up to `paper.400` to preserve presence.

Flutter example in the pseudocode block of the final section.

---

## 2. Masthead

**Name:** masthead / nameplate (section header as mini-masthead).
**Purpose:** give each screen or section the header of a newspaper: a high-contrast serif block, a section rule below it and a date/matchday line that places the content in competition time.

**Tokens involved:**

- Title block: `text.masthead.xl` (serif 6xl/48px, screen nameplate) or `text.masthead.lg` (serif 4xl/32px). Color `text.primary` (`ink.700` light / `paper.100` dark) or `accent.ink` for maximum contrast.
- Rule under the masthead: `border.section` (2px) with color `border.section`.
- Date/matchday line: `text.overline` (uppercase kicker) or `text.caption`, color `text.secondary` / `text.tertiary`.
- Air: `space.4` between title and rule, `space.4`–`space.6` below the rule before the content.

**Usage guidance in a football app:**

- **Screen masthead:** the competition home or the "Liga Local 2026" header uses `text.masthead.xl`. Only one per screen; it is the nameplate.
- **Section mini-masthead:** secondary screen headers ("STANDINGS", "TOP SCORERS", "CALENDAR") use `text.masthead.lg` + section rule + context overline.
- **Date/matchday line:** just below or above the masthead, in `text.overline`: "MATCHDAY 12 · 17 JUN 2026". It is what turns the header into a newspaper front page.
- The serif never goes below 20px and is never used in body copy: the masthead is its territory. Subtitles, descriptions and header metadata go in sans (`text.body.*`, `text.caption`, `text.overline`).

---

## 3. Kickers / overlines

**Name:** kicker (uppercase editorial overline).
**Purpose:** label a headline or block with a short line of spaced uppercase letters, in the style of a press kicker. It classifies the content before it is read.

**Tokens involved:**

- Composition: `text.overline` — sans, 12px (`size.sm`), semibold, `lineHeight.tight`, `tracking.kicker` (0.08em), `transform: uppercase`.
- Color: `text.secondary` / `text.tertiary` for neutral context; `status.liveText` for "LIVE"; `accent.ink` to highlight it as a textual stamp.
- Separation from the headline: `spacing.overline.gap` (= `space.1`, 4px). The overline sticks to its headline to read as one unit.

**Usage guidance in a football app:**

- Grouping labels: `"GRUPO A"`, `"GRUPO B"` above a standings table.
- Temporal state: `"EN VIVO"` (color `status.liveText`), `"FINALIZADO"`, `"DESCANSO"`.
- Calendar context: `"JORNADA 12"`, `"CUARTOS DE FINAL"`, `"HOY"`.
- Always uppercase with `tracking.kicker`; the letter spacing is what gives the kicker feel. Do not use the serif here: the kicker is sans.
- A kicker leads; it is not used as body copy or as data. For numeric data use `text.stat.*` (see section 5).

---

## 4. Dotted leaders in standings tables

**Name:** dotted leaders.
**Purpose:** connect a team's name to its value (points) with a line of dots that fills the remaining space, like a table of contents or a printed press sheet. It guides the eye across the row without needing vertical borders.

**Tokens involved:**

- Dotted fill: dotted in color `paper.400` (`border.strong` light), the token flagged in `tokens.json` as "dotted leaders".
- Team name: `text.body.md` or `text.label.lg`, color `text.primary`.
- Value (points): `text.stat.md` or `text.title.lg` with **tabular figures** (see section 5), color `text.primary` or `accent.ink`.
- Row on a square grid: `radius.none`, separated from the next by `border.hairline`.
- Gutter between the table columns (PJ, G, E, P, GF, GC, Pts): `spacing.column.gap` (16px).

**Row example (standings):**

```text
1   ATLÉTICO LOCAL ······························  34
2   DEPORTIVO RÍO ······························   31
3   UNIÓN VALLE ································   29
```

The name anchors to the left, the points to the right, and the dotted fill in `paper.400` occupies the variable gutter between them. The position number and the points are tabular so the columns do not wobble between rows.

Flutter pseudocode in the final section.

---

## 5. Tabular figures

**Name:** tabular figures.
**Purpose:** make all digits occupy the same width, so that scores, minutes, stats and table columns stay perfectly aligned vertically and do not "jump" when updated live.

**Tokens involved:**

- Compositions with `tabular: true` in `tokens.json`: `text.display.score` (main scoreboard, sans extrabold 60px), `text.display.stat` (40px), `text.stat.lg` (24px), `text.stat.md` (18px).
- In Flutter it is enabled with `fontFeatures: [FontFeature.tabularFigures()]` on the sans family `ElmsSans`.

**Usage guidance in a football app — mandatory in:**

- **Scores:** `2 - 1` in the match header (`text.display.score`).
- **Minutes / clock:** `45'+2`, `90:00` (`text.stat.md`).
- **Stats:** possession, shots, fouls, scorers (`text.stat.lg` / `text.display.stat`).
- **Table columns:** PJ, G, E, P, GF, GC, DG, Pts of the standings; any numeric column.
- The serif does not carry tabular figures: competition numbers are always sans. The serif only headlines.

---

## 6. Column gutters

**Name:** column gutter.
**Purpose:** a single fixed gutter between columns, like the space between the columns of a newspaper. It applies to tables, match grids and 2+ column web layouts.

**Tokens involved:**

- `spacing.column.gap` = `space.4` (16px). Single and fixed (see spacing.md).

**Usage guidance in a football app:**

- Separation between the stat columns of a standings table (PJ … Pts).
- Separation between match cards in a grid (web / tablet view).
- On the web at two columns (e.g. standings + latest results), the gutter between major columns is `spacing.column.gap`.
- Do not use variable or arbitrary gutters: a single gutter keeps the page rhythm.

---

## 7. "LIVE" chip

**Name:** live chip (live indicator).
**Purpose:** flag a live match with a red-ink dot + an uppercase overline, without a shiny or glossy badge. Editorial, not video-game.

**Tokens involved:**

- Dot: fill `status.live` (`red.500` light / `red.400` dark), circular shape `radius.full`.
- Text: `text.overline` in color `status.liveText` (`red.700` light / `red.300` dark) — the TEXT-on-paper value that passes AA, not the fill one.
- Dot ↔ text separation: `spacing.inline.xs` (4px) or `spacing.inline.sm` (8px).

**Usage guidance in a football app:**

- Composition: `● EN VIVO` or `● EN VIVO · 67'`, the minute in tabular `text.stat.md`.
- The dot may pulse (opacity animation), but the chip carries no saturated color background, no filled pill-style rounded border, no gradient. The emphasis comes from the red dot + the overline, on paper.
- Color rule: the dot uses `status.live` (fill), the text uses `status.liveText` (AA text). Do not paint the text with `red.500`.

---

## 8. "Marker" highlight

**Name:** marker highlight (editorial highlighter underline).
**Purpose:** highlight a key figure with a soft yellow wash behind it, like running a highlighter over a newspaper clipping. For records, leaders and standout stats.

**Tokens involved:**

- Background wash: `highlight.mark` (`yellow.100` light / `yellow.700` dark, dimmed for dark backgrounds).
- Text on top: keeps its normal token (`text.primary` / `accent.ink`); the wash must not reduce the contrast below AA.
- Shape: block behind the text; square corners or `radius.xs` at most — it is a marker stroke, not a pill.

**Usage guidance in a football app:**

- Behind the table's top scorer, the unbeaten record, the winning streak, the matchday's "Pichichi".
- Behind a standout stat on the match sheet (e.g. the player with the most completed passes).
- Scarce: if everything is highlighted, nothing is highlighted. One or two per screen.
- In dark, `highlight.mark` resolves to `yellow.700` (dimmed wash) so it does not glare over `ink.bg`; verify that the text on top remains AA.
- Do not confuse it with the yellow card: the card uses `status.warning` (`yellow.500` fill) / `status.warningText`. The marker is `yellow.100`, highlight function.

---

## 9. Ink stamps

**Name:** ink stamp.
**Purpose:** stamp a definitive state with a solid ink block and inverted text, like the "FINAL" or "PAID" stamp of a newspaper/printed document. Maximum contrast, square corners.

**Tokens involved:**

- Stamp fill: `accent.ink` (`ink.900` light / `paper.100` dark — in dark the high-contrast stamp is paper).
- Text on the stamp: inverted — `text.inverse` (`paper.50` light / `ink.900` dark), in `text.overline` (uppercase, kicker tracking).
- Shape: `radius.none` (square block), padding `spacing.button.padding.sm` (12×8).

**Usage guidance in a football app:**

- `"FINAL"` over a finished match, `"HOY"` over the day's matchday, `"APLAZADO"`, `"DESCANSO"`.
- The stamp is a solid square block; do not round it, do not add a shadow or gradient. Its strength is the full ink + the text inversion.
- One per element: the stamp marks the dominant state of the match card; it does not stack with other stamps.
- Difference from the LIVE chip (section 7): LIVE is dot + overline with no background (ongoing state); the stamp is a filled block (closed/definitive state).

---

## 10. Texture / halftone (OPTIONAL — off by default)

**Name:** editorial texture / halftone (optional).
**Purpose:** hint at the print screen of newspaper stock with a very faint grain or halftone over the background. It is a finish, not a component.

**Status:** **optional and disabled by default.** It is not part of the base render and must not be enabled if it compromises contrast.

**Tokens involved:**

- There is no texture token in `tokens.json`: it is a finishing overlay, not a chromatic decision of the system.
- If applied, the overlay must be built with the paper/ink family of the active mode (e.g. a `paper.300`/`ink.500` speckle) at **≤3–4% opacity**, never with a color foreign to the palette.

**Usage guidance in a football app:**

- At most, a subtle grain on large header backgrounds or in empty states; never over tables, scoreboards or body text.
- Hard constraint: the texture **never** comes at the cost of contrast. If it reduces the legibility of text/figures below AA, it is not used.
- Off by default: it must be an explicit preference, not the theme's base state. Result legibility rules over the effect.

---

## Flutter pseudocode examples

> Colors are taken from the active theme (light "AtomSN Light" / dark "AtomSN Dark") by resolving the corresponding semantic token; here they are annotated as comments.

### Hairline rule between rows

```dart
// border.hairline (1px) · color border.hairline (paper.300 light / paper.700 dark)
// Recta (radius.none implícito en Divider) y sin sombra.
final Divider hairline = Divider(
  height: 1,
  thickness: 1, // border.hairline
  color: theme.borderHairline, // paper.300 light / paper.700 dark
);

// Regla de sección bajo un masthead: border.section (2px) + space.4 de aire.
final Container sectionRule = Container(
  margin: const EdgeInsets.symmetric(vertical: 16), // space.4 de aire
  height: 2, // border.section
  color: theme.borderSection, // ink.500 light / paper.400 dark
);
```

### Standings row with dotted leader and tabular figures

```dart
// Tabla recta (radius.none), filas separadas por hairline, puntos tabulares,
// relleno dotted en paper.400 entre nombre y puntos.
Widget standingsRow({
  required int position,
  required String team,
  required int points,
}) {
  const tabular = TextStyle(
    fontFamily: 'ElmsSans',
    fontFeatures: [FontFeature.tabularFigures()], // cifras tabulares obligatorias
  );

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // spacing.card.padding.sm-ish
    child: Row(
      children: [
        // Posición — tabular, text.stat.md
        Text('$position', style: tabular.copyWith(/* text.stat.md, text.primary */)),
        const SizedBox(width: 16), // spacing.column.gap
        // Nombre del equipo — text.label.lg / text.body.md, ink.700
        Text(team.toUpperCase(), style: const TextStyle(/* text.label.lg, text.primary */)),
        // Líder punteado: relleno dotted paper.400 que ocupa el medianil variable
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DottedLeader(color: theme.paper400), // dotted, paper.400 (border.strong)
          ),
        ),
        // Puntos — tabular, text.stat.md / accent.ink
        Text('$points', style: tabular.copyWith(/* text.stat.md, accent.ink */)),
      ],
    ),
  );
}

// DottedLeader: línea de puntos repetidos (CustomPaint o fila de '·').
// El color sale de paper.400; el grosor del punto es hairline.
```

### LIVE chip (dot + overline, no glossy)

```dart
// Dot status.live (red.500) + text.overline en status.liveText (red.700, AA).
Widget liveChip(String minute) => Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Container(
      width: 8, height: 8,
      decoration: BoxDecoration(
        color: theme.statusLive, // red.500 light / red.400 dark (RELLENO)
        shape: BoxShape.circle,  // radius.full
      ),
    ),
    const SizedBox(width: 4), // spacing.inline.xs
    Text('EN VIVO · $minute', style: const TextStyle(
      /* text.overline: sans 12px semibold, tracking.kicker, uppercase */
      /* color: status.liveText (red.700 light / red.300 dark) — TEXTO AA */
    )),
  ],
);
```

### "FINAL" ink stamp

```dart
// Bloque relleno accent.ink (ink.900), texto invertido, radius.none.
Widget inkStamp(String label) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // spacing.button.padding.sm
  decoration: BoxDecoration(
    color: theme.accentInk,      // ink.900 light / paper.100 dark
    borderRadius: BorderRadius.zero, // radius.none
  ),
  child: Text(label.toUpperCase(), style: const TextStyle(
    /* text.overline: sans semibold, tracking.kicker, uppercase */
    /* color: text.inverse (paper.50 light / ink.900 dark) */
  )),
);
// inkStamp('FINAL') · inkStamp('HOY')
```

---

## Device summary

| # | Device | Key tokens | Radius |
|---|---|---|---|
| 1 | Hairline / section rules | `border.hairline` (paper.300), `border.section` (ink.500) | `radius.none` |
| 2 | Masthead | `text.masthead.*` (serif), `border.section`, `text.overline` | `radius.none` (rule) |
| 3 | Kicker / overline | `text.overline`, `tracking.kicker`, `spacing.overline.gap` | — |
| 4 | Dotted leaders | dotted `paper.400`, `text.stat.*` tabular, `spacing.column.gap` | `radius.none` |
| 5 | Tabular figures | `text.display.score/stat`, `text.stat.lg/md` (`tabular: true`) | — |
| 6 | Column gutter | `spacing.column.gap` (space.4) | — |
| 7 | LIVE chip | `status.live` (dot) + `status.liveText` (text) + `text.overline` | `radius.full` (dot) |
| 8 | Marker highlight | `highlight.mark` (yellow.100 / yellow.700 dark) | `radius.none`/`xs` |
| 9 | Ink stamp | `accent.ink` (ink.900) + `text.inverse` + `text.overline` | `radius.none` |
| 10 | Halftone texture (optional) | no token; overlay ≤3–4% with the mode's paper/ink | — |
```
