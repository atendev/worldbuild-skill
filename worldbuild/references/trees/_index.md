# Tree index

Read this file first to decide which tree file(s) to load — don't open every tree file to check. Shared fragments common to every *entity* tree live in `_shared.md` — always load alongside whichever entity category file applies. Compilation and meta categories generally don't use `_shared.md`.

Each entity category has a companion output skeleton in `references/templates/{same-filename}.md` (see SKILL.md Step 6). Compilation and meta categories don't have templates — their shape comes from synthesis, not a fixed skeleton.

**WA source** notes which WorldAnvil template(s) (from `iamromeo/worldanvil-templates`, `article-templates/base-template/`) fed that category, if any — re-fetch from the repo when revising rather than assuming anything is cached locally.

When a new category is drafted per SKILL.md Step 2a, flip its status to Done, derive its template, and update this index.

**Beyond-WA audit (done once, worth repeating for any category drafted later without one):** WA's templates are wiki-reference oriented and consistently miss anything that only matters because this is a *story* — internal states no outside observer would document, sensory/temporal experience, and prose-craft concerns. Fixed so far: Character (Secrets, Narrative Role & Arc), Faction (Public Perception), Culture (Cuisine & Food Culture), Magic system (Sensory Manifestation), Religion (Afterlife Beliefs, Symbols & Iconography), Species (Sensory Capabilities), Location (Sensory & Seasonal Variation for settlements), Event (Casualties & Cost), Calendar (Day Divisions). Everything else was reviewed and judged adequately covered — that's a judgment call, not a guarantee, so worth a second look once any of those categories gets real use.

## Entities

Things that get their own single note — a person, place, system, or object.

| Category | File | Tree | Template | WA source | Notes |
|---|---|---|---|---|---|
| Location | `location.md` | Done | Done | `location`, `settlement`, `landmark` | Settlements, wilderness/natural features, structures/landmarks, regions/territories |
| Faction / Organization | `faction.md` | Done | Done | `organization`, `rank` | Guilds, governments, criminal orgs, military orders. Absorbs what would otherwise be Political system and Economy (both fully covered by its Government/State branch and shared Economic & Trade block — no separate categories needed). Ranks/titles documented inline via its own Ranks & Titles section |
| Character | `character.md` | Done | Done | `person` | Individual named person. Unique interview-mode choice (normal vs. in-character — see tree). Includes a Divine toggle that absorbs what would otherwise be a separate Deity category, matching WA's own `person` template design |
| Species / Race / Ancestry | `species.md` | Done | Done | `species` | Sapient/non-sapient toggle rather than a hard type-gate |
| Creature / Monster | `creature.md` | Done | Done | None | Individual-or-type root decision; reuses Species' non-sapient shape at narrower scale |
| Religion / Belief system | `religion.md` | Done | Done | None (draws on `organization`'s religious fields) | Doctrine/cosmology, independent of institution — skip creating this note entirely when one Faction (Religious organization type) already covers the same ground with no meaningful doctrine/institution split |
| Culture | `culture.md` | Done | Done | `ethnicity` | Naming conventions, social ideals, customs — very rich WA match |
| Magic system | `magic-system.md` | Done | Done | None (loosely informed by `spell`) | Source, access, cost, limits |
| Spell / Technique | `spell.md` | Done | Done | `spell` | Sub-entity of Magic system — only split out once there are enough named spells to be worth linking individually |
| Technology / Tech system | `tech-system.md` | Done | Done | `technology` | Lean template; borrow Magic system's Costs & Limitations framing if this tech functions like a magic system |
| Language / Script | `language.md` | Done | Done | `language` | |
| Artifact / Object | `artifact.md` | Done | Done | `item` | |
| Historical event / Era | `event.md` | Done | Done | `militaryConflict` (wars only) | Type-gated: Military conflict vs. Other bounded event |
| Vehicle / Ship / Mount | `vehicle.md` | Done | Done | `vehicle` | WA fields skew sci-fi/naval — treat as optional for low-tech vehicles |
| Calendar / Timekeeping system | `calendar.md` | Done | Done | None | |
| Holiday / Custom / Ritual | `custom.md` | Done | Done | `ritual` | |
| Condition / Affliction | `condition.md` | Done | Done | `condition` | Disease, curse, or other affliction |
| Document / Text | `document.md` | Done | Done | `document` | Content-centric — distinct from Artifact's object-centric focus |
| Material / Resource | `material.md` | Done | Done | `material` | Skip hard-chemistry fields (melting point etc.) unless the setting's genre actually cares |
| Profession / Occupation | `profession.md` | Done | Done | `profession` | |
| Myth / Legend | `myth.md` | Done | Done | `myth` | Connects to Culture, Religion, Location, Character without being owned by any one of them |

**Merged into other categories, no separate tree:** Rank/Title (→ Faction), Political system (→ Faction), Economic system (→ Faction), Deity (→ Character's Divine toggle).

**Explicitly out of scope** (WA templates that don't map to a worldbuilding-lore category for this skill): `plot.html.twig` (story-arc/scene tracking — outline/manuscript territory, handled elsewhere); `report.html.twig` (TTRPG session/campaign log); `generic.html.twig` and `prose.html.twig` (freeform fallback formatting, not distinct categories); `law.html.twig` (thin — three fields — folded into Faction's Government/State branch rather than given its own row).

## Compilation

Documents synthesized across many existing entity notes rather than describing one new thing. Shallow scope/audience/format tree, not deep branching — see SKILL.md Step 4, compilation mode. No WA source for any of these — WA's per-article model doesn't have a compiled-document concept.

| Category | File | Status | Notes |
|---|---|---|---|
| Story bible | `story-bible.md` | Done | Scope/audience/format, then synthesize |
| Glossary | `glossary.md` | Done | Pulls from Language vocabulary sections where they exist |
| Timeline / Chronology | `timeline.md` | Done | Uses Calendar's date convention; flags date conflicts rather than resolving them silently |
| Pantheon | `pantheon.md` | Done | Compiles Character notes with Divine = yes |
| Bestiary | `bestiary.md` | Done | Compiles Species (non-sapient) and Creature notes |
| Relationship map | `relationship-map.md` | Done | Compiles Character notes' Social sections; flags one-sided relationships as continuity gaps |

## Meta

Documents that produce or govern the trees/templates themselves rather than describing world content. No WA source for either.

| Category | File | Status | Notes |
|---|---|---|---|
| Genre & theme template | `genre-theme.md` | Done | Formalizes what Step 2a does ad hoc — from existing notes or outside research |
| Style / tone guide | `style-guide.md` | Done | Formalizes the one-off "point me at a template" pattern from Step 6 into a standing reference |
