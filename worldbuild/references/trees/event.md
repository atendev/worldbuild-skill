# Historical Event / Era

WA source: `militaryConflict.html.twig`, but that covers only wars. This tree extends it to any bounded historical event, with the military branch as one option among several.

## Infobox fields

Shared Name/Status plus the following. **Type** is one of war, founding, cataclysm, disaster, discovery, or political upheaval. **Start date**. **End date**, if the event has a clear endpoint. Many do not, such as a gradual cultural shift. **Location**, as a relation. **Parties involved**, as a relation list to Faction and Character. These are the belligerents for a war and the key figures for any other type.

## Root decision: type gate

- **Military conflict**. A war, battle, or armed engagement.
- **Other bounded event**. A founding, cataclysm, disaster, discovery, or similar.

## Military conflict branch

- Who were the belligerents, and what triggered the engagement? This is the prelude.
- What was the battlefield or theater like, and did terrain or location shape the outcome?
- What did it cost in casualties, destruction, and resources spent? WA's `militaryConflict` fields skip this. They go from engagement straight to outcome without asking what was lost on the way, and cost is often what makes a war's legacy feel earned rather than abstract.
- What was the outcome, and is it disputed because different sides tell it differently?

Document sections: **Prelude**, **Belligerents & Deployment**, **Battlefield**, **Engagement** (the course of events), **Casualties & Cost**, **Outcome & Result**, **Aftermath**, **Legacy**.

## Other bounded event branch

- What happened, in sequence?
- Who caused it or was most responsible, if anyone, as opposed to a natural or impersonal cause?
- What changed afterward that would not have changed otherwise?

Document sections: **What Happened** (the course of events, like Engagement above), **Causes**, **Aftermath**, **Legacy**.

## Then append `_shared.md`

Connections matters more here than almost anywhere else. An event's narrative weight often comes from what it connects to, such as the factions it reshaped, the locations it altered, and the characters it created or destroyed. Fact-find thoroughly.
