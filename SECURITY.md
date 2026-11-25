# Security

To report a security problem in a plugin here, or in the product it works with, open an issue on this repository (https://github.com/House-Blend-Studios/ai-plugins/issues) or email **support@houseblendstudios.com** with "Security" in the subject. If the report holds something that shouldn't be public, such as a way to reach someone else's data, report it privately instead: use **Report a vulnerability** on this repository's Security tab (https://github.com/House-Blend-Studios/ai-plugins/security/advisories/new), which only the maintainers can see, or email it.

Say which plugin and version (from its `plugin.json`), what you found, and how to reproduce it. We'll reply to say we've got it, look into it, and tell you what we did.

## What these plugins do

The `house-blend-jobs` plugin holds skills, instructions an AI agent reads, and declares one remote MCP server: JobPlanner's own, `https://jobplannerhq.com/mcp`. It runs no code on your machine, starts no local server and stores no data. Its skills call that server as you, in your firm, with the permissions you granted when you signed in. JobPlanner's privacy page says what JobPlanner keeps: https://jobplannerhq.com/privacy.
