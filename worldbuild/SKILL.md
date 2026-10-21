---
name: worldbuild
description: Use for creating, revising, or compiling worldbuilding documents for any fictional setting, such as a novel, light novel, game, comic, or tabletop RPG. Covers entities (locations, factions, characters, magic/tech systems, cultures, deities, and any other category the user has notes for), compilation documents (story bibles, glossaries), and meta/template work (genre and theme templates). Trigger this whenever the user wants to flesh out, add, revise, or update any piece of a fictional world's lore, even if they don't say "worldbuilding" (e.g. "add a new faction," "I need to figure out this city," "update the glossary," "what's missing from my magic system"). Requires the /grilling skill to run the interview. Load it when this skill reaches the handoff step.
---

# Worldbuild

A single entry point for building and maintaining worldbuilding documents for any fictional setting. This skill does not run its own interview logic. It assembles a category-specific *design tree* (what to ask, in what order, informed by what already exists) and hands off to `/grilling` to conduct it. This skill decides what to ask and where to look before anything gets asked. `/grilling` handles the interview mechanics: rounds, frontier, the confirmation gate, and a recommended answer alongside every question. That recommendation is how this skill satisfies "let the AI suggest an answer" without a separate mechanism.

Read this file's routing logic every time the skill is invoked. Only read the specific tree file(s) in `references/trees/` that apply to the current request, not the whole folder.

## Unslop check

At the start of every invocation, check whether the `unslop` skill is installed. It is installed if `unslop` appears in the available skills list, or if an `unslop/SKILL.md` exists in the host's skills folder, for example `~/.claude/skills/unslop/`.

If it is installed, load it and apply it to:

- Everything you write to the user in chat, including questions, recommendations, continuity flags, and summaries.
- Every new tree file or template this skill drafts, before you show it to the user or save it. Steps 2a and 6 are the two places this happens.

Don't run unslop over the world content written in Step 8. That prose carries the user's voice and their setting's tone, and unslop's rules are written for explanatory text, not fiction.

If it is not installed, continue without it. Mention it once, in one line, and recommend installing the unslop skill from https://github.com/cursor/plugins/blob/main/pstack/skills/unslop/SKILL.md. Don't repeat the suggestion later in the session.

## Step 1. Locate the worldbuilding notes

Before anything else, find where the user's worldbuilding material lives on disk. This is usually a directory of markdown or plain-text notes, but treat that loosely. It could be a single large document, a folder of files with no particular structure, or a well-organized set of subfolders by category. Ask the user if it isn't obvious from context or from files already open or referenced in the conversation. Do not assume any particular note-taking tool, folder convention, or file format. All references below to "the notes" mean whatever this location turns out to be.

## Step 2. Resolve the category

Check the user's general idea (however loosely stated) against the tree files listed in `references/trees/`. Current categories are listed in `references/trees/_index.md`. Read that index first. It's short and tells you which file to load without opening every tree file.

- **Clean match.** Load that one tree file plus `references/trees/_shared.md` (fragments common to every entity type: narrative function, connections to existing material, tone consistency).
- **Ambiguous match.** If the request could plausibly be more than one category (e.g. "the criminal underworld" could be a faction, a set of locations, or several characters), ask one direct clarifying question before proceeding. Do not guess and run a full interview against the wrong tree. That wastes the user's time far more than one extra question would.
- **No match.** Go to Step 2a (gap-handling) before proceeding.

### Step 2a. No tree exists for this category

Don't silently improvise a tree and run with it. Treat tree creation as a short, separate grilling-style pass. Work out what actually varies for this category (is there a type-gate the way Location has settlement/wilderness/structure/region? Some categories won't need one) and what would make two instances of this category meaningfully different from each other. If the notes already contain examples of this category written in prose but never templatized, scan a few of them first. The tree should reflect how the user already writes this kind of thing, not a generic invented structure. Check the WA source column in `references/trees/_index.md` too. If a WorldAnvil template is noted for this category, pull it (from `iamromeo/worldanvil-templates`, `article-templates/base-template/`) and fold its fields in the same way Location and Faction were built, rather than drafting thin and reconciling later.

Once drafted, run it through unslop if it is installed (see "Unslop check"), then show the user the proposed tree and confirm it looks right before using it. A bad tree wastes an entire subsequent interview on the wrong branches. Then write it to `references/trees/{category}.md`, derive its matching `references/templates/{category}.md` (see Step 6 below), and update the index: flip both statuses, and note the WA source used if any. Then proceed into Step 3 using the tree that was just built.

## Step 3. Gather what's already known before asking anything

Before involving the user in any structured way, search the notes for anything already relevant: existing entries in this category to check naming and tone conventions against, anything already linked or tagged to whatever this new thing relates to, and whether something matching this request might already exist as a note (which would make this a revision, not a new entity, even if the user framed it as "add a new..."). This pass feeds both Step 4 (mode) and every later fact-finding step. Do it once up front rather than re-discovering the same things piecemeal during grilling.

## Step 4. Resolve the mode

Three modes, informed by Step 3's search and the user's framing. Ask directly only if still unclear:

