# Workflow

A project has at most one decision in progress. Its files live directly in `4-Discussions/<project>/`. A decision that belongs to no single project lives directly in `4-Discussions/`, also one at a time; when it is finalized, what applies to every project becomes a skill, and facts such as paths go into `1-Memory/`.

## Starting

1. Read the project's Decisions and whatever you need from its repository.
2. If `4-Discussions/<project>/` already has round files, a decision is in progress. Continue it instead of starting another.

## Each round

1. Read every `R<n>-options.md` of the current decision, with the user's answers and any notes they left anywhere in the files. Read an explanation file only when the user follows up on it.
2. Write the next round as `R<n>-options.md` from `.agent/templates/options.md` and `R<n>-explanation.md` from `.agent/templates/explanation.md`. Keep the earlier rounds.
3. In the chat, give only the file paths.

Options files stay short. Ask every question whose prerequisites are settled, and leave questions that depend on an open answer for a later round. Mark your recommendation with `(Recommended)` and leave every box unticked. A question with nothing ticked is unanswered: carry it into the next round.

- A single-choice question has `○` after its number and one checkbox per option. Its last option is `Discuss first`.
- A question that settles several things has `□` after its number. Each thing is a list item with two indented checkboxes, `Yes` and `No`. Below the things comes one `Discuss first` checkbox.
- If the user has to do something by hand, such as creating a token in a web console or changing an app setting, list it in a `## To do` section at the top of the file.

Explanation files are for the user. From round 2 on, open with what earlier rounds of this decision settled. Then give each question its own section, as long as it needs: first a line starting with `Current:` that says how things stand now, then your recommendation and why, then the background. Compare options that differ case by case in a table. When a question is about a format, show each option in a code block. If you drew on other files or pages, name them once at the top.

The user usually answers in Obsidian, ticking boxes and writing after `Addition:`. If they answer in the chat, write their answers into the options file.

## Questions that come up mid-decision

- The user ticked `Discuss first`: answer the question they wrote in `Addition:` briefly, right under that question in the options file, and carry the question into the next round. Put anything long in the explanation file.
- The user wants more detail on a question: add it to that question's section in the explanation file and adjust the options if needed. Never overwrite what the user has already filled in.
- A new question that belongs to this decision goes into the next round.
- An unrelated question goes into `4-Discussions/<project>/Queue.md` (`.agent/templates/queue.md`), to be taken up after this decision.

## The plan

When the user has answered everything and you have nothing left to ask, check whether the decision needs work outside the vault, such as changes to a repository. If it does not, finalize.

If it does, the user reviews a plan before you do any of it:

1. Write `plan.md` in the decision's folder from `.agent/templates/plan.md`: every step you will take, in order, concrete enough to check, such as the text you will write or the files you will change.
2. Write the next round's `R<n>-options.md` with a link to `plan.md` in place of the explanation, and one single-choice question: carry out the plan (Recommended), change it as written in `Addition:`, or `Discuss first`. This round has no explanation file.
3. If the user asks for changes, edit `plan.md` in place, never a new copy, and ask again in the next round. If they approve the plan along with the changes, make the changes and go ahead.
4. Once the user approves, carry out the plan. If a step cannot be done as planned, stop and ask in a new round.

## Finalizing

After the plan is carried out, or when there is none, finalize without asking:

1. Write the decisions into `3-Decisions/<project>/`.
2. Move the decisions they replace to `0-Archive/3-Decisions/<project>/`.
3. Update `5-Docs/<project>/` if a Doc is affected.
4. Delete every `R<n>-*` file of this decision and its `plan.md`.
5. Update the indexes of every folder you added files to.
6. Run `sh .agent/check.sh` and fix what it reports.
7. Tell the user what is waiting in `Queue.md`, if anything.

## Decisions

`3-Decisions/<project>/index.md` holds every decision still in effect, implemented or not (`.agent/templates/decisions.md`). Each category is a `##` heading, and each decision is one list item: what was decided, a short reason, what was rejected and why (if anything), and the date.

When the file grows too long, move each category into `A1-<category>.md`, `A2-<category>.md` and so on (`.agent/templates/decisions-category.md`), and turn `index.md` into a list of those files (`.agent/templates/decisions-index.md`). You decide when.

A replaced decision moves to the same path under `0-Archive/`, with `Superseded: <YYYY-MM-DD>, <reason>` appended to the item.

## Retiring a project

Move the project's folder in each top-level folder to the same path under `0-Archive/`, creating the `index.md` of each level there as needed, and update the indexes on both sides. To restore it, move the folders back.
