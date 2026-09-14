---
name: worldbuild
description: Use for creating, revising, or compiling worldbuilding documents for any fictional setting — novel, light novel, game, comic, tabletop RPG, or anything else. Covers entities (locations, factions, characters, magic/tech systems, cultures, deities, and any other category the user has notes for) as well as compilation documents (story bibles, glossaries) and meta/template work (genre and theme templates). Trigger this whenever the user wants to flesh out, add, revise, or update any piece of a fictional world's lore — even if they don't say "worldbuilding" explicitly (e.g. "add a new faction," "I need to figure out this city," "update the glossary," "what's missing from my magic system"). Requires the /grilling skill to run the actual interview — load that when this skill reaches the handoff step.
---

# Worldbuild

A single entry point for building and maintaining worldbuilding documents for any fictional setting. This skill does not run its own interview logic — it assembles a category-specific *design tree* (what to ask, in what order, informed by what already exists) and hands off to `/grilling` to actually conduct it. This skill's job is figuring out *what* to ask and *where to look* before anything gets asked; `/grilling`'s job is the interview mechanics themselves (rounds, frontier, confirmation gate, and — importantly — offering a recommended answer alongside every question, which is how this skill satisfies "let the AI suggest an answer" without needing its own separate mechanism for it).

Read this file's routing logic every time the skill is invoked. Only read the specific tree file(s) in `references/trees/` that apply to the current request — not the whole folder.

## Step 1 — Locate the worldbuilding notes

Before anything else, figure out where the user's worldbuilding material lives on disk. This is usually a directory of markdown or plain-text notes, but treat that loosely — it could be a single large document, a folder of files with no particular structure, or a well-organized set of subfolders by category. Ask the user if it isn't obvious from context or from files already open/referenced in the conversation. Do not assume any particular note-taking tool, folder convention, or file format. All references below to "the notes" mean whatever this location turns out to be.

## Step 2 — Resolve the category

Check the user's general idea (however loosely stated) against the tree files listed in `references/trees/`. Current categories are listed in `references/trees/_index.md` — read that index first; it's short and tells you which file to load without needing to open every tree file to check.

- **Clean match** — load that one tree file plus `references/trees/_shared.md` (fragments common to every entity type — narrative function, connections to existing material, tone consistency).
- **Ambiguous match** (the request could plausibly be more than one category — e.g. "the criminal underworld" could be a faction, a set of locations, or several characters) — ask one direct clarifying question before proceeding. Do not guess and run a full interview against the wrong tree; that wastes the user's time far more than one extra question would.
- **No match** — go to Step 2a (gap-handling) before proceeding.

### Step 2a — No tree exists for this category

Don't silently improvise a tree and run with it. Treat tree-creation itself as a short, separate grilling-style pass: figure out what actually varies for this category (is there a type-gate the way Location has settlement/wilderness/structure/region — some categories won't need one), and what would make two instances of this category meaningfully different from each other. If the notes already contain existing examples of this category written in prose but never templatized, scan a few of them first — the tree should reflect how the user actually already writes this kind of thing, not a generic invented structure. Check `references/trees/_index.md`'s WA source column too — if a WorldAnvil template is noted for this category, pull it (from `iamromeo/worldanvil-templates`, `article-templates/base-template/`) and fold its fields in the same way Location and Faction were built, rather than drafting thin and reconciling later.

Once drafted, show the user the proposed tree and confirm it looks right before using it — a bad tree wastes an entire subsequent interview on the wrong branches. Then write it to `references/trees/{category}.md`, derive its matching `references/templates/{category}.md` (see Step 6 below), and update the index — flip both statuses, and note the WA source used if any. Then proceed into Step 3 using the tree that was just built.

## Step 3 — Gather what's already known before asking anything

Before involving the user in any structured way, search the notes for anything already relevant: existing entries in this category to check naming/tone conventions against, anything already linked or tagged to whatever this new thing relates to, and — importantly — whether something matching this request might already exist as a note (which would make this a revision, not a new entity, even if the user framed it as "add a new..."). This pass feeds both Step 4 (mode) and every later fact-finding step; do it once up front rather than re-discovering the same things piecemeal during grilling.

## Step 4 — Resolve the mode

Three modes, informed by Step 3's search and the user's framing, asked directly only if still unclear:

