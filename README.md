# TP Develop Plan

`tp-develop-plan` is a portable, risk-aware development workflow for coding agents and AI IDEs. It turns a coding request into a clarified, evidence-backed delivery path without forcing every task through the same ceremony.

The skill is plain Markdown, so it works in Codex, Cursor, Claude Code, Antigravity, Kiro CLI, GitHub Copilot, Windsurf, Gemini, Cline, AMP, OpenCode, Roo, Trae, VS Code, Zed, and other `SKILL.md`-compatible environments.

## Workflow

The skill first routes work only to the gates it needs:

- Inspect existing code and product documentation before asking discoverable questions.
- Require an approved design for new features and UI; diagnose bugs from evidence before proposing a fix.
- Use a disposable prototype when feasibility, external APIs, performance, or UX is uncertain.
- Map boundaries and compatibility before broad architecture or structural refactor work.
- Discover missing specialist capabilities instead of assuming them.
- Scale review and verification with the change's blast radius.

It then follows five core stages: `grill-me`, `prd`, `issues`, `tdd`, and `refactor code`. The issue stage is a dependency-aware task graph: only tasks on the current frontier are ready to implement.

## Quick Install

Run this from your project root:

```bash
npx skills add tphatdam/tp-develop-plan
```

Start a new agent session after installation so it discovers the skill.

## Usage

For a feature:

```text
Use $tp-develop-plan for this feature. Inspect the codebase first, present a design for approval, then create a PRD and task graph, implement test-first, and report delivery evidence.
```

For a bug fix:

```text
Use $tp-develop-plan to investigate and fix this regression. Establish the root cause from evidence, add a regression test, and verify the fix before refactoring.
```

For a refactor:

```text
Use $tp-develop-plan to refactor this module. Define the behavior-preservation boundary, keep feature changes out of scope, and prove behavior remains unchanged.
```

## Operating Principles

- Do not ask users for facts the repository or documentation can answer.
- Keep prototypes throwaway until the real route and plan are approved.
- Turn acceptance criteria into fresh, concrete verification evidence.
- Prefer tests before production code when the repository has a viable test setup.
- Keep feature changes out of structural refactors and rerun the same proof afterward.
- Create GitHub Issues, pull requests, or other live artifacts only when the user explicitly asks.

## Repository

GitHub: https://github.com/tphatdam/tp-develop-plan
