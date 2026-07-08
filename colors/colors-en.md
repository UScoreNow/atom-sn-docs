# Color System — AtomSN editorial theme

> Language: English (canonical for AI agents). Versión en español: [colors-es.md](colors-es.md)

> **Version:** 2.0 · **Platform:** Flutter (mobile-first + web) · **Themes:** light "AtomSN Light" / dark "AtomSN Dark"

## Visual direction

The color system evolves from the previous neutral minimalism (cold grays + a single green) toward the feel of a **real newspaper**. Four materials define the palette:

- **Cream paper:** the base is no longer cold gray but a warm paper-like ramp (`color.paper.*`). Slightly tinted paper reduces eye strain, adds depth without pure whites, and evokes printed sports press.
- **Warm ink:** text and highlights are ink (`color.ink.*`), a black carrying a whisper of the paper tone so it does not feel cold on cream. `ink.900` (`#0E0D0A`) is the darkest ink black: stamps, masthead, and highlights.
- **Warm grass green:** the single interaction accent (`color.green.*`). Scarce: only actions, active/selected states, and positive deltas.
- **Ink black:** the second editorial accent, reserved for highlights and stamps (`accent.ink`).

Everything that is not an action should feel like **ink on paper**.

---

## Principles

- The interface lives on cream paper, not on screen white.
- Green highlights actions, active states, and key elements; it never decorates.
- Ink black (`ink.900`) is for high-contrast highlights and editorial stamps ("FINAL"), not for body text (that is `ink.700`).
- The light theme "AtomSN Light" uses a cream background, ink for text, and green/black accents.
- The dark theme "AtomSN Dark" uses an ink background, cream text, and light-green/paper accents.
- Components never define their own colors: they consume semantic tokens exclusively.
- The base palette is a foundational layer; it is not used directly in product.

---

## Base constraints

- Lightest paper allowed: `color.paper.50` (`#FBF8F0`).
- Darkest ink allowed (legal black): `color.ink.900` (`#0E0D0A`).
- **Pure white (`#FFFFFF`) is forbidden.** It does not exist in the system and must not be used under any circumstance.
- **Pure black (`#000000`) is forbidden.** The darkest black in the system is `ink.900` (`#0E0D0A`); "black" highlights always resolve there.
- **Green is scarce.** Only actions, active/selected states, and positive deltas. Do not use it for large surfaces or as decoration.
- Indigo is kept from the previous system, but **only for `status.info`** and sparingly. It is not a navigation or action color.

---

## Naming convention

```text
# Base tokens (raw palette — foundational layer):
color.{family}.{scale}

# Semantic tokens (product usage), per mode (light / dark):
color.{category}.{role}
text.{group}.{level}
```

Base examples: `color.paper.50`, `color.ink.900`, `color.green.500`
Semantic examples: `bg.base`, `text.primary`, `action.primary`, `accent.ink`, `border.hairline`, `status.liveText`, `highlight.mark`

---

## Base palette

Raw system values. Do not use directly in components. Hex, role, and usage as in `tokens.json`.

