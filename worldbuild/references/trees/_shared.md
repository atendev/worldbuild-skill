# Shared fragments

These branches apply to every entity-type tree (locations, factions, characters, systems, etc.) regardless of category. Append them to the category-specific tree as the final layer, after category-specific branches are settled — they're deliberately medium- and category-agnostic.

## Shared infobox fields

Every category's Infobox (see "Infobox fields" note below) includes these regardless of category-specific fields:

- **Name** — and any aliases or other names this is known by (different factions, cultures, or time periods may call it something else; capture that here rather than burying it in prose).
- **Status** — active/current, historical, defunct, or whatever the category-appropriate equivalent is (ruined for a location, disbanded for a faction, deceased for a character). Only ask if it isn't obvious from context (a brand-new entity being created is implicitly active/current — don't ask).

## Narrative function

Is this something the story returns to repeatedly, something that appears once, or something more symbolic/thematic than literally present on the page? This shapes how much ongoing-consistency detail is worth nailing down now versus leaving loose until it's needed.

## Connections to existing material

Does this relate to any faction, character, location, system, or other entity already established in the notes? This is a fact-finding branch, not a question-for-the-user branch by default — search the notes first and surface what's found as a proposed connection ("this seems to border the territory already established in X") for confirmation rather than asking cold. Only escalate to a real question if the search is genuinely inconclusive or contradictory.

## Tone consistency

Does this need to match an established atmosphere for the broader world, or is contrast with that atmosphere the actual point (a grim world with one absurdly cozy location, played straight)? Worth asking explicitly rather than assuming consistency is always the goal.

## How Infobox fields work (general note, not a branch)

Each category tree file has its own "Infobox fields" list — short factual fields meant to render as a compact block at the top of the note, above the prose body (a table, a bullet list of `**Field:** value` lines, or whatever format the user's existing notes already use — infer from an example if one exists, otherwise default to a simple bullet list).

These are handled differently from the narrative branches above:

- They're asked as an early, low-branching pass, before the deeper narrative tree — most infobox fields don't depend on each other, so they can usually go in one or two grilling rounds rather than spreading across many.
- Prefer fact-finding over asking when possible (a "greater region" field overlaps with the Connections fragment above — search first, propose what's found, only ask if inconclusive).
- Fields marked as type-conditional in a category's tree only get asked when that condition applies. Skip inapplicable fields entirely in the final note — never fill one in as "N/A" or "unknown."
- If a field's answer is more than a short phrase, it probably belongs in the prose body instead — infobox fields should stay terse enough to scan at a glance.
