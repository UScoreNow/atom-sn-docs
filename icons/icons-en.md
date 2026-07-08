# Icon System — UScoreNow AtomSN

> Language: English (canonical for AI agents). Versión en español: [icons-es.md](icons-es.md)

> **Version:** 2.0 · **Theme:** AtomSN · **Platform:** Flutter (mobile-first + web) · **Library:** Hugeicons

## Visual direction

Editorial icon system for a football tournament management app built in Flutter with Hugeicons.

The iconography should feel light, clear and structural, like the graphic tooling of a sports newspaper: a thin ink stroke on paper, with no fill and no drama. Icons accompany navigation, actions and product states, but never compete with the main content (serif headlines, tabular scoreboards, hairline rules). In AtomSN's editorial language the visual weight is carried by typography and rules; the icon is notation, not illustration.

---

## Principles

- The entire app must use Hugeicons as the single icon library.
- The primary style must be `strokeRounded`.
- Icons must inherit color from the Flutter theme system (`semantic.*` tokens) whenever possible.
- Icon size must depend on the usage context, not on each screen's taste.
- Stroke weight must stay stable across the app.
- Every important product semantic must map to a single primary icon.
- Decorative icons must be exceptional; most must serve navigation, action, status or entity-representation purposes.
- An icon never carries accent color for decoration: green (`action.primary`) marks interaction/active and is scarce; status colors (red/yellow/indigo) only appear on icons representing real status.

---

## Primary style constraint

- Single style: `strokeRounded` — it is the only style available and allowed in the system
- Do not mix `strokeRounded` with `sharp`, `standard`, `bulk`, `duotone` or any other style
- Do not use multiple visual styles for the same semantic
- State differentiation (active, selected) is achieved exclusively through color and opacity, never through a style change
- The `strokeRounded` stroke (soft corners) coexists with the theme's restrained radii; rules, stamps and tables use `radius.none`, but that affects containers, not the icon's internal drawing

---

## Naming convention

```text
icon.{dominio}.{nombre}
```

Examples:
- `icon.navigation.home`
- `icon.navigation.matches`
- `icon.navigation.standings`
- `icon.action.search`
- `icon.action.filter`
- `icon.status.live`
- `icon.status.warning`
- `icon.entity.team`
- `icon.entity.player`

---

## Technical foundations

```yaml
icon_foundation:
  library: "hugeicons"            # ^1.1.7
  flutter_package: "package:hugeicons/hugeicons.dart"
  primary_style: "strokeRounded"  # constantes HugeIcons.strokeRounded<Nombre>
  base_widget: "HugeIcon"
  token_map: "lib/theme/app_icons.dart"  # AppIcons: mapa canonico (semantica -> icono)
```

> **Canonical source of the mapping:** `lib/theme/app_icons.dart` (`AppIcons.*`). Components
> reference `AppIcons.navigationHome`, etc., never `HugeIcons.*` directly.
> Some actual hugeicons 1.1.7 identifiers differ from this catalog (written with the
> old convention `HugeIconsStrokeRounded.home01`): e.g. `trophy01`→`Champion`,
> `radioButton01`→`RadioButton`, `stadium`→`FootballPitch`, `user01`→`UserCircle`,
> `lock01`→`Lock`, `inbox01`→`Inbox`. `AppIcons` already uses the valid names.

---

## Semantic roles

```yaml
semantic_roles:
  navigation:
    description: icons for bottom navigation, tabs, secondary app bar and view switching
    examples:
      - home
      - calendar
      - trophy
      - chart
      - user

  actions:
    description: icons for direct user actions
    examples:
      - search
      - filter
      - notification
      - share
      - bookmark
      - edit

  status:
    description: icons for system states and match states
    examples:
      - live
      - time
      - check
      - alert
      - lock

  entities:
    description: icons representing objects of the football domain
    examples:
      - team
      - player
      - match
      - stadium
      - standings

  feedback:
    description: icons for empty states, confirmations and informational messages
    examples:
      - info
      - success
      - warning
      - error
```

---

## Approved icon catalog

Official system inventory. Before using an icon, verify it is listed here or add it following the decision checklist.