- **New entity** — nothing exists yet for this specific thing.
- **Revision** — an existing note is being updated or fleshed out further (including cases Step 3 surfaced that the user didn't realize already existed). Read the target note in full and seed already-settled facts from its current content, so nothing on the page gets re-asked. Also proactively flag anything in the existing note that looks inconsistent with what Step 3 turned up elsewhere in the notes (e.g. a note saying a guild is outlawed when a more recent faction note says it operates with a charter) — surface these as findings before or alongside the interview, not silently.
- **Compilation** (story bible, glossary, and any other document type that synthesizes across many existing entities rather than describing one new thing) — these use their own shallow tree files (scope, audience, format — not deep branching) and the bulk of the actual work happens after grilling finishes: reading broadly across the notes and synthesizing, not interviewing about net-new content. Don't force a compilation request through the same deep-branching shape as an entity type. Skip Step 5 (braindump) for compilation mode — it doesn't apply the same way to a synthesis task.

## Step 5 — Open braindump

For new-entity and revision modes: before starting the structured interview, ask the user to just say whatever they already have in mind for this thing — name, vibe, a scrap of an idea, anything — explicitly inviting rough or incomplete answers rather than a complete picture. Keep this to one open invitation, not a list of specific questions; the specific questions are grilling's job in Step 7, not this step's. The point of asking this first is that it's much cheaper to fold what the user already knows into grilling's starting facts than to have grilling discover the same information one narrow question at a time — seed grilling's already-settled facts from whatever the braindump covers, on top of anything Step 3 or (in revision mode) Step 4 already settled, so the interview only ever asks about what's genuinely still open.

## Step 6 — Resolve the output template

Load `references/templates/{category}.md` as the default output skeleton — this is a mechanical derivation of the category's Infobox fields and Document sections from its tree file, already there for every category with a Done tree. If a category has a tree but no template yet, derive one now the same way (Infobox fields become the skeleton's infobox block, Document sections become headers, type-conditional sections marked as such) and save it to that path for reuse.

Also ask, if not already stated, whether the user wants this written against a *different* formatting/style guide document of their own. If they point to one, read it and fold any fields or conventions it requires into the assembled tree as additional branches before the handoff (e.g. if it requires a specific sensory-detail field the default template doesn't have, that becomes a real interview question, not something bolted on after the fact) — and treat the default template as a checklist to diff the custom one against, so nothing the category normally covers gets silently dropped just because the user's template didn't think to ask for it.

## Step 7 — Hand off to grilling

Load `/grilling` and provide it: the assembled design tree, the location of the worldbuilding notes for fact-finding, and every fact already settled by Steps 3–5 (vault search results, existing note content in revision mode, and the braindump) so grilling's frontier starts as narrow as it honestly can. The assembled tree has two layers, in order: the category's Infobox fields (short, low-branching, mostly fact-findable — see `_shared.md` → "How Infobox fields work"), then the narrative branches (category-specific tree + `_shared.md` fragments + any template-derived branches). Let grilling run its normal round/frontier process across both layers.

This is meant to be a collaborative worldbuilding conversation, not a form to fill out — lean on grilling's built-in recommendation line for this rather than adding separate machinery: every recommendation should be genuinely informed by what Step 3's search turned up (an on-theme suggestion beats a generic one), and should actively flag — as part of the question or recommendation, not as an afterthought — anything that bears on continuity: a timeline implication, a thematic clash with the established tone, a character or faction whose existing arc this might affect. This is what makes the interview feel like the AI is helping *build* the world rather than just recording what the user dictates.

Do not write anything until grilling's confirmation gate has been reached and the user has confirmed shared understanding — grilling is not finished just because its frontier is empty.

## Step 8 — Write the result

For entity/new/revision modes: fill the resolved template from Step 6 (the default from `references/templates/{category}.md`, or the user-supplied one) with what grilling settled — Infobox block first, prose body below, in whatever key-fact format (table or bullet list) the user's existing notes already use. Include any wikilinks or cross-references the fact-finding turned up to related existing material, in whatever linking convention the user's notes already use (wikilinks, plain references, etc. — infer from existing notes rather than assuming one). Omit any placeholder field or type-conditional section that didn't apply or wasn't settled — don't render empty or "N/A" fields, and don't include a section the template marked as conditional on a type this entity isn't.

Write once, at the end, rather than progressively during the interview — for a new entity nothing is at risk of being lost mid-conversation (grilling's confirmation gate is the safety net), so writing once is strictly cheaper than writing incrementally without buying back any real safety. Revision mode is the exception, since it's already editing something that exists on disk — update it in place rather than rewriting the whole file if the change is localized.

For compilation modes: assemble the synthesized document from what was gathered, structured per the scope/audience/format decided during the short interview.

Confirm with the user where the file was written and, in revision mode, summarize what changed versus what stayed the same.

## Step 9 — Offer to continue, or suggest a fresh session

If the user wants to build another document after this one finishes, it's fine to just continue in the same session — but offer, once, a fresh session as the generally better default. The reason it's worth suggesting rather than just continuing automatically: continuity for the *next* document doesn't depend on this conversation's memory at all — Step 3's fact-finding searches the notes on disk fresh every time, so a new session checking the just-written note for consistency works exactly as well as an in-context memory of writing it would have. What a fresh session actually saves is the accumulated, now-irrelevant context from the finished document, which a long-running session keeps resending on every subsequent turn. The tradeoff is losing conversational flow if the user is deliberately building several tightly-linked things in one sitting (a faction, its headquarters, and its founder, discussed together) — so this is a suggestion made once per finished document, never a requirement, and "let's keep going" should be honored without friction.
