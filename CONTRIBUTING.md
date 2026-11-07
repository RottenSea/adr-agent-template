# Contributing

Issues and pull requests are welcome.

## Issues

Say which agent you used. If round files or the output of `sh .agent/check.sh` show the problem, include them.

## Pull requests

- Keep each pull request to one change.
- Add a line under `## [Unreleased]` in `CHANGELOG.md`.
- Write commit messages with [gitmoji](https://gitmoji.dev), using the emoji character, as in `📝 Explain the upgrade steps`.

## What belongs in the core

`.agent/core.md` and `.agent/workflow.md` hold only rules that apply to every user. Personal habits belong in skills, which the agent writes in each vault.

Everything in the repository is in English. Fixed labels such as `Addition:` and `(Recommended)` stay in English, since the agent parses them.

## Releasing

1. Move the entries under `## [Unreleased]` into a new `## [x.y.z] - YYYY-MM-DD` section, and update the links at the bottom of the file.
2. Commit as `🔖 Release vx.y.z`.
3. Create an annotated tag with `git tag -a vx.y.z -m "vx.y.z"` and push it. The release workflow builds the zip and creates the GitHub release, using this version's section of the changelog as the notes.

## License

Contributions are licensed under [Apache-2.0](LICENSE).
