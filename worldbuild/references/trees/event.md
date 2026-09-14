# Historical Event / Era

WA source: `militaryConflict.html.twig`, but that only covers wars specifically — this tree extends it to cover any bounded historical event, with the military-specific branch as one option among several.

## Infobox fields

Shared Name/Status plus: **Type** (war, founding, cataclysm, disaster, discovery, political upheaval), **Start date**, **End date** (if the event has a clear endpoint — many don't, e.g. a gradual cultural shift), **Location** (relation), **Parties involved** (relation list to Faction/Character — belligerents for a war, key figures for any other type).

## Root decision — type gate

- **Military conflict** — a war, battle, or armed engagement.
- **Other bounded event** — a founding, cataclysm, disaster, discovery, or similar.

## Military conflict branch

- Who were the belligerents, and what triggered the engagement (prelude)?
- What was the battlefield/theater like, and did terrain or location meaningfully shape the outcome?
- What did it actually cost — casualties, destruction, resources spent? Absent from WA's `militaryConflict` fields, which jump from engagement straight to outcome/result without asking what was lost getting there; cost is often what makes a war's legacy feel earned rather than abstract.
- What was the actual outcome/result — and is it disputed (different sides tell it differently)?

Document sections: **Prelude**, **Belligerents & Deployment**, **Battlefield**, **Engagement** (the course of events), **Casualties & Cost**, **Outcome & Result**, **Aftermath**, **Legacy**.

## Other bounded event branch

- What actually happened, in sequence?
- Who caused it or was most responsible, if anyone (versus a natural/impersonal cause)?
- What changed afterward that wouldn't have otherwise?

Document sections: **What Happened** (the course of events, analogous to Engagement above), **Causes**, **Aftermath**, **Legacy**.

## Then append `_shared.md`

Connections matters more here than almost anywhere else — an event's entire narrative weight often comes from what it connects to (which factions it reshaped, which locations it altered, which characters it created or destroyed). Fact-find thoroughly.