```yaml
raw_palette:

  paper:
    # Warm cream neutral ramp. Replaces the cold gray ramp of the previous system.
    - token: color.paper.50
      hex: "#FBF8F0"
      role: lightest paper
      usage: app background (light)

    - token: color.paper.100
      hex: "#F5F0E3"
      role: elevated surface / cards
      usage: primary text (dark)

    - token: color.paper.200
      hex: "#ECE4D2"
      role: tinted surface
      usage: hover, raised

    - token: color.paper.300
      hex: "#DCD2BC"
      role: borders and hairline rules (light)
      usage: border.default / border.hairline (light)

    - token: color.paper.400
      hex: "#C2B69D"
      role: strong border / disabled fill
      usage: dotted leaders in standings tables

    - token: color.paper.500
      hex: "#A6987C"
      role: muted text (dark) / neutral mid
      usage: text.muted

    - token: color.paper.600
      hex: "#857862"
      role: tertiary text (light)
      usage: text.tertiary (light)

    - token: color.paper.700
      hex: "#615847"
      role: secondary text (light) / border (dark)
      usage: text.secondary (light) / border.default (dark)

    - token: color.paper.800
      hex: "#403A30"
      role: warm elevated surface
      usage: dark raised (bg.raised dark)

    - token: color.paper.900
      hex: "#2B2820"
      role: darkest warm neutral
      usage: scale value

  ink:
    # Warm ink black (carries a whisper of the paper tone so it does not feel cold on cream).
    - token: color.ink.50
      hex: "#6E6A60"
      role: faint ink
      usage: captions

    - token: color.ink.100
      hex: "#514D44"
      role: medium-faint ink
      usage: scale value

    - token: color.ink.300
      hex: "#39362E"
      role: base surface (dark surface)
      usage: section rule / bg.surface (dark)

    - token: color.ink.500
      hex: "#26241E"
      role: standard ink
      usage: 2px section rule under masthead (border.section light)

    - token: color.ink.700
      hex: "#1A1814"
      role: headline ink
      usage: primary text (light) (text.primary)

    - token: color.ink.900
      hex: "#0E0D0A"
      role: ink BLACK
      usage: highlights, "FINAL" stamps, masthead, accent.ink. Darkest legal black.

    - token: color.ink.bg
      hex: "#16140F"
      role: base background of the dark theme
      usage: bg.base (dark "AtomSN Dark")

  green:
    # Warm grass green. Single interaction accent. Scarce.
    - token: color.green.50
      hex: "#EAF1E4"
      role: subtle green surface
      usage: action.subtle (light)

    - token: color.green.100
      hex: "#CDDFC0"
      role: light green
      usage: action.active (dark)

    - token: color.green.200
      hex: "#AECF96"
      role: soft green
      usage: active / action.hover (dark)

    - token: color.green.300
      hex: "#8FBE6F"
      role: primary action (dark)
      usage: action.primary / text.link / border.active (dark)

    - token: color.green.400
      hex: "#5FA453"
      role: mid green
      usage: scale value

    - token: color.green.500
      hex: "#3E8E45"
      role: primary accent (light)
      usage: action, active, brand (action.primary light)

    - token: color.green.600
      hex: "#327237"
      role: action hover (light)
      usage: action.hover (light)

    - token: color.green.700
      hex: "#27592C"
      role: green for text/links on paper (AA)
      usage: text.link / action.active / status.successText (light)

    - token: color.green.800
      hex: "#1D4421"
      role: very dark green
      usage: scale value

    - token: color.green.900
      hex: "#163518"
      role: deep green
      usage: scale value

  yellow:
    # Editorial mustard. Dual role: editorial "marker" highlight + yellow card/warning.
    - token: color.yellow.50
      hex: "#FBF4D8"
      role: very light yellow
      usage: scale value

    - token: color.yellow.100
      hex: "#F6E8BE"
      role: "marker" highlight wash
      usage: highlight.mark (light)

    - token: color.yellow.200
      hex: "#F0D89B"
      role: soft yellow
      usage: scale value

    - token: color.yellow.300
      hex: "#E8C863"
      role: kicker accents / warning (dark)
      usage: status.warning / status.warningText (dark)

    - token: color.yellow.400
      hex: "#DFB740"
      role: mid yellow
      usage: scale value

    - token: color.yellow.500
      hex: "#D6A52E"
      role: yellow card / warning (light)
      usage: status.warning (light, FILL)

    - token: color.yellow.600
      hex: "#B98A1F"
      role: strong yellow
      usage: scale value

    - token: color.yellow.700
      hex: "#9A7416"
      role: yellow for text on paper (AA)
      usage: highlight.mark dimmed wash (dark)

    - token: color.yellow.800
      hex: "#7A5B13"
      role: very dark yellow
      usage: status.warningText (light, full AA on small text)

    - token: color.yellow.900
      hex: "#5C4410"
      role: deep yellow
      usage: scale value

  red:
    # Warm ink brick. Live / error / critical state.
    - token: color.red.50
      hex: "#F7E6E4"
      role: very light red
      usage: scale value

    - token: color.red.100
      hex: "#EFC9C6"
      role: light red
      usage: scale value

    - token: color.red.200
      hex: "#E29E99"
      role: soft red
      usage: scale value

    - token: color.red.300
      hex: "#D5736C"
      role: light-mid red
      usage: status.liveText / status.errorText (dark, AA on dark background)

    - token: color.red.400
      hex: "#CC554D"
      role: live/error (dark)
      usage: status.live / status.error (dark, FILL)

    - token: color.red.500
      hex: "#C5403A"
      role: live/error (light)
      usage: pulsing dot, alerts (status.live / status.error light, FILL)

    - token: color.red.600
      hex: "#A8332E"
      role: strong red
      usage: scale value

    - token: color.red.700
      hex: "#8C2A26"
      role: red for text on paper (AA)
      usage: status.liveText / status.errorText (light)

    - token: color.red.800
      hex: "#6E211E"
      role: very dark red
      usage: scale value

    - token: color.red.900
      hex: "#511817"
      role: deep red
      usage: scale value

  indigo:
    # Neutral information / complementary stats. Kept from the previous system; scarce use and only for status.info.
    - token: color.indigo.50
      hex: "#EEF2FF"
      role: very light indigo
      usage: scale value

    - token: color.indigo.100
      hex: "#E0E7FF"
      role: light indigo
      usage: scale value

    - token: color.indigo.200
      hex: "#C7D2FE"
      role: soft indigo
      usage: scale value

    - token: color.indigo.300
      hex: "#A5B4FC"
      role: light-mid indigo
      usage: scale value

    - token: color.indigo.400
      hex: "#818CF8"
      role: info (dark)
      usage: status.info / status.infoText (dark)

    - token: color.indigo.500
      hex: "#6366F1"
      role: info (light)
      usage: status.info (light, FILL)

    - token: color.indigo.600
      hex: "#4F46E5"
      role: strong indigo
      usage: scale value

    - token: color.indigo.700
      hex: "#4338CA"
      role: info for text on paper
      usage: status.infoText (light)

    - token: color.indigo.800
      hex: "#3730A3"
      role: very dark indigo
      usage: scale value

    - token: color.indigo.900
      hex: "#312E81"
      role: deep indigo
      usage: scale value
```

