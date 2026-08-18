---
name: tp-develop-plan
description: "Use when any coding agent, model, IDE, editor assistant, or terminal assistant needs to plan or execute a coding task through a disciplined five-step development workflow: grill-me clarification, PRD writing, Markdown issue/task breakdown, test-driven development, and readability-focused refactoring. Trigger for requests to build, fix, redesign, refactor, or plan code in Codex, Cursor, Claude Code, Antigravity, Kiro CLI, GitHub Copilot, Windsurf, Gemini, Cline, AMP, OpenCode, Roo, Trae, VS Code, Zed, or any SKILL.md-compatible environment."
---

# TP Develop Plan

Use this skill to turn a coding request into a clear implementation path and, when execution is allowed, carry it through tests and readability cleanup across coding agents and IDEs.

Follow the five stages in order unless the user explicitly asks to skip or compress a stage. If a stage is skipped, state the skip and the reason.

## Agent and IDE Compatibility

Treat this skill as plain Markdown procedural guidance. Do not depend on a specific model, UI, tool name, or agent runtime.

Use it in any environment that can read `SKILL.md`-style instructions, including Codex, Cursor, Claude Code, Antigravity, Kiro CLI, GitHub Copilot, Windsurf, Gemini, Cline, AMP, OpenCode, Roo, Trae, VS Code, and Zed.

Map each step onto the tools available in the current environment:

- Use repository search, file inspection, and editor navigation to understand code.
- Use the local terminal or IDE task runner for tests, builds, typechecks, and linters.
- Use browser tools only when the task needs web or UI verification.
- Use issue trackers, pull request tools, or task systems only when the user asks for live external artifacts.
- If a capability is unavailable, state the limitation and use the closest local verification path.

## Reference Stage Catalog

These reference stages are advisory sub-modes inspired by common `skills.sh` agent workflow patterns. They can sharpen one of the five mandatory stages, but they do not add extra required stages.

- `grill-me`: Clarify requirements, constraints, and success criteria before planning.
- `grill-with-docs`: Clarify by reading product docs, API docs, design references, or linked material before asking the user.
- `triage`: Classify the work as bug, feature, refactor, migration, design change, or investigation before writing the PRD.
- `prototype`: Spike a small throwaway approach when feasibility, API shape, or UX behavior is uncertain.
- `codebase-design`: Model boundaries, ownership, data flow, and interfaces before structural work.
- `improve-codebase-architecture`: Use before broad refactors that affect module boundaries or long-term maintainability.
- `tdd`: Convert acceptance criteria into failing tests before changing production code.
- `handoff`: Summarize current state, decisions, verification, and next steps for another agent or future session.

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