- **New entity.** Nothing exists yet for this specific thing.
- **Revision.** An existing note is being updated or fleshed out further, including cases Step 3 surfaced that the user didn't realize already existed. Read the target note in full and seed already-settled facts from its current content, so nothing on the page gets re-asked. Also flag anything in the existing note that looks inconsistent with what Step 3 turned up elsewhere in the notes (e.g. a note saying a guild is outlawed when a more recent faction note says it operates with a charter). Surface these as findings before or alongside the interview, not silently.
- **Compilation** (story bible, glossary, and any other document type that synthesizes across many existing entities rather than describing one new thing). These use their own shallow tree files (scope, audience, format, not deep branching), and most of the work happens after grilling finishes: reading broadly across the notes and synthesizing, not interviewing about net-new content. Don't force a compilation request through the same deep-branching shape as an entity type. Skip Step 5 (braindump) for compilation mode, since it doesn't apply the same way to a synthesis task.

## Step 5. Open braindump

For new-entity and revision modes: before starting the structured interview, ask the user to say whatever they already have in mind for this thing, such as a name, a vibe, or a scrap of an idea. Explicitly invite rough or incomplete answers rather than a complete picture. Keep this to one open invitation, not a list of specific questions. The specific questions are grilling's job in Step 7. Asking this first is cheaper than having grilling discover the same information one narrow question at a time. Seed grilling's already-settled facts from whatever the braindump covers, on top of anything Step 3 or (in revision mode) Step 4 already settled, so the interview only asks about what's still open.

## Step 6. Resolve the output template

Load `references/templates/{category}.md` as the default output skeleton. It is a mechanical derivation of the category's Infobox fields and Document sections from its tree file, and it exists for every category with a Done tree. If a category has a tree but no template yet, derive one now the same way (Infobox fields become the skeleton's infobox block, Document sections become headers, type-conditional sections marked as such) and save it to that path for reuse. Run the new template through unslop first if it is installed (see "Unslop check").

Also ask, if not already stated, whether the user wants this written against a *different* formatting or style guide document of their own. If they point to one, read it and fold any fields or conventions it requires into the assembled tree as additional branches before the handoff. For example, if it requires a specific sensory-detail field the default template doesn't have, that becomes a real interview question, not something bolted on afterward. Treat the default template as a checklist to diff the custom one against, so nothing the category normally covers gets silently dropped just because the user's template didn't ask for it.

## Step 7. Hand off to grilling

Load `/grilling` and give it the assembled design tree, the location of the worldbuilding notes for fact-finding, and every fact already settled by Steps 3 to 5 (vault search results, existing note content in revision mode, and the braindump), so grilling's frontier starts as narrow as it honestly can. The assembled tree has two layers, in order: the category's Infobox fields (short, low-branching, mostly fact-findable; see `_shared.md` → "How Infobox fields work"), then the narrative branches (category-specific tree + `_shared.md` fragments + any template-derived branches). Let grilling run its normal round/frontier process across both layers.

This should be a collaborative worldbuilding conversation, not a form to fill out. Use grilling's built-in recommendation line for this rather than adding separate machinery. Every recommendation should be informed by what Step 3's search turned up (an on-theme suggestion beats a generic one). It should also flag anything that bears on continuity, as part of the question or recommendation and not as an afterthought: a timeline implication, a thematic clash with the established tone, a character or faction whose existing arc this might affect. This makes the AI a participant in building the world instead of a recorder of what the user dictates.

Do not write anything until grilling's confirmation gate has been reached and the user has confirmed shared understanding. Grilling is not finished just because its frontier is empty.

## Step 8. Write the result

For entity, new, and revision modes: fill the resolved template from Step 6 (the default from `references/templates/{category}.md`, or the user-supplied one) with what grilling settled. Put the Infobox block first and the prose body below, in whatever key-fact format (table or bullet list) the user's existing notes already use. Include any wikilinks or cross-references the fact-finding turned up to related existing material, in whatever linking convention the user's notes already use (wikilinks, plain references, etc.). Infer the convention from existing notes rather than assuming one. Omit any placeholder field or type-conditional section that didn't apply or wasn't settled. Don't render empty or "N/A" fields, and don't include a section the template marked as conditional on a type this entity isn't.

Write once, at the end, rather than progressively during the interview. For a new entity nothing is at risk of being lost mid-conversation (grilling's confirmation gate is the safety net), so writing once is cheaper than writing incrementally and loses no safety. Revision mode is the exception, since it's already editing something that exists on disk. Update it in place rather than rewriting the whole file if the change is localized.

For compilation modes: assemble the synthesized document from what was gathered, structured per the scope/audience/format decided during the short interview.

Confirm with the user where the file was written and, in revision mode, summarize what changed versus what stayed the same.

## Step 9. Offer to continue, or suggest a fresh session

If the user wants to build another document after this one finishes, it's fine to continue in the same session, but offer, once, a fresh session as the generally better default. Continuity for the *next* document doesn't depend on this conversation's memory. Step 3's fact-finding searches the notes on disk fresh every time, so a new session checking the just-written note for consistency works as well as an in-context memory of writing it. A fresh session saves the accumulated, now-irrelevant context from the finished document, which a long-running session resends on every subsequent turn. The tradeoff is losing conversational flow if the user is deliberately building several tightly linked things in one sitting (a faction, its headquarters, and its founder, discussed together). So make this suggestion once per finished document, never as a requirement, and honor "let's keep going" without friction.