---

## Fill-vs-text rule

The `*.500` tokens of the status families (`green`/`yellow`/`red`) are **FILL/ICON** colors: dots, chip backgrounds, status icons. Their `*.700`/`*.800` variants are the **TEXT on paper** colors and meet AA.

- `status.live` / `status.error` / `status.success` / `status.warning` / `status.info` → fill (`*.500`, yellow.500, indigo.500).
- `status.liveText` / `status.errorText` / `status.successText` / `status.warningText` / `status.infoText` → text on paper (`red.700`, `green.700`, `yellow.800`, `indigo.700`).
- In **dark "AtomSN Dark"**, status text uses lighter variants (`*.300`/`*.400`: `red.300`, `green.300`, `yellow.300`, `indigo.400`) to keep AA on the ink background.

Do not use `*.500` as a small-text color on paper: it does not meet contrast.

---

## Semantic tokens

Product-usage layer. Components consume **only** these tokens. Each token resolves to a base token per mode (`semantic.light` "AtomSN Light" / `semantic.dark` "AtomSN Dark").

```yaml
semantic_tokens:

  bg:
    - token: bg.base
      description: base background of the app and scaffolds
      light: color.paper.50    # #FBF8F0 — cream paper, never pure white
      dark: color.ink.bg       # #16140F

    - token: bg.surface
      description: elevated surfaces — cards, sheets, modals
      light: color.paper.100   # #F5F0E3
      dark: color.ink.300      # #39362E

    - token: bg.raised
      description: raised surface / warm elevation
      light: color.paper.200   # #ECE4D2
      dark: color.paper.800    # #403A30

    - token: bg.subtle
      description: backgrounds of internal sections, groupings
      light: color.paper.100   # #F5F0E3
      dark: color.ink.300      # #39362E

    - token: bg.overlay
      description: overlay for modals and bottom sheets
      light: color.ink.900     # #0E0D0A — use with 0.5 opacity
      dark: color.ink.900      # #0E0D0A — use with 0.7 opacity

    - token: bg.inverse
      description: background of inverted elements (snackbars, tooltips)
      light: color.ink.900     # #0E0D0A
      dark: color.paper.50     # #FBF8F0

  text:
    - token: text.primary
      description: main high-hierarchy text
      light: color.ink.700     # #1A1814 — 16.7:1 on paper.50 ✓ AAA
      dark: color.paper.100    # #F5F0E3 — 16.2:1 on ink.bg ✓ AAA

    - token: text.secondary
      description: supporting text, subtitles
      light: color.paper.700   # #615847 — 6.6:1 on paper.50 ✓ AA
      dark: color.paper.400    # #C2B69D — 9.2:1 on ink.bg ✓ AAA

    - token: text.tertiary
      description: faint text, metadata, timestamps
      light: color.paper.600   # #857862 — 4.1:1 (decorative / large)
      dark: color.paper.500    # #A6987C

    - token: text.muted
      description: faintest, non-essential text
      light: color.paper.500   # #A6987C
      dark: color.paper.500    # #A6987C

    - token: text.disabled
      description: text of inactive controls
      light: color.paper.400   # #C2B69D
      dark: color.paper.700    # #615847

    - token: text.inverse
      description: text on inverted backgrounds (bg.inverse)
      light: color.paper.50    # #FBF8F0
      dark: color.ink.900      # #0E0D0A

    - token: text.onPrimary
      description: text on green action fill
      light: color.paper.50    # #FBF8F0 — 3.8:1 on green.500 ✓ AA large (bold ≥14px)
      dark: color.ink.900      # #0E0D0A — dark ink on green.300

    - token: text.link
      description: text with a navigation or link action
      light: color.green.700   # #27592C — 7.8:1 on paper.50 ✓ AAA
      dark: color.green.300    # #8FBE6F — 8.6:1 on ink.bg ✓ AAA

  action:
    - token: action.primary
      description: base state of primary buttons, active tabs, action controls
      light: color.green.500   # #3E8E45
      dark: color.green.300    # #8FBE6F

    - token: action.hover
      description: hover/focus state (web/desktop Flutter)
      light: color.green.600   # #327237
      dark: color.green.200    # #AECF96

    - token: action.active
      description: pressed state of the tap
      light: color.green.700   # #27592C
      dark: color.green.100    # #CDDFC0

    - token: action.disabled
      description: disabled state of controls
      light: color.paper.300   # #DCD2BC
      dark: color.paper.700    # #615847

    - token: action.subtle
      description: subtle background when hovering/selecting list and navigation items
      light: color.green.50    # #EAF1E4
      dark: color.ink.300      # #39362E

  accent:
    - token: accent.ink
      description: editorial highlights and stamps in ink black ("FINAL"); in dark the high-contrast stamp is paper
      light: color.ink.900     # #0E0D0A
      dark: color.paper.100    # #F5F0E3

  border:
    - token: border.default
      description: standard border for inputs, cards, and general dividers
      light: color.paper.300   # #DCD2BC
      dark: color.paper.700    # #615847

    - token: border.subtle
      description: very soft internal dividers between sections
      light: color.paper.200   # #ECE4D2
      dark: color.ink.300      # #39362E

    - token: border.strong
      description: emphasis border, focus ring, prominent separators
      light: color.paper.400   # #C2B69D
      dark: color.paper.500    # #A6987C

    - token: border.active
      description: border of a selected, focused, or persistently active element
      light: color.green.500   # #3E8E45
      dark: color.green.300    # #8FBE6F

    - token: border.hairline
      description: thin 1px editorial rule (hairline edges between rows/sections)
      light: color.paper.300   # #DCD2BC
      dark: color.paper.700    # #615847

    - token: border.section
      description: 2px section rule under masthead
      light: color.ink.500     # #26241E
      dark: color.paper.400    # #C2B69D

  status:
    - token: status.live
      description: in-progress match indicator — pulsing red dot (FILL)
      light: color.red.500     # #C5403A
      dark: color.red.400      # #CC554D

    - token: status.liveText
      description: "LIVE" text on paper
      light: color.red.700     # #8C2A26 — 8.0:1 on paper.50 ✓ AAA
      dark: color.red.300      # #D5736C — 5.7:1 on ink.bg ✓ AA

    - token: status.error
      description: error, critical state, destructive alert (FILL)
      light: color.red.500     # #C5403A
      dark: color.red.400      # #CC554D

    - token: status.errorText
      description: error text on paper
      light: color.red.700     # #8C2A26 — 8.0:1 on paper.50 ✓ AAA
      dark: color.red.300      # #D5736C — 5.7:1 on ink.bg ✓ AA

    - token: status.success
      description: confirmation, positive result (FILL)
      light: color.green.500   # #3E8E45
      dark: color.green.300    # #8FBE6F

    - token: status.successText
      description: success text / positive delta on paper
      light: color.green.700   # #27592C — 7.8:1 on paper.50 ✓ AAA
      dark: color.green.300    # #8FBE6F — 8.6:1 on ink.bg ✓ AAA

    - token: status.warning
      description: warning, yellow card (FILL)
      light: color.yellow.500  # #D6A52E
      dark: color.yellow.300   # #E8C863

    - token: status.warningText
      description: warning text on paper
      light: color.yellow.800  # #7A5B13 — 5.9:1 on paper.50 ✓ AA (full AA on small text)
      dark: color.yellow.300   # #E8C863

    - token: status.info
      description: neutral information, complementary stats (FILL)
      light: color.indigo.500  # #6366F1
      dark: color.indigo.400   # #818CF8

    - token: status.infoText
      description: informational text on paper
      light: color.indigo.700  # #4338CA — 7.5:1 on paper.50 ✓ AAA
      dark: color.indigo.400   # #818CF8

  highlight:
    - token: highlight.mark
      description: "marker" wash behind key stats/records
      light: color.yellow.100  # #F6E8BE
      dark: color.yellow.700   # #9A7416 — dimmed wash for dark background
```

