# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `plan.md`: before a decision is carried out outside the vault, the agent writes the steps there and the user approves them in a last round, from `templates/plan.md`
- Each question's section in an explanation file opens with a `Current:` line on how things stand now
- A decision that belongs to no single project sits directly in `4-Discussions/`, and `context.sh` lists that folder at every start

### Changed

- A task that needs the user to decide something, or takes several steps, goes through a decision instead of the chat. A direct instruction that leaves nothing to choose is carried out without review

- Decisions in effect move to `3-Decisions/` and decisions in progress to `4-Discussions/`. To upgrade, rename `4-Decisions/` to `3-Decisions/`, `3-Discussions/` to `4-Discussions/` and `0-Archive/4-Decisions/` to `0-Archive/3-Decisions/`, then update the links and paths that name them

## [0.4.0] - 2026-11-07

### Added

- An empty `3-Discussions/` folder in the release zip

### Changed

- The agent may change project repositories from the vault, not only read them
- `4-Decisions/index.md` links each project's decisions, like every other index
- `check.sh` reports every file the `index.md` of its folder does not link to, instead of listing the roots

## [0.3.0] - 2026-11-07

### Changed

- Notes are named `N1-<topic>.md`, `N2-<topic>.md`, in the order the questions came up, like Docs

## [0.2.1] - 2026-11-07

### Added

- `CONTRIBUTING.md`, covering issues, pull requests, commit messages, what belongs in the core, and releasing

### Changed

- The README's Contributing section links to `CONTRIBUTING.md`

## [0.2.0] - 2026-11-07

### Added

- `Discuss first` option on every question: the agent answers briefly under the question and asks it again next round
- `## To do` section in options files for things the user has to do by hand
- `2-Skills/observed.md` for habits seen only once, with its template
- Core rules: check for existing content before adding, never make up facts, say so before breaking a rule, keep project repositories free of vault references, treat files the user wrote as read-only, and update every reference after moving a file
- `alwaysUpdateLinks` in the shipped Obsidian settings
- A root `index.md`, and an `index.md` in every folder except `3-Discussions/`, with one template for all of them
- Core rule: links form a tree, with every file linked only from the `index.md` of its folder
- `.agent/check.sh`, which the agent runs after finalizing or moving files to catch broken links, extra parents, cycles and missing indexes
- Decisions files open with one sentence on what they record and where the Docs are

### Changed

- The release zip holds a single `adr-agent-template` folder, and the README says to rename it and move it into a directory of your own
- The README explains how these records differ from standard ADRs
- The project table moved from `1-Memory/index.md` to `1-Memory/project.md`; `1-Memory/index.md` is now the folder's index
- Explanation files open with what earlier rounds settled, lead each section with the recommendation, and use tables and code blocks for comparisons
- A question that settles several things lists each one with `Yes` and `No` checkboxes, so an unanswered item stays visible
- A skill is written only after a habit shows up twice, or when the user states it as a rule
- Facts in memory files that can change carry `(as of YYYY-MM-DD)`

### Removed

- `.gitkeep` files, now that every folder has an `index.md`
- The Docs index template, replaced by the shared `index.md` template

## [0.1.0] - 2026-11-07

### Added

- Vault template in `vault/`: `AGENTS.md`, the `.agent/` core with its context script, rules, workflow and file templates, Obsidian settings, and the top-level folders
- Release workflow that attaches the vault as a zip to each release

### Changed

- README covers installation, usage, the vault layout and upgrading

## 0.0.1 - 2026-11-07

### Added

- README following Standard Readme
- This changelog

[unreleased]: https://github.com/RottenSea/adr-agent-template/compare/v0.4.0...HEAD
[0.4.0]: https://github.com/RottenSea/adr-agent-template/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/RottenSea/adr-agent-template/compare/v0.2.1...v0.3.0
[0.2.1]: https://github.com/RottenSea/adr-agent-template/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/RottenSea/adr-agent-template/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/RottenSea/adr-agent-template/releases/tag/v0.1.0
