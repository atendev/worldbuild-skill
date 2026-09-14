# worldbuild

An AI Skill for creating, revising, and compiling worldbuilding documents for any fictional setting — novel, light novel, game, comic, or tabletop RPG. One entry point (`/worldbuild`) instead of a separate skill per category: it figures out what kind of thing you're building (a location, a faction, a character, a magic system, a compiled story bible, and over twenty other categories), gathers what's already known from your notes, and runs a structured interview to fill in the rest — collaboratively, with the AI suggesting answers and flagging continuity issues as it goes, not just recording what you dictate.

## Requirements

This skill hands off the actual interview to **[`/grilling`](https://www.aihero.dev/skills-grilling)** by Matt Pocock — it doesn't reimplement interview logic itself. You need that skill installed too, or `worldbuild` won't have anything to hand off to:

```
npx skills@latest add mattpocock/skills --skill=grilling
```

## Install

```
curl -fsSL https://raw.githubusercontent.com/atendev/worldbuild-skill/main/install.sh | bash
```

Asks where you want it installed (Claude Code globally or per-project, Codex CLI, Gemini CLI, or a custom path of your choosing) and walks you through the rest. The `codex` and `gemini` options copy the skill to those tools' community-documented skill folders, but that's as far as this script's confidence goes — whether either CLI actually follows `SKILL.md`'s routing instructions the way Claude does (in particular, only reading the one reference file it needs rather than everything at once) hasn't been verified, and is worth testing before relying on it there. Tools that read a single flat instructions file instead of a folder — Cursor's rules, VS Code Copilot's `copilot-instructions.md` — aren't offered as options at all: flattening this skill's ~50 files into one file would defeat the whole point of only loading what's relevant, so that's left as a manual, deliberate choice rather than something this script does for you.

## Usage

Once installed, just describe what you want to build — you don't need to name the skill or the category explicitly:

- "Help me flesh out a new coastal trading city"
- "I need a rival faction for the Ashfen Concord"
- "Let's build out the protagonist's older sister"
- "Compile a glossary from what I've got so far"

The skill will ask where your notes live (any folder of markdown/text files — it doesn't assume a specific note-taking app), resolve which category fits, gather relevant existing material, invite an open braindump of what you already have in mind, then run the structured interview via `/grilling` before writing the finished note.

## What's inside

```
worldbuild/
├── SKILL.md                   the routing logic — category resolution, mode
│                               detection, the full creation loop, gap-handling
│                               for categories that don't exist yet
└── references/
    ├── trees/                 one file per category: what to ask, in what
    │                          order, and how it branches
    │   ├── _index.md          the category catalog — read this first
    │   └── _shared.md         fragments common to every entity type
    └── templates/              the output skeleton for each entity category —
                                 infobox fields + document section headers
```

`references/trees/_index.md` is the map — it lists every category, whether its tree/template is done, and which WorldAnvil template (if any) informed it. Worth reading before extending this with a new category, since the index also tracks a few deliberate merges (Rank folded into Faction, Deity folded into Character's Divine toggle, Political system and Economy folded into Faction) so the same ground doesn't get covered twice under different names.

## Attribution

Several of this skill's design trees were informed by field structures observed in [World Anvil's community RPG-block templates](https://github.com/iamromeo/worldanvil-templates) — specifically which categories of information a thorough worldbuilding entry tends to need (a settlement's demographics and defences, a character's mental and social traits, and so on). No code, markup, or assets from that repository are included here; everything in `worldbuild/` is original text, organized around similar concepts. See `LICENSE` for the full note on World Anvil's own license terms.

The interview mechanism itself is [`/grilling`](https://github.com/mattpocock/skills) by Matt Pocock, used as a dependency rather than reimplemented — see Requirements above.

## License

MIT — see `LICENSE`.
