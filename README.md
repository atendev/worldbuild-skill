# worldbuild

An AI Skill for creating, revising, and compiling worldbuilding documents for any fictional setting: novel, light novel, game, comic, or tabletop RPG. It has one entry point (`/worldbuild`) instead of a separate skill per category. It works out what kind of thing you're building (a location, a faction, a character, a magic system, a compiled story bible, or one of over twenty other categories), gathers what's already known from your notes, and runs a structured interview to fill in the rest. The AI suggests answers and flags continuity issues as it goes, so it doesn't only record what you dictate.

## Requirements

This skill hands off the actual interview to [`/grilling`](https://www.aihero.dev/skills-grilling) by Matt Pocock and doesn't reimplement interview logic itself. You need that skill installed too, or `worldbuild` has nothing to hand off to:

```
npx skills@latest add mattpocock/skills --skill=grilling
```

## Install

```
curl -fsSL https://raw.githubusercontent.com/atendev/worldbuild-skill/main/install.sh | bash
```

The script asks where you want it installed (Claude Code globally or per-project, Codex CLI, Gemini CLI, or a custom path) and walks you through the rest. The `codex` and `gemini` options copy the skill to those tools' community-documented skill folders. Nobody has verified that either CLI follows `SKILL.md`'s routing instructions the way Claude does, in particular reading only the one reference file it needs rather than everything at once. Test that before relying on it there. Tools that read a single flat instructions file instead of a folder, such as Cursor's rules and VS Code Copilot's `copilot-instructions.md`, aren't offered as options. Flattening this skill's ~50 files into one file would defeat the purpose of loading only what's relevant, so that stays a manual choice.

## Usage

Once installed, describe what you want to build. You don't need to name the skill or the category:

- "Help me flesh out a new coastal trading city"
- "I need a rival faction for the Ashfen Concord"
- "Let's build out the protagonist's older sister"
- "Compile a glossary from what I've got so far"

The skill asks where your notes live (any folder of markdown or text files; it doesn't assume a specific note-taking app), resolves which category fits, and gathers relevant existing material. It then invites an open braindump of what you already have in mind, runs the structured interview via `/grilling`, and writes the finished note.

### Auto mode

Start your message with `send it` or `auto-mode`, followed by your idea and anything you already have in mind:

- "send it: a heretic sect inside the Lantern Church that sings the dead back for one night"

Instead of interviewing you, the skill asks a few multiple-choice questions about settings, with the defaults pre-selected. Pick "Use defaults" to skip the rest. A grilling subagent then answers the interview in your place, using your idea and your existing notes, and writes the draft. A separate auditing subagent checks the draft against your notes and sends back any contradiction it can cite. The two go back and forth until the auditor approves, then the note is written. The final report lists everything the agent invented, so you can review those first.

Settings include the grilling model (Opus by default), the audit model (Sonnet by default), how much the agent invents, how it handles conflicts with canon, and whether to stop at a draft for your review. See `worldbuild/references/auto-mode.md` for the full list.

## What's inside

```
worldbuild/
├── SKILL.md                   the routing logic, category resolution, mode
│                               detection, the full creation loop, gap-handling
│                               for categories that don't exist yet
└── references/
    ├── auto-mode.md           settings prompt, grilling and audit subagent
    │                          loops for "send it" runs
    ├── trees/                 one file per category: what to ask, in what
    │                          order, and how it branches
    │   ├── _index.md          the category catalog, read this first
    │   └── _shared.md         fragments common to every entity type
    └── templates/              the output skeleton for each entity category:
                                 infobox fields + document section headers
```

`references/trees/_index.md` is the map. It lists every category, whether its tree and template are done, and which WorldAnvil template (if any) informed it. Read it before adding a new category. The index also tracks a few deliberate merges (Rank folded into Faction, Deity folded into Character's Divine toggle, Political system and Economy folded into Faction) so the same ground isn't covered twice under different names.

## Attribution

Several of this skill's design trees were informed by field structures in [World Anvil's community RPG-block templates](https://github.com/iamromeo/worldanvil-templates), specifically which categories of information a thorough worldbuilding entry tends to need (a settlement's demographics and defences, a character's mental and social traits, and so on). No code, markup, or assets from that repository are included here. Everything in `worldbuild/` is original text organized around similar concepts. See `LICENSE` for the full note on World Anvil's own license terms.

The interview mechanism is [`/grilling`](https://github.com/mattpocock/skills) by Matt Pocock, used as a dependency rather than reimplemented. See Requirements above.

## License

MIT. See `LICENSE`.
