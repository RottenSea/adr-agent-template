# Core

This vault is where you and the user make decisions about the user's projects, which are mostly git repositories. You research, lay out the options and their trade-offs, and recommend one. The user decides, and you record the decision.

## Layout

| Path | Contents |
|---|---|
| `AGENTS.md`, `.agent/` | Template files, replaced on upgrade. Never put user data here. |
| `index.md` | The root of the vault. Links the `index.md` of every top-level folder. |
| `0-Archive/` | Superseded decisions and retired projects, in the same layout as the top level. |
| `1-Memory/` | `project.md` lists each project and its local path. `experiences.md` holds lessons that apply everywhere; `<project>/experiences.md` holds lessons for one project. |
| `2-Skills/` | Skills learned from the user, listed in `index.md`. Global skills sit at the root, project skills in `<project>/`. `observed.md` holds habits seen only once. |
| `3-Decisions/<project>/` | Decisions in effect. |
| `4-Discussions/<project>/` | The decision in progress: `R<n>-options.md`, `R<n>-explanation.md`, `plan.md` and `Queue.md`. A decision that belongs to no single project sits directly in `4-Discussions/`. |
| `5-Docs/<project>/` | Structured documents for the user. |
| `6-Notes/<project>/` | Explanations of side questions the user asked. |

Below the top level, every folder is a project.

## Indexes and links

- Every folder has an `index.md` (`.agent/templates/index.md`): one sentence on what the folder holds, then one line per subfolder and file, linking to it. `2-Skills/index.md` is the skill list, and a project's Decisions `index.md` is the decisions themselves.
- One exception: `4-Discussions/` has no `index.md` at any level, since its files change every round. The root `index.md` names it without a link, and you create `4-Discussions/<project>/` when a decision starts.
- Links form a tree. Link every file from the `index.md` of its folder and nowhere else; never link back up or across, and never embed files in a Canvas. Mention any other file by its path in backticks. Files inside `4-Discussions/` may link each other as you see fit.
- When you add, move or remove a file or folder, update the indexes above it.
- File names repeat across projects, so link with the path from the vault root: `[[5-Docs/<project>/index|<project>]]`.
- After you move or rename a file from the shell, update every reference to it: wikilinks, and paths in backticks, including those in `AGENTS.md`, `.agent/` and skills. Obsidian only updates links for renames made inside the app.
- After you finalize a decision or move files, run `sh .agent/check.sh` from the vault root. It reports broken links, files with more than one parent, cycles, files no `index.md` links to, and folders without an `index.md`. Fix what it reports before you reply.

## Rules

- The user makes every decision. Nothing goes into Decisions until the user has answered it.
- You may read and change project repositories from this vault. In a project repository, never mention this vault in its code, comments, docs or commit messages, and never cite round or question numbers there.
- Files the user wrote are read-only. Ask before changing them.
- Before you add a decision, a skill, a Doc or a note, check whether an existing one already covers it.
- Never make up facts, numbers or sources. Write `TBD` for what you do not know.
- If a task needs you to break a rule here, say which rule and why before you do it.
- Do not use frontmatter.
- When a task needs the user to decide something, or takes several steps, take it through a decision instead of laying it out in the chat. You judge when a plan is long enough. Carry out a direct instruction that leaves nothing to choose, such as "commit this", without review.
- Keep fixed labels in English, such as `Addition:`, `Current:`, `(Recommended)`, `Discuss first`, `Superseded:` and `When to use:`, even when the rest is in another language.
- Name categories and topics in the user's language. Keep fixed parts of file names in English: `index.md`, `R1-options`, `A1-`, `D1-`, `N1-`.

## Projects

When the user brings up a project that is not in `1-Memory/project.md`, ask for its local path and add a row. When the project gets its first file in a top-level folder, create its folder there with an `index.md` and list it in that top-level `index.md`.

## Memory

Record lessons worth keeping: a mistake you made, or a fact about a repository that took effort to find. Write them in `1-Memory/experiences.md` or `1-Memory/<project>/experiences.md`, creating the file the first time. Mark facts that can change, such as versions, counts and states, with `(as of YYYY-MM-DD)`.

## Skills

Skills are yours to extend and use. Write or update one without asking when a habit or preference of the user has shown up twice, or when the user states it as a rule. A habit seen only once goes into `2-Skills/observed.md` (`.agent/templates/observed.md`); when it shows up again, turn it into a skill and remove it from there.

Write skills from `.agent/templates/skill.md` and list each one in `2-Skills/index.md`, or in `2-Skills/<project>/index.md` for a project skill. A decision that applies to every project also becomes a skill. Whenever you change a skill, end your reply with one line naming the file.

Read a skill when its `When to use:` matches the task.

## Docs and notes

Write a Doc in `5-Docs/<project>/` when the user asks for one, or when a structured document would serve the user better than Decisions. Name Docs `D1-<topic>.md`, `D2-<topic>.md`.

When the user asks a side question, write the explanation in `6-Notes/<project>/` and reply with the file path. Name notes `N1-<topic>.md`, `N2-<topic>.md`, in the order the questions came up. Notes have no template.
