# Juggernaut

A Minecraft datapack for a custom asymmetric multiplayer minigame in which one or more Juggernauts hunt a team of Runners across an arena. Runners must survive long enough to replenish a shared progress meter while evading the Juggernaut(s), who must eliminate all Runners before replenishment is completed.

---

## Table of Contents

- [Gameplay Overview](#gameplay-overview)
- [Roles](#roles)
  - [Juggernaut](#juggernaut)
  - [Runners](#runners)
- [Kits](#kits)
  - [Runner Kits](#runner-kits)
  - [Juggernaut Kits](#juggernaut-kits)
- [Mechanics](#mechanics)
  - [Replenishment Stations](#replenishment-stations)
  - [Lives & Elimination](#lives--elimination)
  - [Chase System](#chase-system)
  - [Healing](#healing)
  - [Status Effects](#status-effects)
- [Perks](#perks)
- [Customisation](#customisation)
- [Setup & Installation](#setup--installation)
- [Contributing](#contributing)
  - [Commit Conventions](#commit-conventions)
  - [Pull Request Rules](#pull-request-rules)

---

## Gameplay Overview

At the start of each game, one or more players (defined by game options) are randomly designated as the **Juggernaut**; all remaining players become **Runners**. Both sides select a kit from their respective pools before the game begins.

There is a maximum number of juggernauts that can be selected at any point in time. Hard cap is `total players - 1`, and it is soft capped at `6` in the settings menu. It can be manually overridden to allow more but is not recommended.

Once all kits have been selected the Runners have 25 seconds (by default) where they can reposition and get on a replenishment station before the Juggernaut is released. After these 25 seconds, the Juggernaut will spawn in the map on one of the 3 furthest possible spawn points from the Runner's spawn point.

If the target amount of stations are completed before all Runners run out of lives, then the Runners will win and the game will end. Otherwise, the Juggernaut will win after all Runners run out of lives. If the Juggernaut dies then the game will also end.

Further explanation of specific game systems are detailed under the [Mechanics](#mechanics) section.

---

## Roles

### Juggernauts

The Juggernaut is an extremely hard-to-kill player with much more powerful abilities than the runners. The strength of different Juggernaut kits lies in different areas, these generally being mobility (out of chase movement around the map), chase ability (speed and damage), and information.

Runner lives scale with the number of Juggernauts: each Runner starts with `juggernaut_count + 1` lives.

### Runners

The objective of Runners is to survive and accumulate replenishment progress at designated stations across the arena. Runners can heal others in proximity by standing up while the target crouches, or may self-heal by sneaking.

Runners should prioritise replenishment stations in the middle of the map as to leave the ones furthest from each other at the end to make the Juggernaut take longer when patrolling replenishment stations. Unsafe/exposed stations such as the station on the bridge should also be prioritised early on.

Different Runner kits find strength in mobility (out of chase/rotating around the map), stealth (invisibility, speed while crouching), and anti-chase ability (to escape chase or get away from the Juggernaut).

---

## Kits

Each kit aims to provide the player a different playstyle. Kits are made of passive traits and active abilities tied to hotbar slots. Abilities can be activated with right click or dropping them on the ground.

### Runner Kits

| Kit | Playstyle |
| --- | --- |
| Guide | Progresses replenishment stations, lacks other abilities |
| Escapist | Evasion and mobility |
| Rogue | Stealth and information advantage |
| Medic | Enhanced healing and team sustain |
| Scout | Line-of-sight Juggernaut detection and info |
| Survivor | High durability and resilience in chase |
| Ghost | Evasion and upmost stealth. High risk high reward |
| Engineer | Tower placement anywhere for replenishment and info |
| Trickster | Deception and chase utility (disorientation) |

### Juggernaut Kits

| Kit | Playstyle |
| --- | --- |
| Classic Juggernaut | One-shot on critical hit with axe, good info |
| Dragon | Ranged Dragon Breath attacks, mobility with flight in air |
| Hunter | Mark/Pursue to catch up to runners. Bloodhound for info, ranged bow |
| Warlock | Locks down areas with Banishment Glyph and Withering Surge |
| Predator | Constant invisibility and stealth, can shift to become undetectable |
| Spirit Walker | Powerful short cooldown teleport ability for chase |
| Witch Doctor | Stacks buffs on themselves for mobility and chase power |
| Timekeeper | Sets down tracks on the ground that can be activated to deal damage |
| Chameleon | Turns into Runners and can swap places with them |
| Fishmonger | Mobility with a riptide trident and throwable trident in chase |
| Knight | Mobility with horse and lunging spear, can joust Runners for damage |

---

## Mechanics

### Replenishment Stations

Replenishment Stations are the primary objective for Runners. Runners standing within 3 blocks of a station (while the Juggernaut is not within 12 blocks and no Banishment Glyph is active nearby) contribute to the station's `replenish_amount` score each tick.

When `completable_stations` is enabled, the arena uses 8 (under `total_stations`) stations and Runners must fully complete 5 (`stations_needed`, equal to `total_stations - 3`) of them to win. Each station has its own `replenish_amount` cap derived from `total_replenishment_per_station` (equals `total_replenishment` / `total_stations`).

The total replenishment needed is calculated at game start using the following formula:

```text
total_replenishment = 0.95 × (beginning_time × (runner_lives_total - 2) + beginning_time) / juggernaut_count
```

Where:

- `beginning_time` is **175 seconds** (3500 ticks) in completable stations mode, or **225 seconds** (4500 ticks) in standard mode.
- `runner_lives_total` is the sum of all Runners' starting lives.
- In completable stations mode, `total_replenishment_per_station` is then set to `total_replenishment / stations_needed`, evenly distributing the cap across the stations Runners must complete.

**Example** — 2 Runners (2 lives each), 1 Juggernaut, completable stations enabled:

- `runner_lives_total` = 2 runners × 2 lives = 4, so `4 - 2` = 2~
- `total_replenishment` = 0.95 × (3500 × 2 + 3500) / 1 = 0.95 × 10,500 = **9,975 ticks (498.75 seconds, or ~8.3 minutes)**
- `total_replenishment_per_station` = 9,975 / 5 = **1,995 ticks (99.75 seconds or ~1.7 minutes per station)**

**Replenishment modifiers** applied to Runners affect progress speed:

- `replenish_buff` increases the rate of progress as a percentage.
- `replenish_debuff` decreases the rate of progress as a percentage.

Stations display particle effects to indicate their status:

- `end_rod` — actively being replenished
- `totem_of_undying` — indicates presence of station
- `witch` (for Runners) — Juggernaut is nearby (purple warning)
- `witch` (for Juggernauts) — Runner has been nearby within the last 6 seconds (purple warning)
- `white_smoke` (for Juggernauts) — blocked by Banishment Glyph
- `flame` (for Runners) — blocked by Banishment Glyph

### Lives & Elimination

Each Runner starts with `juggernaut_count + 1` lives (minimum 2). The Survivor kit grants one additional life. When a Runner's `lives_remaining` reaches 0, they are eliminated and moved to spectator mode.

The Juggernaut starts with 1 life. A hit from the Juggernaut triggers `juggernaut:hooks/hit_by_juggernaut`, which processes life deduction and associated effects.

### Chase System

Chase is a per-player state tracked via the `in_chase` tag and `chase_timeout` scoreboard. It governs whether the Juggernaut and Runners are considered to be actively engaged in the chase sequence, which will trigger/effect multiple mechanics in the game.

#### Entering Chase

Each tick, the system checks whether the Juggernaut (non-sneaking, non-shapeshifting) has a Runner within detection range. Two range checks are performed from a position 4–5 blocks ahead of the Juggernaut's facing direction:

- A non-sprinting Runner within 20 blocks triggers chase.
- A sprinting Runner within 30 blocks triggers chase.

When either condition is met, both the Juggernaut and the qualifying Runner(s) receive the `continue_chase` tag, which resets their `chase_timeout` to 60t/3s (or 120t/6s if the Juggernaut has the `unyielding_wrath` perk). The tag is immediately removed after the timeout is refreshed.

Spectators as well as players on the respawn screen cannot enter or continue to be in chase.

#### Exiting Chase

`chase_timeout` decrements by 1 each tick. When it reaches 0, the `in_chase` tag is removed and `juggernaut:hooks/jug_left_chase` / `juggernaut:hooks/runner_left_chase` are called respectively.

#### Consequences of Chase

While `in_chase` is active:

- Runners passively give replenishment to the highest station as if they were on it.
- `chase_time` increments each tick, powering scaling abilities such as **Unyielding Wrath** (Juggernaut speed stacks).
- The player's `in_chase` state suppresses certain passive behaviours (e.g. Fishmonger's riptide trident), and triggers any chase specific abilities (e.g. Escapist's passive speed).

### Healing

Total time needed for healing scales by the amount of health lost. Runners can heal others in proximity by standing up while the target crouches, or may self-heal by sneaking.

### Status Effects

Custom status effects are tracked via scoreboard and tags rather than vanilla potion effects. The following effects are managed each tick:

| Effect | Description |
| --- | --- |
| Not Replenishing | Prevents a Runner from interacting with stations |
| Undetectable | Prevents glowing and hides station warning particles |

---

## Perks

Perks are optional modifiers assigned to Runners and the Juggernaut at game start, controlled by the `perks_enabled` customisation flag. Each perk augments kit behaviour without replacing core kit abilities.

---

## Customisation

Customisation options are stored under the `#juggernaut_customisation` score holder.

| Score | Description |
| --- | --- |
| `juggernaut_count` | Number of Juggernauts (index starts at 1, so value of 1 means one Juggernaut, etc.) |
| `completable_stations` | `1` enables completable station mode; `0` uses standard non-completable stations mode |
| `perks_enabled` | `1` to allow for perk selection at the start of the game |
| `debug_mode` | `1` enables debug mode, which is not intended for normal gameplay and will likely not be playable |

---

## Setup & Installation

1. Copy the `juggernaut_v2` datapack folder into your world's `datapacks/` directory, or alternatively if you are updating it use `git pull` in the `datapacks/juggernaut_v2` directory
2. Run `/reload` in-game.
3. Start the game! If at any point there is a problem or bug of some kind running `/function minecraft:reset` should fix it!

---

## Contributing

### Commit Conventions

This project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification with the following additions and notes:

**Standard types:**

| Type | Use |
| --- | --- |
| `feat` | A new feature or addition |
| `fix` | A bug fix |
| `docs` | Documentation changes only |
| `refactor` | Code restructuring with no behaviour change |
| `chore` | Maintenance tasks (cleanup, file moves, etc.) |
| `perf` | Performance improvements |
| `revert` | Reverting a prior commit |

**Extended types (project-specific):**

| Type | Use |
| --- | --- |
| `buff:` | Direct buff to a kit's stats, abilities, or attributes |
| `nerf:` | Direct nerf to a kit's stats, abilities, or attributes |
| `rework:` | Significant redesign or overhaul of a kit's gameplay |

**Examples:**

```text
feat: add replenishment in chase functionality
fix(warlock): banishment glyph not clearing on game end
nerf(chameleon): reduce swap range from 6 to 4 blocks
rework(predator): replace static sound cues with directional audio system
docs: update README with chase system details
refactor: extract kit loops into separate tick functions
```

### Pull Request Rules

- **One concern per PR.** A PR should address a single feature, fix, kit change, or refactor. Do not bundle unrelated changes.
- **Title must follow commit conventions.** The PR title should mirror the commit type and description format (e.g. `buff(scout): increase LOS reveal range to 24 blocks`).
- **Describe the change.** Include a brief description of what was changed, why, and any relevant scoreboard variables, tags, or functions affected.
- **Test before opening.** All changes must be verified in-game before a PR is opened. Please include notes on what was tested (e.g. game states tested, edge cases checked).
- **Reference related issues** where applicable using `Closes #<issue>` or `Related to #<issue>`.
- **Kit balance changes (`buff:`, `nerf:`, `rework:`)** must include a brief rationale explaining the balance motivation.
- **Do not open a PR that breaks game state transitions.** Ensure `#game_state var` flows correctly through states `10 → 12 → 11` and that `end_game` / `reset` functions leave no dangling scores, tags, or entities.
- **Squash commits before merging** unless each individual commit is meaningful and well-described on its own in which case this is perfectly acceptable.

Following these rules will mean that your request can be processed much quicker and will be more likely to be accepted.
