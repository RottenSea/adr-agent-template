# adr-agent-template

An Obsidian vault template for making architecture decisions with an AI agent.

The agent reads your git repositories, lays out the options and their trade-offs, and asks you questions one round at a time in Markdown files. You answer in Obsidian, and the agent records what you decided. Along the way it keeps notes on what it learned about your projects and your habits.

It works with any agent that reads `AGENTS.md` and can run a shell script.

## Install

1. Download `adr-agent-template-v<version>.zip` from [Releases](https://github.com/RottenSea/adr-agent-template/releases).
2. Unzip it into a directory of its own, outside any clone of this repository.
3. Open that directory as a vault in Obsidian.

## Usage

Start your agent from the vault root and tell it which project you want to decide something about. The first time, it asks for the project's local path.

Each round of questions goes into `3-Discussions/<project>/R<n>-options.md`, with a longer explanation in `R<n>-explanation.md`. Tick the options you want, write anything else after `Addition:`, then tell the agent you have answered. When nothing is left to ask, the agent writes the result to `4-Decisions/<project>/index.md` and deletes the round files.

### Layout

| Path | Contents |
|---|---|
| `AGENTS.md`, `.agent/` | The agent's rules, workflow and file templates |
| `0-Archive/` | Superseded decisions and retired projects |
| `1-Memory/` | Your projects and their local paths, plus what the agent has learned |
| `2-Skills/` | Your habits, as the agent has learned them |
| `3-Discussions/` | The decision in progress, one folder per project |
| `4-Decisions/` | Decisions in effect, one folder per project |
| `5-Docs/` | Structured documents, one folder per project |
| `6-Notes/` | Answers to side questions, one folder per project |

### Upgrading

Replace `AGENTS.md` and `.agent/` with the ones from the new release. The rest of the vault is yours and stays as it is.

## Contributing

Issues and pull requests are welcome.

## License

[Apache-2.0](LICENSE)
