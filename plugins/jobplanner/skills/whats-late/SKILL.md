---
name: whats-late
description: Say which JobPlanner jobs are late and whose turn each one is, or where one job stands and who has it now. Use when the person asks "what's late?", "what's overdue and who has it?", "what's stuck on whom?", "who's holding things up?", or "where's the Smith job at?" and "whose turn is it on that job?".
---

# What's late, and whose turn

Tools: `late_jobs`, `find_jobs`, `get_job`

If no JobPlanner tools are available in this session, say that this skill works only with JobPlanner's tools, then stop.

**More than one firm connected?** Each firm's JobPlanner is its own connector, named for the firm. Answer for the one the person names. If they don't name one, ask which firm before you call anything. Never mix two firms' jobs in one answer.

## What's late

1. **Call `late_jobs` once.** It takes nothing. It answers every job past its due date as of the firm's today, exactly the jobs the dashboard's Overdue tile counts. Jobs waiting on their final close-out steps are included. Don't page through `find_jobs` to rebuild the list: you'd get a different answer from the dashboard.
2. **Read it by whose turn.** The answer has three groups:
   - `people`: a person whose turn the next step is, each with their late jobs. A job whose next steps belong to two people (two people on the same responsibility, say) is listed under both, so add up `total`, not the rows.
   - `roles`: steps nobody on the job holds, so anyone with that role may take them. Say so plainly ("no one is named on the job, so anyone with that role can take it").
   - `noStepReady`: late jobs where no step can be taken yet, each with the reason the app gives (not released to the board yet, or no work set up on it). These need someone to act on the job itself, not on a step.
3. **Answer in the person's terms:**
   - Lead with the count and the date the answer gives: "11 jobs are late as of Nov 24."
   - Then each person, most late jobs first. Under each person, name every job by its number and name, with how many days late it is and the step it waits on, in the words the tool gives (`whose`, `step`).
   - Then the role groups, then the no-step-ready jobs.
   - Keep it short. If it's long, give each person's count first and offer the detail.
4. **If they ask about one person** ("what's late on Sam?"), answer from the same `late_jobs` call. Don't call again.
5. **Nothing late:** say so in one line, with the date.

## Where is one job, and whose turn

1. **Find it with `find_jobs`.** Search on a short piece of the name, number, client or address. Each row already carries `turns`, so a single clear match may need nothing more.
2. **Read it with `get_job` when the person wants more:** its due date, who is on it, every step's state and the latest notes. Its `turns` say whose turn each ready step is.
3. **Answer:** where it stands (its stage and position labels), when it is due and whether it is late, then whose turn it is, in the `whose` sentence. A job with work running in parallel can have several turns at once; name each one.

## A good answer

- Names people and roles by the names the tools return, never by an id or an internal key.
- Uses the tool's own words for whose turn it is. Don't guess from job titles or from who manages the job: the manager is not automatically the one holding the next step.
- Says "no step ready" jobs need attention on the job itself, and gives the reason.
- Never offers to change anything: these tools only read.
