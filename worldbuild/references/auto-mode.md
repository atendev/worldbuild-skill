# Auto mode

Auto mode builds an entry without interviewing the user. A grilling subagent answers the design tree in the user's place, and an auditing subagent checks the result against canon before anything is written. The user's only inputs are the opening message, which is the braindump, and the settings prompt.

Auto mode is on when the message that invokes the skill contains `send it` or `auto-mode`. Everything else in that message is the braindump. The trigger phrase means "replace the interview with subagents". It is never an answer to the settings prompt, so every run asks Step A's first prompt.

## Settings

| Setting | Default | Other choices |
|---|---|---|
| Grilling model | `opus` | `fable`, `sonnet` |
| Invention | Medium: fill every tree branch, add a hook or two | Low: fill only what the tree requires. High: add secrets, rivals, and new named people and places |
| Canon handling | Protect canon | Stop on conflict, Loose |
| Stub notes | Off | On |
| Audit model | `sonnet` | `opus`, `haiku` |
| Audit rounds | 5 | 3, 8 |
| Tree depth | Full | Standard (skip optional branches), Infobox only |
| Draft gate | Off | On |
| Output template | Default template for the category | The user's style guide |

The model names are Claude Code's subagent models. On another host, map each one to that host's closest model and say so in the settings prompt.

Canon handling choices:

- **Protect canon.** Nothing the grilling subagent invents may contradict the notes. Where the braindump itself conflicts with the notes, the draft follows the braindump and the report flags the conflict.
- **Stop on conflict.** Same as Protect canon, except a braindump conflict stops the run and asks the user which version wins.
- **Loose.** The grilling subagent may also propose retcons to existing notes. Each one goes in the report. Auto mode still never edits a note other than the target.

## Step A. Ask for settings

Run after Step 1 (the notes are located) and before Step 2, on every auto-mode run. Ask with the host's structured question tool (`AskUserQuestion` in Claude Code). Put the default first in every question and label it `(Recommended)`. If the braindump names a specific setting value ("use fable", "audit with haiku"), pre-fill it and show it as already chosen in the first prompt's question text. The first prompt still runs. If the host has no structured question tool, ask the same questions as one numbered list with the defaults shown and accept "defaults" as the answer.

1. **First prompt, one question.** "Run auto mode with the defaults?" List the defaults table in the question text in one line each. Options are "Use defaults (Recommended)" and "Customize". On "Use defaults", go to Step 2.
2. **Second prompt, creative settings.** Four questions: grilling model, invention, canon handling, stub notes.
3. **Third prompt, process settings.** Four questions: audit model, audit rounds, tree depth, draft gate.
4. **Output template.** Ask only if the notes contain a file that looks like a style guide, or the user mentioned one. Options are "Default template (Recommended)" and the style guide's path.

The step is done when the user has answered the first prompt and every setting has a value. Echo the final settings in one line before continuing.

## Changes to Steps 2 to 8

Steps 1, 3, and 6 run as written. The others change as follows.

- **Step 2, ambiguous category.** Pick the most likely category and record the choice as an assumption for the report.
- **Step 2a, no tree.** Draft the tree as written, then send it to the auditing subagent instead of the user. Save it once the auditor approves.
- **Step 4, mode.** Decide from Step 3's search. Record the choice as an assumption.
- **Step 5, braindump.** The invoking message is the braindump.
- **Step 7, grilling.** Replace it with Steps B and C below.
- **Step 8, write.** Replace it with Steps D and E below.

## Step B. Build the canon packet

Write the results of Step 3's search to a scratch file outside the notes, such as the host's temp folder. For each relevant note, include its path and the excerpts that bear on this entry, with line numbers. In revision mode, include the target note in full. Both subagents read this packet so neither repeats the search. The step is done when every note Step 3 flagged appears in the packet.

## Step C. Grilling loop

The main thread runs `/grilling` over the assembled tree as Step 7 describes, with one difference. Each round's questions, options, and recommendations go to the grilling subagent instead of the user.

Start one grilling subagent on the grilling model. Its brief:

- The braindump, the canon packet path, the notes path, the invention level, and the canon handling setting.
- It runs no skills. It answers questions and later writes the draft.
- For each question it either takes the recommendation, picks another option, writes its own answer, or rejects the question as wrong for this entry and says why.
- Each answer carries a one-line reason, a source tag (`braindump`, `canon`, or `invented`), and the canon paths it relied on.
- It keeps every answer consistent with the canon packet and with its own earlier answers. Under Stop on conflict, it reports a braindump conflict instead of answering, and the main thread stops and asks the user.

Continue the same subagent across rounds with the host's message tool (`SendMessage` in Claude Code). Each round, send only the new questions and the earlier answers they depend on. Build the next round from its answers, as grilling would from a user's. The loop is done when grilling's frontier is empty. Grilling's confirmation gate is met by the audit in Step D.

In the final round, the grilling subagent writes the draft. It fills the template from Step 6 following Step 8's rules for infobox, prose, links, and omitted fields. If stub notes are on, it also writes a stub for each new named entity the draft introduces, holding only settled facts and a line marking it as an auto-mode stub.

## Step D. Audit loop

Start one auditing subagent on the audit model. The grilling subagent never audits its own work. Send the auditor the draft and any stubs, the decision log from Step C, the canon packet path, the notes path, and the canon handling setting. It may search the notes beyond the packet.

The auditor checks:

- Contradictions with existing notes: names, dates, places, who is alive, who holds what.
- Violations of established magic, tech, or physical rules.
- Timeline arithmetic: ages, durations, and event order.
- An existing note that already describes this entity under another name.
- Tone, naming, and linking conventions that differ from the existing notes.
- Tree branches the draft skipped at the chosen depth.

It returns `APPROVE` or a numbered list of problems. Each problem quotes the draft sentence and cites the canon it breaks as `path:line`. Drop any canon objection that has no citation. Convention and coverage objections cite the note or tree branch they compare against.

Send the problems to the grilling subagent. It revises, or disputes a problem by citing canon that supports its version. Send the auditor only the changed parts, the disputes, and its own open objections. Repeat until `APPROVE` or until the audit rounds run out. The auditor never edits the draft.

## Step E. Write and report

- **Approved, draft gate off.** Write the entry and stubs to the notes as Step 8 describes. In revision mode, edit the target note in place.
- **Approved, draft gate on.** Write to `{name}.draft.md` beside where the entry belongs, report, and wait. On the user's OK, move it to the final name. If the user asks for changes, send them to the grilling subagent and run one more audit before writing.
- **Out of audit rounds.** Write to `{name}.draft.md`, report the open objections, and stop.

The report lists:

1. Where each file went.
2. Every `invented` decision, one line each. This is the list the user is most likely to want to check.
3. Assumptions from Steps 2 and 4.
4. Braindump conflicts with canon and which version the draft follows.
5. Proposed retcons, under Loose only.
6. The audit result and the number of rounds.

Then continue with Step 9.

## Limits

- Auto mode writes only the target entry, its stubs, and the draft file. It reports changes to any other note as proposals.
- If the host cannot start subagents, run the grilling and auditing roles inline one after the other, and warn the user once that the audit is not independent.