---

## Accessibility and contrast

Key color pairs of the system with verified WCAG ratios.

### AtomSN Light (on `paper.50` #FBF8F0)

| Pair | Ratio | WCAG |
|---|---|---|
| `text.primary` (`ink.700`) on `bg.base` | 16.7:1 | AAA ✓ |
| `text.secondary` (`paper.700`) on `bg.base` | 6.6:1 | AA ✓ |
| `text.tertiary` (`paper.600`) on `bg.base` | 4.1:1 | decorative / large ✓ |
| `text.link` / `status.successText` (`green.700`) on `bg.base` | 7.8:1 | AAA ✓ |
| `status.liveText` / `status.errorText` (`red.700`) on `bg.base` | 8.0:1 | AAA ✓ |
| `status.warningText` (`yellow.800`) on `bg.base` | 5.9:1 | AA ✓ |
| `status.infoText` (`indigo.700`) on `bg.base` | 7.5:1 | AAA ✓ |
| `text.onPrimary` (`paper.50`) on `action.primary` (`green.500`) | 3.8:1 | AA large ✓ (bold ≥14px only) |

### AtomSN Dark (on `ink.bg` #16140F)

| Pair | Ratio | WCAG |
|---|---|---|
| `text.primary` (`paper.100`) on `bg.base` | 16.2:1 | AAA ✓ |
| `text.secondary` (`paper.400`) on `bg.base` | 9.2:1 | AAA ✓ |
| `text.link` / `status.successText` (`green.300`) on `bg.base` | 8.6:1 | AAA ✓ |
| `status.liveText` / `status.errorText` (`red.300`) on `bg.base` | 5.7:1 | AA ✓ |

> `text.tertiary` (`paper.600`, 4.1:1) does not reach AA on small text: use it only for non-essential information (timestamps, metadata) or large text. Never for critical content or actions.
>
> `text.onPrimary` on the action green (3.8:1) is only valid for **bold ≥14px** text (AA large). For fine text on green, increase the weight or use an ink fill.
