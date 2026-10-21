# Character

## Interview mode choice

Ask this before Step 5's braindump, in addition to it. Before starting the braindump, ask the user how they want to build this character:

- **Normal.** Standard questions, answered about the character in the third person, same as any other category.
- **In-character interview.** The user answers *as* the character, in first person, in their own words. The phrasing, rhythm, word choice, and attitude the user writes with while answering in voice become the source material for the character's Speech and Mannerisms sections, instead of being inferred afterward from a factual description of how the character talks.

If in-character is chosen, reframe questions from the tree below as if asked directly to the character, in second person, in a tone that invites an in-character answer rather than a report about them. For example, ask "why did you really leave home?" rather than "what is {{Name}}'s reason for leaving home?" Every answer in this mode does double duty. First, extract the same facts a normal answer would settle, such as motivations, history, and relationships, and record them as settled facts exactly as usual. Second, treat the answer's own phrasing as a voice sample. Note striking word choices, sentence rhythm, and any quotable lines as they come up, and draft the Speech and Mannerisms document sections directly from these observations rather than asking for them as separate factual questions. Where a line the user wrote in character is quotable, propose it as a Quotes/Catchphrases candidate for confirmation rather than paraphrasing it into something blander.

Even in this mode, the user isn't locked into full immersion for every question. Factual questions such as birth date or species can be answered plainly if voicing them feels forced. In-character mode is an invitation applied by default across the whole interview, not a requirement per answer. The user can also switch modes mid-interview, or use in-character mode only for the Personality/Social portion of the tree. Mention this option if they seem unsure which to pick, rather than forcing a binary choice with no room to change their mind.

## Toggles

These are not a hard type-gate. Ask early, alongside or instead of a root decision.

Unlike Location or Faction, Character doesn't split into mutually exclusive types. Instead:

- **Is this character divine or god-like in some way**, such as a literal deity, a demigod, or an ascended figure? If yes, include the Divine document section below. If the notes already have a dedicated Religion note this deity belongs to, or this pass is creating one, fact-find and link rather than duplicating doctrine here. This section covers the deity's own domains, symbols, and goals, not the institutional religion built around them. That belongs to Faction's Religious-organization branch or the future Religion category.
- **Does the setting use mechanical stats for characters**, such as a tabletop RPG datasheet? If yes, include the optional RPG Character Sheet section. Otherwise omit it entirely rather than asking about stats for a prose-only setting.

## Infobox fields

Ask these as an early pass alongside the interview-mode choice, before the deeper narrative branches below. See `_shared.md` → "How Infobox fields work" for general handling, and "Shared infobox fields" for Name/Status. Status here typically means alive, deceased, or unknown. Pair it with circumstances of death if the character is deceased and the circumstances are known.

These are character-specific, in addition to the shared ones. They are grouped here for readability but render as one flat Infobox block:

*Identity:* **Species**, a relation, fact-find first; **Ethnicity/Culture**, a relation; **Birth date** and **death date** if applicable, rendered together as a lifespan if both are known, with age if the setting tracks a current year; **Birthplace**; **Current residence/location**, a relation; **Gender**; **Sexuality**; **Gender identity**. Ask these plainly and factually, at whatever level of specificity the user volunteers. Don't probe deeper than offered.

*Appearance:* **Eyes**, **Hair**, **Skin tone**, **Height**, **Weight**. Keep these terse, phrase-length. Full descriptive prose belongs in the Physical Description document section, not here.

*Affiliations:* **Occupation/Profession**, a relation; **Affiliated organization**, a relation to Faction; **Titles and ranks currently held**, a relation to Rank/Title; **Known languages**, a relation to Language.

*Notable:* **Conditions**, a relation to Condition/Affliction, if any apply; **Alignment**, only if the setting uses one; **Quotes/catchphrases**, kept short. In-character interview mode is a strong source of candidates.

Omit any of the above that don't apply or weren't settled. This list is long because characters vary enormously in what is relevant. Don't pad a minor background character's infobox with fields that were never asked about.

## Document sections (prose body)

**Physical Description:** General Condition, Body Features, Facial Features, Identifying Characteristics, Physical Quirks, Sensory Perception, Special Abilities, Clothing & Accessories, Items & Equipment.

**Mental Characteristics:** Personal History, Education, Employment, Achievements, Failures, Mental Trauma, Intellectual Characteristics, Morality & Philosophy, Taboos.

**Personality:** Motivation, Savvies & Ineptitudes, Likes & Dislikes, Virtues, Vices, Personality Quirks, Hygiene.

**Social:** Contacts & Relations, Family Ties, Religious Views, Social Aptitude, Mannerisms, Hobbies, **Speech**, the section most directly built from in-character interview mode when that mode is used.

**Secrets.** What this character is hiding, from whom, and what happens if it comes out. WA's field set omits this because it is a wiki-reference template, not a fiction-craft one. It is often the most useful thing to nail down for a character who will appear in a story, since dramatic irony and reveals depend on it. Ask directly rather than assuming a character has no secrets because none came up elsewhere in the interview.

**Narrative Role & Arc.** WA also omits this. It differs from `_shared.md`'s Narrative function, which asks how *often* this character appears. This section asks *how they change*, if at all, over the course of the story, and what role they play relative to other named characters, such as protagonist, antagonist, foil, mentor, or obstacle. Fact-find existing Character notes for who they are positioned against before asking. Skip this section for a minor or static character rather than forcing an arc onto someone who doesn't need one.

**Wealth & Financial State.**

**Divine**, only if the Divine toggle above is yes: Divine Domains, Holy Books/Codes, Divine Symbols/Sigils, Tenets of Faith, Divine Goals & Aspirations, Holidays associated with this figure.

**RPG Character Sheet**, only if the Stats toggle above is yes. Use whatever stat format the setting or system uses, and fact-find for an existing system reference in the notes before inventing stat categories from scratch.

Not every character needs every section fleshed out. A minor character might warrant only a few lines under Personal History and Motivation. Match depth to the narrative-function answer in `_shared.md` rather than forcing the full checklist on every named person in the notes.

## Then append `_shared.md`

Narrative function, connections to existing material, and tone consistency, in that order, after the branches above are resolved. Take Connections seriously here in particular. Characters are the entity type most likely to reference nearly everything else, including Species, Culture, Faction, Location, Rank, Religion, and Myth, so fact-finding should be thorough.
