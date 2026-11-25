# jobplanner

Skills for working with your firm's JobPlanner from an AI agent, and the JobPlanner connector they use: `https://jobplannerhq.com/mcp`, one address for every firm. Signing in asks which firm, then you allow the assistant on your firm's own JobPlanner page, with the permissions you choose there.

## Install

1. Add the plugin:

   ```bash
   /plugin marketplace add House-Blend-Studios/ai-plugins
   /plugin install house-blend-jobs@house-blend-studios
   ```

2. Sign in: in Claude Code, run `/mcp`, choose `jobplanner` and sign in. Type your firm's address, then allow the assistant on your firm's page.

## Skills

| Skill | Use it to | Tools it calls |
|---|---|---|
| `my-week` | see what's on your plate: Do next for today, this week and later, what's overdue, and this week's bookings | `my_work`, `get_job` |
| `email-to-job` | log an email on a job, or turn a new order into a draft job | `find_jobs`, `get_job`, `add_job_note`, `draft_job` |
| `import-plugin` | write or change the firm's import plugin (administrators, who allow the import permission when connecting) | `authoring_brief`, `list_samples`, `read_sample`, `read_version`, `catalog`, `try_plugin`, `diff`, `save_draft` |
| `whats-late` | see what's late and whose turn each one is, or where one job stands and who has it | `late_jobs`, `find_jobs`, `get_job` |
| `workload-review` | see who's carrying what and who has room, from the Workload page's own figures (hours are estimates of the work left) | `team_workload`, `list_people`, `find_jobs` |


## What it does with your firm's data

The skills hold no data and send nothing anywhere themselves. They tell your agent which of your connector's tools to call and in what order. Whatever those tools return goes to your own agent session, on your own account: jobs, notes, people, and for the import plugin the sample sheets, catalog and drafts. That's all under the permissions you granted when you connected.

Two kinds of writes need you:
- **Notes:** the agent shows you a note before adding it.
- **Draft jobs and import-plugin drafts:** nothing goes live until you save the job, or publish the plugin from Admin › Import, yourself.

## Other agents

The skills are plain `SKILL.md` files, and the tools are standard MCP. GitHub Copilot CLI installs this plugin from the same marketplace. Agents that read Agent Skills can use the `skills/` folder directly.
