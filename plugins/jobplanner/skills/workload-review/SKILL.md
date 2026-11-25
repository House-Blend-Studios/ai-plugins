---
name: workload-review
description: Review who on the team is carrying what in JobPlanner, and who has room for more. Use when a manager or the office asks "who's carrying what?", "who has room?", "who can take this job?", "how loaded is the crew?", or wants a weekly workload review.
---

# A workload review

Tools: `team_workload`, `list_people`, `find_jobs`

If no JobPlanner tools are available in this session, say that this skill works only with JobPlanner's tools, then stop.

**More than one firm connected?** Each firm's JobPlanner is its own connector, named for the firm. Review one firm at a time: the one the person names, or ask which. People and figures in one firm mean nothing in another.

## Steps

1. **Call `team_workload` once.** It answers from the figures on JobPlanner's Workload page: for each person with open jobs, the jobs they own and the jobs they're on the crew of, how many of those have no due date, and the estimated hours left. One call covers the whole team, so don't rebuild it from other tools.
   - If the person names a period ("what's due this month"), pass `dueFrom` and `dueTo` (YYYY-MM-DD, inclusive). A due window leaves out jobs with no due date, so mention how many that drops if it matters.
   - If they ask about work that came in during a period, pass `orderedFrom` and `orderedTo`.
2. **Who has room?** People with no open jobs aren't in the answer. If the question is who could take something on, call `list_people` and name the active people who don't appear in the workload as having nothing open.
3. **Asked about one person's jobs in detail?** Use `find_jobs` with their id (`managerId` for jobs they own, `crewId` for jobs they're on), not a guess from the totals.

## Speaking about hours

- **Hours are estimates of the work left, never hours worked.** Say "about 40 estimated hours left", never "40 hours booked", "logged" or "spent". The firm revises each estimate as the work goes. A falling number means a revised guess, not proof of time spent.
- Use the hour labels the tool returns (each firm names its kinds of hours in its own words). Don't rename them.
- **A crew member's hours are the whole job's estimate, counted for each person on it.** A two-person job shows its full estimate under both people. Use crew hours to rank people against each other, never add them up into a team total. The tool's totals are already right.

## A good answer

- Leads with the answer to the question asked: who is heaviest, who is lightest, who could take the new job. Don't dump the table first.
- Names people and their figures in the tool's own words: jobs owned, jobs on a crew, jobs with no due date, estimated hours left by kind.
- Calls out jobs with no due date, and jobs nobody is on the crew of, as things worth a look, not as faults.
- Never invents capacity, availability or hours worked. If the person asks how many hours someone actually worked, say JobPlanner's workload holds estimates of the work left, not time worked.
