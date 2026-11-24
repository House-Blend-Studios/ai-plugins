# Security

To report a security problem in a plugin here, or in the product it works with, open an issue on this repository (https://github.com/House-Blend-Studios/ai-plugins/issues) or email **support@houseblendstudios.com** with "Security" in the subject. If the report holds something that shouldn't be public, such as a way to reach someone else's data, email it.

Say which plugin and version (from its `plugin.json`), what you found, and how to reproduce it. We'll reply to say we've got it, look into it, and tell you what we did.

## What these plugins do

The `jobplanner-hq` plugin holds only skills: instructions an AI agent reads. It runs no code, starts no server and stores no data. Its skills call your firm's own JobPlanner connector, with the permissions you granted when you connected it. JobPlanner's privacy page says what JobPlanner keeps: https://jobplannerhq.com/privacy.
