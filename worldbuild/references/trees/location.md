# Location

## Infobox fields

Asked as an early pass, before the narrative branches below. See `_shared.md` → "How Infobox fields work" for general handling, and "Shared infobox fields" for the Name/Status fields every category includes.

Location-specific, in addition to the shared ones:

- **Type**. Settlement, wilderness, structure, or region, from the root decision below. Always included once that is resolved.
- **Greater region / parent location**. What this belongs to or sits within, if anything. Fact-find first, since this overlaps with the Connections fragment. Ask only if the notes do not already establish it.
- **Included locations**. The reverse relation: smaller locations that sit inside this one, if any exist yet in the notes. Examples are a settlement's districts, a region's cities, and a structure's named rooms or wings. Fact-find. Do not ask the user to list children that may not have been created yet, because this fills in as those child notes get written and linked.
- **Denomym**. What someone or something from here is called, such as "a Rivenholm native". It applies only if the location has or could plausibly have inhabitants. Skip it for a wilderness feature with no population and ask for settlements and regions. For structures and landmarks, ask only if they are inhabited, such as a keep or a monastery, and not if they are purely physical, such as a ravine or a ruin with no residents.
- **Founding / formation date, or age**. When it came to be, in whatever calendar or relative-time convention the setting uses, such as an absolute date, "three generations ago," or "since before recorded history." It applies to settlements, structures, and regions that are political or administrative entities. Usually skip it for wilderness and natural features unless the setting treats their formation as narratively significant, such as a crater from a specific cataclysm or a forest that grew in living memory.
- **Owner / ruler**. A specific Character if one exists or is being created alongside this note. Fact-find first. This differs from Governing authority below, because this is a name and that is a system or title.
- **Owning organization**. A specific Faction if applicable. Fact-find first. This differs from Owner / ruler, since a location can be owned by a corporation or institution rather than ruled by one person, or both at once, such as a duke who owns it personally and answers to a crown that owns the realm.
- **Governing authority**. Condensed to a phrase here. The full explanation of how and why belongs in the narrative body through the settlement branch below.
- **Contested by**. Any rival claimants to ownership or control, if the location's status is actively disputed. Skip it entirely if uncontested and do not render an empty field.
- **Population** (settlements only). A rough figure or scale descriptor such as hamlet, city, or metropolis, not a precise number unless the user has one.

## Document sections (prose body)

Regardless of type, the prose body should generally cover **Geography**, **Flora & Fauna**, and **Natural Resources** where relevant. Skip any that do not apply, since a single-room structure does not need a Flora & Fauna section. These are the baseline sections, and each type branch below adds its own.

## Root decision: type gate

What kind of location is this? Nothing below can be asked until this is settled, since the branches diverge completely.

- Settlement
- Wilderness / natural feature
- Structure / landmark
- Region / territory

If none of these fit, don't force it. Tell the user this location does not match the existing gate and ask what the right category is. It may be better to add a new type here than a new top-level category in `_index.md`.

## Settlement branch

Interview questions:

- Who governs it, and by what authority? It might be formal law, tradition, force, or an absence of governance.
- What is its rough scale and social character? Does everyone know everyone, or is it anonymous enough for a stranger to disappear into?
- What does it depend on economically?
- What would a visitor notice in the first few minutes, such as sound, smell, or architecture? What one detail makes this place itself and not a generic stand-in?
- Does this place change by season or time of day, like a market square that is dead at dawn and chaotic by noon, or a town that floods every spring? WA's fields describe a place statically, but ask this for anywhere the story is likely to revisit more than once.
- How does it defend itself, if at all? It might have walls, a garrison, natural terrain, or nothing.
- What notable guilds or factions operate here? Fact-find first, and check for existing Faction notes tagged to this location before asking.

Additional document sections beyond the baseline of Geography, Flora & Fauna, and Natural Resources: **Demographics**, **Government**, **Defences**, **Industry**, **Infrastructure** (roads, water, and sanitation, as granular as the setting warrants), **Assets** (notable resources or valuables belonging to the settlement as a whole), **Guilds & Factions**, **History**, **Architecture**, **Sensory & Seasonal Variation** (what it is like at different times of day or year; WA's settlement fields describe the place as a fixed snapshot).

## Wilderness / natural feature branch

Interview questions:

- Terrain and climate.
- What is dangerous about it, if anything?
- What resources or features make it narratively relevant rather than pure scenery?
- Does anything living there have agency in the story, such as a creature, a hidden settlement, or a faction using it as territory? Check the connections fragment before asking, since existing material may already answer this.

Document sections: the baseline three (Geography, Flora & Fauna, Natural Resources) generally cover this type. Go further only if narrative function (see `_shared.md`) marks it as a recurring location. In that case borrow whichever Structure/landmark sections below apply. Sensory and Hazards are the most commonly relevant.

## Structure / landmark branch

Interview questions:

- What was it originally built or formed for, and what is it used for now, if those differ?
- Who currently controls or has access to it?
- What state is it in? It could be pristine, ruined, contested, or somewhere in between.
- What one physical detail should recur if this location appears across multiple scenes, chapters, or sessions?

Additional document sections. This is the richest type and has the fullest section list: **Purpose** (what it is for), **Design** (how it is laid out and built), **Entries** (ways in and out, useful for any scene with movement through it), **Sensory** (what it looks, sounds, and smells like), **Denizens** (who or what currently occupies it; link out to Character, Creature, and Species notes rather than duplicating them here), **Contents** (notable things inside), **Valuables** (anything worth taking, guarding, or fighting over), **Hazards** (physical, magical, or other dangers), **Properties** (any special or magical effects the structure itself has), **Alterations** (how it has been modified since it was built or formed), **Architecture**, **History**.

Not every landmark needs every section. A small shrine does not need Hazards or Valuables. Use this as the fuller checklist to draw from rather than defaulting to a thin entry.

## Region / territory branch

Interview questions:

- What smaller locations does it contain or border? Fact-find first and search existing notes before asking. The Infobox's Included locations field largely captures this already.
- What, if anything, unifies it culturally or politically?
- How would a character know they had crossed into it?

Document sections: generally the baseline three plus whatever the constituent locations do not already cover. A region note should not duplicate detail that belongs in one of its settlements or landmarks. It should stay at the level of what is true across the whole area.

## Then append `_shared.md`

Narrative function, connections to existing material, and tone consistency, in that order, after the type-specific branch above is resolved.
