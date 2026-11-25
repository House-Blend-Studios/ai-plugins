---
name: my-week
description: Tell the person what's on their plate in JobPlanner — what to do today, this week and later, what of theirs is overdue, and where they're booked this week. Use when they ask "what's on my plate?", "what do I do next?", "what's my week look like?", "what's overdue of mine?" or "what am I booked on?".
---

# My week

Tools: `my_work`, `get_job`

If no JobPlanner tools are available in this session, say that this skill works only with JobPlanner's tools, then stop.

**More than one firm connected?** Each firm's JobPlanner is its own connector, named for the firm. Ask which firm they mean, or call each one and keep the answers apart under the firm's name. Never mix two firms' jobs in one list.

## Steps

1. **Call `my_work` once.** It takes nothing. It answers as the person who connected the assistant, on the firm's own today, from the same list their dashboard shows. Don't rebuild the answer from other tools: one call is the whole picture.
2. **If the answer says the account isn't linked to anyone on the board**, tell the person that, and that an administrator can link it on the People page. Stop there.
3. **Lead with what needs them first**, in the order the tool gives:
   - **Today** first, then **This week**, then **Later**. Keep the tool's order inside each group, because it is the dashboard's order.
   - Each item is its `sentence` followed by the job's name, and its number in brackets: "Finish the drawing for Smith boundary (26-118)". Add the `timing` ("due today", "3 days late") and the `detail` when there is one.
   - If an item has a `refusal`, say it plainly beside the item: that's why it can't be marked done yet (usually an earlier step is still open).
   - When there are many items, show Today and This week in full and summarise Later as a count, offering to list it.
4. **Then what's overdue**: each job, its number and how late it is. If nothing is overdue, say so in one line.
5. **Then this week's bookings**, Monday to Sunday, by day: the day, the hours and the job. If the person has none, say so. If the answer says the bookings couldn't be read, say that rather than "nothing booked".
6. **If the answer says logged hours couldn't be read**, mention that a few items may be missing until it can read them again.
7. **Nothing at all?** When the answer says nothing is waiting on them, say exactly that. It's a real answer, not an error.
8. **Follow-up on one job** ("what's the Smith job waiting on?"): call `get_job` with the job's id from the item. Don't call it for every item up front.

## A good answer

- Uses the words the tool returns (the group labels, the sentences, the job's name and number, the timing), never an internal key, an id or a `stepKey`.
- Reads like a short to-do list for the person's day, most urgent first, not a dump of every field.
- Says which day it was measured on (the answer's `today`) when the person asks about "today" late in the evening or across time zones.
- Never says the assistant marked, moved or changed anything. This skill only reads.