> Hugeicons identifiers must be verified against the official catalog at [hugeicons.com](https://hugeicons.com) before implementing.

```yaml
approved_icons:

  navigation:
    - semantic: icon.navigation.home
      stroke: HugeIconsStrokeRounded.home01

    - semantic: icon.navigation.matches
      stroke: HugeIconsStrokeRounded.calendar03

    - semantic: icon.navigation.standings
      stroke: HugeIconsStrokeRounded.chartLineData02

    - semantic: icon.navigation.competitions
      stroke: HugeIconsStrokeRounded.trophy01

    - semantic: icon.navigation.profile
      stroke: HugeIconsStrokeRounded.user01

  actions:
    - semantic: icon.action.search
      stroke: HugeIconsStrokeRounded.search01

    - semantic: icon.action.filter
      stroke: HugeIconsStrokeRounded.filterHorizontal

    - semantic: icon.action.notification
      stroke: HugeIconsStrokeRounded.notification03

    - semantic: icon.action.bookmark
      stroke: HugeIconsStrokeRounded.bookmark01

    - semantic: icon.action.share
      stroke: HugeIconsStrokeRounded.share01

    - semantic: icon.action.more
      stroke: HugeIconsStrokeRounded.moreVertical

    - semantic: icon.action.back
      stroke: HugeIconsStrokeRounded.arrowLeft01

    - semantic: icon.action.close
      stroke: HugeIconsStrokeRounded.cancel01

  status:
    - semantic: icon.status.live
      stroke: HugeIconsStrokeRounded.radioButton01
      note: >
        use semantic.status.live (red.500 light / red.400 dark) as a pulsing dot,
        accompanied by the "EN VIVO" overline (text.overline). See editorial note.

    - semantic: icon.status.time
      stroke: HugeIconsStrokeRounded.clock01

    - semantic: icon.status.check
      stroke: HugeIconsStrokeRounded.checkmarkCircle01

    - semantic: icon.status.alert
      stroke: HugeIconsStrokeRounded.alert02

    - semantic: icon.status.info
      stroke: HugeIconsStrokeRounded.informationCircle

    - semantic: icon.status.lock
      stroke: HugeIconsStrokeRounded.lock01

  entities:
    - semantic: icon.entity.team
      stroke: HugeIconsStrokeRounded.userGroup

    - semantic: icon.entity.player
      stroke: HugeIconsStrokeRounded.userStar01

    - semantic: icon.entity.stadium
      stroke: HugeIconsStrokeRounded.stadium

    - semantic: icon.entity.ball
      stroke: HugeIconsStrokeRounded.football

    - semantic: icon.entity.competition
      stroke: HugeIconsStrokeRounded.trophy01

  feedback:
    - semantic: icon.feedback.success
      stroke: HugeIconsStrokeRounded.checkmarkCircle02
      color: semantic.status.success

    - semantic: icon.feedback.warning
      stroke: HugeIconsStrokeRounded.alert02
      color: semantic.status.warning

    - semantic: icon.feedback.error
      stroke: HugeIconsStrokeRounded.cancelCircle
      color: semantic.status.error

    - semantic: icon.feedback.info
      stroke: HugeIconsStrokeRounded.informationCircle
      color: semantic.status.info

    - semantic: icon.feedback.empty
      stroke: HugeIconsStrokeRounded.inbox01
```

---

## Sizes

```yaml
icon_sizes:
  xs:
    value: 16.0
    usage: metadata, chips, auxiliary text, dense tables (standings)

  sm:
    value: 20.0
    usage: trailing icons, inputs, compact buttons

  md:
    value: 24.0
    usage: base size of the system; navigation, actions and general use

  lg:
    value: 28.0
    usage: internal app bars, highlighted actions, compact empty states

  xl:
    value: 32.0
    usage: onboarding, empty states, highlighted panels
```

---

## Stroke weight

The thin stroke is deliberate: on paper (`bg.base` = paper.50) the icon must read as ink, not as a blot. Prefer `1.5` as the general rule; raise to `1.75` only where density or contrast demands it (standings tables, dotted leaders).

```yaml
stroke_rules:
  default:
    strokeWidth: 1.5
    usage: general product rule; thin ink stroke on paper

  compact:
    strokeWidth: 1.75
    usage: >
      small icons (xs, sm), dense standings tables, or on surfaces with
      harder contrast (raised, marker yellow.100)

  emphatic:
    strokeWidth: 2.0
    usage: accessibility or exceptional emphasis
```

---

## Color and theming

Icons must inherit color from the theme whenever possible. Only use explicit color for intentional semantic states. All values resolve from the `semantic.{light|dark}` layer of `tokens.json`; never use literal hex.

The default icon color is ink on paper: `text.primary` resolves to `ink.700` (#1A1814) in light and to `paper.100` (#F5F0E3) in dark. The interactive state is marked by the scarce green of `action.primary`. Status colors follow the system's fill-vs-text rule: in `strokeRounded` icons the stroke acts as the fill/icon, so the `*.500` (light) / `*.300`–`*.400` (dark) variants of `semantic.status.*` are used, not the `*Text` variants.

```yaml
icon_color_behavior:
  default:
    source: "Theme.of(context).colorScheme.onSurface"
    semantic_token: semantic.text.primary
    resolves: { light: color.ink.700, dark: color.paper.100 }

  muted:
    source: "Theme.of(context).colorScheme.onSurfaceVariant"
    semantic_token: semantic.text.secondary
    resolves: { light: color.paper.700, dark: color.paper.400 }

  active:
    source: "Theme.of(context).colorScheme.primary"
    semantic_token: semantic.action.primary
    resolves: { light: color.green.500, dark: color.green.300 }
    note: scarce green accent; interaction or active state only

  selected:
    source: "Theme.of(context).colorScheme.primary"
    semantic_token: semantic.action.primary
    resolves: { light: color.green.500, dark: color.green.300 }

  live:
    source: "semantic.status.live"
    resolves: { light: color.red.500, dark: color.red.400 }
    note: pulsing dot next to the "EN VIVO" overline; see editorial note

  success:
    source: "semantic.status.success"
    resolves: { light: color.green.500, dark: color.green.300 }
    note: use the token's resolved value for the active theme

  warning:
    source: "semantic.status.warning"
    resolves: { light: color.yellow.500, dark: color.yellow.300 }
    note: yellow's dual role (card/warning); use the token's resolved value

  danger:
    source: "semantic.status.error"
    resolves: { light: color.red.500, dark: color.red.400 }
    note: use the token's resolved value for the active theme

  info:
    source: "semantic.status.info"
    resolves: { light: color.indigo.500, dark: color.indigo.400 }
    note: scarce indigo, neutral information only

  disabled:
    source: "Theme.of(context).disabledColor"
    semantic_token: semantic.text.disabled
    resolves: { light: color.paper.400, dark: color.paper.700 }
    opacity: 0.6
```

> Fill-vs-text note: when a status is communicated as adjacent **text** (overline, label), that text does use the AA `*Text` variants (`status.liveText` = red.700 light / red.300 dark, etc.). The icon uses the fill variant; the text, the reading variant.

### Editorial note — the "live" icon

`icon.status.live` (`radioButton01`) is treated as a **live stamp**, not as just another icon:

- Color: `semantic.status.live` — `red.500` (#C5403A) in light, `red.400` (#CC554D) in dark. The red is a warm brick ink, coherent with the paper.
- Shape: pulsing dot (pulse/opacity animation). Size `xs` (16) when it precedes an overline; `sm` (20) in match headers.
- Mandatory companion: "EN VIVO" overline in `text.overline` (ElmsSans, uppercase, `tracking.kicker` 0.08em). The live state is never communicated with the dot alone; the editorial kicker verbalizes it.
- Stroke: `1.5` by default. In dense tables/lists of in-progress matches, `1.75` so the dot is not lost at size `xs`.
- Pairing: the red dot + red overline (`status.liveText` = red.700 light / red.300 dark) form the "live kicker" unit on paper; do not add a fill or badge — the hairline rule is enough if it needs separation from the adjacent tabular scoreboard.

---

## Usage rules

- In `BottomNavigationBar`, `NavigationBar` or tabs, use size `md` as the base.
- In `IconButton`, use `sm` or `md` depending on visual density.
- In lists, cards and tables, all icons at the same hierarchy level must share size.
- In standings tables (dense, with dotted leaders), use `xs` with stroke `1.75`.
- Do not use fixed color except for intentional semantic states; prefer color inherited from the theme.
- Green (`action.primary`) is scarce: reserve it for interaction and active/selected state, never for decoration or neutral entity icons.
- Do not introduce a new icon if an approved one already exists for the same semantic.
- Do not use more than one icon to express the same action across screens.

---

## State rules

```yaml
interactive_states:
  default:
    style: strokeRounded
    color: semantic.text.secondary
    description: neutral icon state, no interaction

  hover:
    style: strokeRounded
    color: semantic.text.primary
    description: applies on Flutter Web and Desktop; ignore on mobile (Android/iOS)

  focused:
    style: strokeRounded
    color: semantic.action.primary
    description: icon receives focus via keyboard or accessibility navigation

  active:
    style: strokeRounded
    color: semantic.action.primary
    description: >
      momentary state during the tap gesture — resets on release.
      Different from "selected": active is a transition, selected is a persistent state.

  selected:
    style: strokeRounded
    color: semantic.action.primary
    description: >
      the element is persistently marked as selected (e.g. current tab in
      bottom nav, favorited item, active filter option). Visual differentiation
      is achieved exclusively through color (green action.primary, scarce),
      not through a style change.

  disabled:
    style: strokeRounded
    color: semantic.text.disabled
    opacity: 0.6
    description: non-interactive icon; reduce opacity in addition to changing color
```

---

## Accessibility

- Every icon that represents an action must have a semantic label with `Semantics(label: '...', child: ...)` in Flutter.
- Every purely decorative icon must be excluded with `ExcludeSemantics(child: ...)`.
- Do not rely on the icon alone to express error, success, urgency or live state — complement with text or color. Live: always dot + "EN VIVO" overline.
- Keep sufficient size (minimum `md: 24px`) and adequate contrast in light and dark mode. The dark-mode status variants (`*.300`/`*.400`) are chosen for AA on the ink background.
- The `disabled` state must reduce opacity to `0.6` in addition to changing color.
- Remember that pure `#FFFFFF` and `#000000` are forbidden: no icon may force absolute white or black; use the theme's `paper.*` / `ink.*`.

---

## Implementation patterns

### Base usage — theme color inheritance

```dart
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

HugeIcon(
  icon: HugeIconsStrokeRounded.home01,
  size: 24.0,
  strokeWidth: 1.5,
  // sin color explícito: hereda de IconTheme.of(context).color (semantic.text.primary)
)
```

### Selected state — differentiation by color (scarce green)

```dart
HugeIcon(
  icon: HugeIconsStrokeRounded.home01,
  size: 24.0,
  strokeWidth: 1.5,
  color: isSelected
      ? Theme.of(context).colorScheme.primary       // semantic.action.primary (verde)
      : Theme.of(context).colorScheme.onSurfaceVariant, // semantic.text.secondary
)
```

### "Live" icon — pulsing dot + editorial overline

```dart
Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    // dot pulsante (animar opacidad/escala); color = semantic.status.live
    HugeIcon(
      icon: HugeIconsStrokeRounded.radioButton01,
      size: 16.0,
      strokeWidth: 1.5,
      color: context.tokens.status.live, // red.500 light / red.400 dark
    ),
    const SizedBox(width: 8.0), // space.2
    // overline "EN VIVO" — text.overline, color status.liveText (AA)
    Text('EN VIVO', style: context.text.overline.copyWith(
      color: context.tokens.status.liveText,    // red.700 light / red.300 dark
    )),
  ],
)
```

### Explicit status color (warning / dense table)

```dart
HugeIcon(
  icon: HugeIconsStrokeRounded.alert02,
  size: 16.0,            // xs en tabla densa
  strokeWidth: 1.75,     // compact: no perder trazo a 16px
  color: context.tokens.status.warning, // yellow.500 light / yellow.300 dark
)
```

---

## Consistency criteria

- One semantic, one icon.
- One context, one dominant size.
- One system, one base style (`strokeRounded`).
- One exception, one explicit rule.
- One theme, one primary color source (ink on paper; green only marks interaction).

---

## Decision checklist

Before introducing a new icon, validate:

1. Does it represent a real action, entity or state of the product?
2. Does an approved icon already exist for that semantic?
3. Does it belong to the base `strokeRounded` style?
4. Does it work correctly at 16, 20, 24 and 28 with stroke 1.5 / 1.75?
5. Does it inherit properly from `Theme.of(context)` / the `semantic.*` tokens, with no literal hex?
6. Does it respect the scarcity of green and the fill-vs-text rule of statuses?
7. Does it need accessible semantics (`Semantics` widget)?
8. Is it really necessary, or does the text/overline already communicate enough?
