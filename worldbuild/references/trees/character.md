# Character

## Interview mode choice (ask before Step 5's braindump, in addition to it)

Before starting the braindump, ask the user how they want to build this character:

- **Normal** — standard questions, answered about the character in the third person, same as any other category.
- **In-character interview** — the user answers *as* the character, first person, in their own words. The point isn't just collecting different-shaped answers — it's that the phrasing, rhythm, word choice, and attitude the user writes with while answering in-voice becomes the actual source material for the character's Speech and Mannerisms sections, not something inferred afterward from a factual description of how they talk.

If in-character is chosen, questions from the tree below get reframed as if asked directly to the character, second person, in whatever tone invites an in-character answer rather than a report about them — "why did you really leave home?" rather than "what is {{Name}}'s reason for leaving home?" Every answer in this mode does double duty: extract the same facts a normal answer would settle (motivations, history, relationships — recorded as settled facts exactly as usual), and separately treat the answer's own phrasing as a voice sample — note striking word choices, sentence rhythm, and any quotable lines as they come up, and draft the Speech and Mannerisms document sections directly from these observations rather than asking for them as separate factual questions. Where a line the user wrote in-character is genuinely quotable, propose it as a Quotes/Catchphrases candidate for confirmation rather than paraphrasing it into something blander.

The user isn't locked into full immersion for every question even in this mode — factual questions (birth date, species) can be answered plainly if voicing them feels forced; in-character mode is an invitation, applied by default across the whole interview, not a requirement per answer. The user can also ask to switch modes mid-interview, or to use in-character mode only for the Personality/Social portion of the tree — mention this as an option if they seem unsure which to pick, rather than forcing a binary choice with no room to change their mind.

## Toggles (not a hard type-gate — ask early, alongside or instead of a root decision)

Unlike Location or Faction, Character doesn't split into mutually exclusive types. Instead:

- **Is this character divine/god-like in some way** (a literal deity, a demigod, an ascended figure)? If yes, include the Divine document section below. If the notes already have (or this pass is creating) a dedicated Religion note this deity belongs to, fact-find and link rather than duplicating doctrine here — this section covers the deity's own personal domains/symbols/goals, not the institutional religion built around them (that's Faction's Religious-organization branch or the future Religion category).
- **Does the setting use mechanical stats for characters** (a tabletop RPG datasheet)? If yes, include the optional RPG Character Sheet section — otherwise omit it entirely rather than asking about stats for a prose-only setting.

## Infobox fields

Asked as an early pass alongside the interview-mode choice, before the deeper narrative branches below. See `_shared.md` → "How Infobox fields work" for general handling, and "Shared infobox fields" for Name/Status (Status here typically means alive/deceased/unknown — pair with circumstances of death if deceased and known).

Character-specific, in addition to the shared ones — grouped here for readability, though they render as one flat Infobox block:

*Identity:* **Species** (relation, fact-find first), **Ethnicity/Culture** (relation), **Birth date** and **death date** if applicable (rendered together as a lifespan if both are known, with age if the setting tracks a current year), **Birthplace**, **Current residence/location** (relation), **Gender**, **Sexuality**, **Gender identity** — ask these plainly and factually, at whatever level of specificity the user volunteers; don't probe deeper than offered.

*Appearance:* **Eyes**, **Hair**, **Skin tone**, **Height**, **Weight** — keep terse, phrase-length; full descriptive prose belongs in the Physical Description document section, not here.

*Affiliations:* **Occupation/Profession** (relation), **Affiliated organization** (relation to Faction), **Titles and ranks currently held** (relation to Rank/Title), **Known languages** (relation to Language).

*Notable:* **Conditions** (relation to Condition/Affliction, if any apply), **Alignment** (only if the setting uses one), **Quotes/catchphrases** (short — a strong candidate list to build from in-character interview mode).

Omit any of the above that don't apply or weren't settled — this is a long list precisely because characters vary enormously in what's relevant; don't pad a minor background character's infobox with fields that were never actually asked about.

## Document sections (prose body)

**Physical Description:** General Condition, Body Features, Facial Features, Identifying Characteristics, Physical Quirks, Sensory Perception, Special Abilities, Clothing & Accessories, Items & Equipment.

**Mental Characteristics:** Personal History, Education, Employment, Achievements, Failures, Mental Trauma, Intellectual Characteristics, Morality & Philosophy, Taboos.

**Personality:** Motivation, Savvies & Ineptitudes, Likes & Dislikes, Virtues, Vices, Personality Quirks, Hygiene.

**Social:** Contacts & Relations, Family Ties, Religious Views, Social Aptitude, Mannerisms, Hobbies, **Speech** (the section most directly built from in-character interview mode, when used).

**Secrets** — what this character is hiding, from whom, and what happens if it comes out. This is absent from WA's field set entirely (it's a wiki-reference template, not a fiction-craft one), but it's often the single most useful thing to nail down for a character who'll actually appear in a story — dramatic irony and reveals depend on it. Ask directly rather than assuming a character has no secrets just because none came up elsewhere in the interview.

**Narrative Role & Arc** — also absent from WA. Distinct from `_shared.md`'s Narrative function (which asks how *often* this character appears): this asks *how they change*, if at all, over the course of the story, and what role they play relative to other named characters (protagonist, antagonist, foil, mentor, obstacle) — fact-find existing Character notes for who they're positioned against before asking. Skip this section for a genuinely minor/static character rather than forcing an arc onto someone who doesn't need one.

**Wealth & Financial State.**

**Divine** (only if the Divine toggle above is yes): Divine Domains, Holy Books/Codes, Divine Symbols/Sigils, Tenets of Faith, Divine Goals & Aspirations, Holidays associated with this figure.

**RPG Character Sheet** (only if the Stats toggle above is yes) — whatever stat format the setting/system actually uses; fact-find for an existing system reference in the notes before inventing stat categories from scratch.

Not every character needs every section fully fleshed out — a minor character might only warrant a few lines under Personal History and Motivation. Match depth to the narrative-function answer in `_shared.md` rather than forcing the full checklist on every single named person in the notes.

## Then append `_shared.md`

Narrative function, connections to existing material, tone consistency — in that order, after the branches above are resolved. Connections is worth taking seriously here in particular — characters are the entity type most likely to reference nearly everything else (Species, Culture, Faction, Location, Rank, Religion, Myth), so fact-finding should be thorough rather than perfunctory.
