# House Blend Studios AI plugins

The plugin marketplace for House Blend Studios' products, starting with JobPlanner. A plugin here gives an AI agent the skills it needs to work with one of our products, installed in one step.

## Install

```bash
/plugin marketplace add House-Blend-Studios/ai-plugins
/plugin install <plugin>@house-blend-studios
```

Anyone can add the marketplace. A plugin works only through your own account on the product: for JobPlanner, connect your firm's JobPlanner from your Profile page there first.

## Plugins

| Plugin | For | What it does |
|---|---|---|
| [`jobplanner-hq`](plugins/jobplanner/) | a firm's people and administrators | skills over the firm's JobPlanner connector: your week, what's late and whose turn, the team's workload, an email to a job, and writing the firm's import plugin |
| [`plugin-development`](plugins/plugin-development/) | people building plugins here | `/plugin-development:init`, `add-skill`, `add-command`, `add-agent`, `add-hook`, `validate` and `test-local`, plus a reviewer agent |

## Rules for a plugin here

- **One folder per plugin** under `plugins/<name>/`, listed in `.claude-plugin/marketplace.json` with `"source": "./plugins/<name>"`. A plugin with its own build or release pace can live in its own repo instead; its entry here then points at it.
- **Plugins for customers hold only skills (`SKILL.md`) and MCP config.** Those work in other agents too: GitHub Copilot CLI reads `.claude-plugin/` as it is, and Codex reads skills and MCP but needs its own `.codex-plugin/plugin.json`. Slash commands, hooks and sub-agents are Claude Code only, so they belong in internal plugins.
- **A plugin's README says what it sends where**: which of the person's data reaches their agent session.
- **A plugin over a product's MCP keeps a `tools.json`** of the tools its skills may name. Each skill declares its tools on a `Tools:` line, and CI (`scripts/check-skill-tools.sh`) holds the skills to the list. The product pins the same list and tests that it still serves each one, so a tool isn't dropped while a published skill names it. A new tool goes in both places.
- **Bump the plugin's `version`** in its `plugin.json` when it changes, or installed copies won't update.

## Working on a plugin

```bash
git clone git@github.com:House-Blend-Studios/ai-plugins.git && cd ai-plugins
claude
/plugin marketplace add .
/plugin install plugin-development@house-blend-studios
/plugin-development:init my-plugin
/plugin-development:validate
```

After a change, reinstall to pick it up: `/plugin uninstall <plugin>@house-blend-studios`, then install it again. CI (`.github/workflows/validate-plugins.yml`) checks the manifests, each plugin's structure, duplicate names and leftover template placeholders on every push and pull request.

## Reference

- [Plugins](https://code.claude.com/docs/en/plugins), [plugin marketplaces](https://code.claude.com/docs/en/plugin-marketplaces), [plugins reference](https://code.claude.com/docs/en/plugins-reference), [skills](https://code.claude.com/docs/en/skills)
- [Copilot CLI plugin marketplaces](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-marketplace)

`plugin-development` is from [ivan-magda/claude-code-plugin-template](https://github.com/ivan-magda/claude-code-plugin-template) (MIT).

## Security

Report a security problem to support@houseblendstudios.com; see [SECURITY.md](SECURITY.md).

## License

MIT. See [LICENSE](LICENSE).
