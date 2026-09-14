# Location

## Infobox fields

Asked as an early pass, before the narrative branches below. See `_shared.md` → "How Infobox fields work" for general handling, and "Shared infobox fields" for the Name/Status fields every category includes.

Location-specific, in addition to the shared ones:

- **Type** — settlement / wilderness / structure / region, from the root decision below. Always included once that's resolved.
- **Greater region / parent location** — what this belongs to or sits within, if anything. Fact-find first (overlaps with the Connections fragment); only ask if the notes don't already establish it.
- **Included locations** — the reverse relation: smaller locations that sit inside this one, if any exist yet in the notes (a settlement's districts, a region's cities, a structure's named rooms/wings). Fact-find — don't ask the user to enumerate children that may not have been created yet; this fills in naturally as those child notes get written and linked.
- **Denomym** — what someone/something from here is called (e.g. "a Rivenholm native"). Only applies if the location has or could plausibly have inhabitants — skip for a pure wilderness feature with no population, ask for settlements and regions, ask conditionally for structures/landmarks if they're inhabited (a keep, a monastery) rather than purely physical (a ravine, a ruin with no residents).
- **Founding / formation date, or age** — when it came to be, in whatever calendar or relative-time convention the setting uses (an absolute date, "three generations ago," "since before recorded history"). Applies to settlements, structures, and regions that are political/administrative entities. Usually skip for wilderness/natural features unless the setting treats their formation as narratively significant (a crater from a specific cataclysmic event, a forest that grew in living memory).
- **Owner / ruler** — a specific Character if one exists or is being created alongside this note (fact-find first). Distinct from Governing authority below — this is a name, that's a system/title.
- **Owning organization** — a specific Faction if applicable (fact-find first) — distinct from Owner/ruler, since a location can be corporately or institutionally owned rather than ruled by one person, or both at once (a duke who owns it personally, answering to a crown that owns the realm).
- **Governing authority** — condensed to a phrase here (the full explanation of how and why belongs in the narrative body via the settlement branch below).
- **Contested by** — any rival claimants to ownership or control, if the location's status is actively disputed. Skip entirely if uncontested — don't render an empty field.
- **Population** (settlements only) — a rough figure or scale descriptor (hamlet, city, metropolis) rather than requiring a precise number unless the user has one.

## Document sections (prose body)

Regardless of type, the prose body should generally cover **Geography**, **Flora & Fauna**, and **Natural Resources** where relevant — skip any that genuinely don't apply (a single-room structure doesn't need a Flora & Fauna section). These are the baseline sections; each type branch below adds its own on top.

## Root decision — type gate

What kind of location is this? Nothing below can be asked until this is settled, since the branches diverge completely.

- Settlement
- Wilderness / natural feature
- Structure / landmark
- Region / territory

If none of these fit, don't force it — flag to the user that this location doesn't cleanly match the existing gate and ask what the right category is; it may be worth adding a new type here rather than a new top-level category in `_index.md`.

## Settlement branch

Interview questions:

- Who governs it, and by what authority (formal law, tradition, force, absence of governance)?
- Rough scale and social character — is this a place where everyone knows everyone, or anonymous enough for a stranger to disappear into?
- What does it economically depend on?
- What would a visitor notice in the first few minutes — sound, smell, architecture, the one detail that makes this place itself and not a generic stand-in?
- Does this place change meaningfully by season or time of day — a market square that's dead at dawn and chaotic by noon, a town that floods every spring? Absent from WA's fields (which describe a place statically), but worth asking for anywhere the story is likely to revisit more than once.
- How does it defend itself, if at all — walls, a garrison, natural terrain, nothing?
- What notable guilds or factions operate here? (Fact-find first — check for existing Faction notes tagged to this location before asking.)

Additional document sections beyond the baseline (Geography/Flora & Fauna/Natural Resources): **Demographics**, **Government**, **Defences**, **Industry**, **Infrastructure** (roads, water, sanitation — however granular the setting warrants), **Assets** (notable resources or valuables belonging to the settlement as a whole), **Guilds & Factions**, **History**, **Architecture**, **Sensory & Seasonal Variation** (what it's like at different times of day or year — absent from WA's settlement fields, which describe the place as a fixed snapshot).

## Wilderness / natural feature branch

Interview questions:

- Terrain and climate.
- What's dangerous about it, if anything?
- What resources or features make it narratively relevant rather than pure scenery?
- Does anything living there have agency in the story — a creature, a hidden settlement, a faction using it as territory? (Check connections fragment before asking — this may already be answered by existing material.)

Document sections: the baseline three (Geography, Flora & Fauna, Natural Resources) generally cover this type without much need to go further, unless narrative function (see `_shared.md`) marks it as a recurring location, in which case borrow whichever Structure/landmark sections below actually apply (Sensory and Hazards are the most commonly relevant).

## Structure / landmark branch

Interview questions:

- What was it originally built or formed for, versus what it's used for now, if those differ?
- Who currently controls or has access to it?
- What state is it in — pristine, ruined, contested, something in between?
- The one physical detail that should recur if this location appears across multiple scenes/chapters/sessions.

Additional document sections — this is the richest type, worth the fullest section list: **Purpose** (what it's for), **Design** (how it's laid out/built), **Entries** (ways in and out — genuinely useful for anything that might feature a scene with movement through it), **Sensory** (what it looks, sounds, and smells like), **Denizens** (who or what currently occupies it — link out to Character/Creature/Species notes rather than duplicating them here), **Contents** (notable things inside), **Valuables** (anything worth taking, guarding, or fighting over), **Hazards** (dangers — physical, magical, or otherwise), **Properties** (any special/magical effects the structure itself has), **Alterations** (how it's been modified since it was built or formed), **Architecture**, **History**.

Not every landmark needs every section — a small shrine doesn't need Hazards or Valuables — but this is the fuller checklist to draw from rather than defaulting to a thin entry.

## Region / territory branch

Interview questions:

- What smaller locations does it contain or border? (Fact-finding first — search existing notes before asking; this is largely what the Infobox's Included locations field already captures.)
- What, if anything, culturally or politically unifies it?
- How would a character know they'd crossed into it?

Document sections: generally the baseline three plus whatever the constituent locations don't already cover on their own — a region note shouldn't duplicate detail that properly belongs in one of its settlements or landmarks; it should stay at the level of what's true across the whole area.

## Then append `_shared.md`

Narrative function, connections to existing material, tone consistency — in that order, after the type-specific branch above is resolved.
