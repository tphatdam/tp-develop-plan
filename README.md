# TP Develop Plan

`tp-develop-plan` is a portable software development workflow skill for coding agents and AI IDEs. It turns an unclear coding request into a clarified PRD, implementation issues, a TDD loop, and a final readability refactor.

The skill is written in plain Markdown, so it can be used in any environment that understands `SKILL.md`-style procedural guidance, including Codex, Cursor, Claude Code, Antigravity, Kiro CLI, GitHub Copilot, Windsurf, Gemini, Cline, AMP, OpenCode, Roo, Trae, VS Code, Zed, and similar tools.

## Overview

The core workflow has five required stages:

1. `grill-me`: clarify the goal, scope, constraints, and success criteria.
2. `prd`: write a concise PRD before implementation.
3. `issues`: break the PRD into Markdown implementation tasks.
4. `tdd`: write or update tests before changing production code whenever practical.
5. `refactor code`: improve readability after behavior has been verified.

The skill also includes optional reference sub-modes inspired by common workflow skills on `skills.sh`, such as `grill-with-docs`, `triage`, `prototype`, `codebase-design`, `improve-codebase-architecture`, `tdd`, and `handoff`.

## Quick Install

Run this from your project root:

```bash
npx skills add tphatdam/tp-develop-plan
```

Then start a new session in your coding agent or AI IDE so it can discover the installed skill.

## Manual Install

Clone the repository and copy the skill into your local skills directory:

```bash
git clone https://github.com/tphatdam/tp-develop-plan.git
mkdir -p ~/.codex/skills
cp -R tp-develop-plan ~/.codex/skills/tp-develop-plan
```

For repository-scoped agents, copy `SKILL.md` into the location your tool expects for project skills.

## Usage

Invoke the skill directly by name:

```text
Use $tp-develop-plan to plan and implement this feature with grill-me, PRD, issues, TDD, and refactor stages.
```

You can also ask naturally:

```text
Use tp-develop-plan for this bugfix. Grill me first, then write the PRD, split issues, implement with TDD, and refactor for readability.
```

## Best For

- New features that need clearer requirements before coding.
- Bug fixes that should be verified by tests.
- Refactors that must preserve behavior while making code easier to read.
- Handoffs across multiple agents or multiple sessions.
- Shared workflows across Codex, Cursor, Claude Code, Antigravity, Kiro CLI, and other AI IDEs or agents.

## Operating Principles

- Do not jump straight into code when the request is still unclear.
- Always turn acceptance criteria into concrete verification steps.
- Prefer tests before production code when the repository has a viable test setup.
- Create GitHub Issues, pull requests, or external artifacts only when the user explicitly asks.
- After refactoring, rerun the same verification used during the TDD stage.

## Repository

GitHub: https://github.com/tphatdam/tp-develop-plan
