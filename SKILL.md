---
name: tp-develop-plan
description: "Use when Codex needs to plan or execute a coding task through a disciplined five-step development workflow: grill-me clarification, PRD writing, Markdown issue/task breakdown, test-driven development, and readability-focused refactoring. Trigger for requests to build, fix, redesign, refactor, or plan code when the user wants clearer intent, implementation tasks, tests-first work, or code that is easier to read later."
---

# TP Develop Plan

Use this skill to turn a coding request into a clear implementation path and, when execution is allowed, carry it through tests and readability cleanup.

Follow the five stages in order unless the user explicitly asks to skip or compress a stage. If a stage is skipped, state the skip and the reason.

## Stage 1: grill-me

Clarify the work before planning. Ask only questions that materially affect the implementation, and prefer discovering repository facts before asking.

Cover:

- Goal and user-facing success criteria.
- Audience or caller of the change.
- In-scope and out-of-scope behavior.
- Constraints such as compatibility, performance, security, release timing, or style.
- Existing code paths, APIs, data models, and tests that shape the work.

Do not ask questions that can be answered by reading the repository. If the user has already provided enough detail, briefly state the locked assumptions and move on.

## Stage 2: prd

Write a concise PRD before implementation. Keep it practical and implementation-facing.

Include:

- Problem statement.
- Goals and non-goals.
- Current behavior or current system shape.
- Proposed behavior.
- Acceptance criteria.
- Risks, constraints, and open assumptions.

For small fixes, the PRD may be short, but it must still define success criteria clearly enough that tests can be derived from it.

## Stage 3: issues

Break the PRD into Markdown implementation issues/tasks. These are local planning artifacts unless the user explicitly asks to create live GitHub Issues.

Use this format:

```markdown
## Issue 1: <title>

**Outcome:** <observable result>
**Work:** <specific implementation work>
**Acceptance:** <how to verify this issue is complete>
```

Keep issues independently understandable. Order them so earlier issues reduce uncertainty or unblock later work.

## Stage 4: tdd

Drive implementation with tests first whenever the repository has a viable test setup.

Process:

1. Identify the smallest meaningful failing test for the next issue.
2. Add or update the test before production code.
3. Run the focused test and confirm it fails for the expected reason.
4. Implement the smallest code change that satisfies the test.
5. Re-run the focused test, then run the broader relevant suite.

If tests are not practical, explain why and choose the closest verification method, such as typecheck, build, lint, snapshot review, or manual browser verification.

## Stage 5: refactor code

After behavior is verified, refactor for future readability without changing behavior.

Prioritize:

- Naming that reflects domain intent.
- Removing incidental duplication.
- Flattening control flow where it improves comprehension.
- Moving logic to existing local abstractions when that matches repository style.
- Tightening comments so they explain why, not what.

Do not combine unrelated cleanup with the requested change. After refactoring, re-run the same verification used in Stage 4.

## Final Response

When the work is complete, report:

- PRD summary and implemented issues.
- Tests or verification run, including any failures or gaps.
- Readability refactors made.
- Files changed, only when useful for handoff.
