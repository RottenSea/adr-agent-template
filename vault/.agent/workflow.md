# Workflow

A project has at most one decision in progress. Its files live directly in `3-Discussions/<project>/`.

## Starting

1. Read the project's Decisions and whatever you need from its repository.
2. If `3-Discussions/<project>/` already has round files, a decision is in progress. Continue it instead of starting another.

## Each round

1. Read every `R<n>-options.md` of the current decision, with the user's answers and any notes they left anywhere in the files. Read an explanation file only when the user follows up on it.
2. Write the next round as `R<n>-options.md` from `.agent/templates/options.md` and `R<n>-explanation.md` from `.agent/templates/explanation.md`. Keep the earlier rounds.
3. In the chat, give only the file paths.

Options files stay short. Ask every question whose prerequisites are settled, and leave questions that depend on an open answer for a later round. Mark a single-choice question with `○` and a multiple-choice question with `□` after its number. Mark your recommendation with `(Recommended)` and leave every box unticked.

Explanation files have one section per question, as long as it needs: background, how the options compare, examples.

The user usually answers in Obsidian, ticking boxes and writing after `Addition:`. If they answer in the chat, write their answers into the options file.

## Questions that come up mid-decision

- The user wants more detail on a question: add it to that question's section in the explanation file and adjust the options if needed. Never overwrite what the user has already filled in.
- A new question that belongs to this decision goes into the next round.
- An unrelated question goes into `3-Discussions/<project>/Queue.md` (`.agent/templates/queue.md`), to be taken up after this decision.

## Finalizing

When the user has answered everything and you have nothing left to ask, finalize without asking:

1. Write the decisions into `4-Decisions/<project>/`.
2. Move the decisions they replace to `0-Archive/4-Decisions/<project>/`.
3. Update `5-Docs/<project>/` if a Doc is affected.
4. Delete every `R<n>-*` file of this decision.
5. Tell the user what is waiting in `Queue.md`, if anything.

## Decisions

`4-Decisions/<project>/index.md` holds every decision still in effect, implemented or not (`.agent/templates/decisions.md`). Each category is a `##` heading, and each decision is one list item: what was decided, a short reason, what was rejected and why (if anything), and the date.

When the file grows too long, move each category into `A1-<category>.md`, `A2-<category>.md` and so on (`.agent/templates/decisions-category.md`), and turn `index.md` into a list of those files (`.agent/templates/decisions-index.md`). You decide when.

A replaced decision moves to the same path under `0-Archive/`, with `Superseded: <YYYY-MM-DD>, <reason>` appended to the item.

## Retiring a project

Move the project's folder in each top-level folder to the same path under `0-Archive/`. To restore it, move the folders back.
