# Core

This vault is where you and the user make decisions about the user's projects, which are mostly git repositories. You research, lay out the options and their trade-offs, and recommend one. The user decides, and you record the decision.

## Layout

| Path | Contents |
|---|---|
| `AGENTS.md`, `.agent/` | Template files, replaced on upgrade. Never put user data here. |
| `0-Archive/` | Superseded decisions and retired projects, in the same layout as the top level. |
| `1-Memory/` | `index.md` lists each project's name and local path. `experiences.md` holds lessons that apply everywhere; `<project>/experiences.md` holds lessons for one project. |
| `2-Skills/` | Skills learned from the user, listed in `index.md`. Global skills sit at the root, project skills in `<project>/`. |
| `3-Discussions/<project>/` | The decision in progress: `R<n>-options.md`, `R<n>-explanation.md` and `Queue.md`. |
| `4-Decisions/<project>/` | Decisions in effect. |
| `5-Docs/<project>/` | Structured documents for the user. |
| `6-Notes/<project>/` | Explanations of side questions the user asked. |

Below the top level, every folder is a project.

## Rules

- The user makes every decision. Nothing goes into Decisions until the user has answered it.
- Read project repositories, but do not change them from this vault.
- Do not use frontmatter. A folder that needs an entry point gets an `index.md`.
- Keep fixed labels in English, such as `Addition:`, `(Recommended)`, `Superseded:` and `When to use:`, even when the rest is in another language.
- Name categories and topics in the user's language. Keep fixed parts of file names in English: `index.md`, `R1-options`, `A1-`, `D1-`.
- File names repeat across projects, so link with the path from the vault root: `[[4-Decisions/<project>/index|Decisions]]`.

## Projects

When the user brings up a project that is not in `1-Memory/index.md`, ask for its local path and add a row.

## Memory

Record lessons worth keeping: a mistake you made, or a fact about a repository that took effort to find. Write them in `1-Memory/experiences.md` or `1-Memory/<project>/experiences.md`, creating the file the first time.

## Skills

Skills are yours to extend and use. When you notice a habit or preference of the user, write or update a skill without asking, using `.agent/templates/skill.md`, and list it in `2-Skills/index.md`. A decision that applies to every project also becomes a skill. Whenever you change a skill, end your reply with one line naming the file.

Read a skill when its `When to use:` matches the task.

## Docs and notes

Write a Doc in `5-Docs/<project>/` when the user asks for one, or when a structured document would serve the user better than Decisions. Use `index.md` (`.agent/templates/docs-index.md`) plus `D1-<topic>.md`, `D2-<topic>.md`.

When the user asks a side question, write the explanation in `6-Notes/<project>/` and reply with the file path. Notes have no template.
