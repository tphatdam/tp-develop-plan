---
name: tp-develop-plan
description: "Use when a coding agent, IDE, or terminal assistant needs to plan or deliver a feature, bug fix, refactor, investigation, or design change. Route work by risk and uncertainty; clarify requirements, obtain design approval when needed, create a PRD and dependency-aware task graph, implement test-first, review with evidence, and refactor safely across SKILL.md-compatible environments."
---

# TP Develop Plan

Turn a coding request into a clear, verified delivery path. Classify the work first, run only the matching gates, then use the five core stages in order unless the user explicitly asks to skip or compress one. State every skip and its reason.

## Compatibility and Precedence

Treat this skill as portable Markdown guidance for any `SKILL.md`-compatible environment. User instructions take precedence.

Use named companion skills only when they are installed and their trigger matches. If a companion skill is unavailable, follow the equivalent local procedure and state the limitation; do not block or copy its resources into this skill.

Use available repository search, documentation, tests, builds, typechecks, linters, browser checks, tracker integrations, and review tools. Create live issues, pull requests, or other external artifacts only when the user requests them.

## Request Routing

Classify the request before planning or coding. Discover facts from the repository, product documentation, and linked references before asking the user for facts the environment can answer.

### Discovery Gate

For work governed by existing APIs, product rules, design references, or unfamiliar code, inspect those sources before clarification. Use `grill-with-docs` when available. Resolve terminology, current behavior, constraints, and relevant tests before asking decision questions.

### Feature and UI Gate

For a new feature, UI, component, page, or creative behavior change, use `brainstorming` before implementation. Explore the project, clarify intent, compare viable approaches, present a design, and obtain explicit user approval before creating code or an implementation plan.

For UI work after approval, use `frontend-design` for deliberate visual direction and `ui-ux-pro-max` for design-system, accessibility, responsive, interaction, performance, and motion guidance when available. Carry approved UX decisions into the PRD and acceptance criteria.

### Bug and Unexpected Behavior Gate

For a bug, regression, failed test, error, or unexpected behavior, use `superpowers:systematic-debugging` before proposing a fix. Reproduce the problem, inspect evidence and recent changes, trace the data flow, compare working paths, and test one root-cause hypothesis at a time. Add the smallest regression test after confirming the cause.

### Uncertainty and Prototype Gate

When feasibility, an external API, data shape, performance, or UX behavior is uncertain, use `prototype` before committing to an implementation. State the question, success threshold, and narrow scope; label the result as throwaway. Do not convert a prototype into product code without returning to the relevant routing gate and plan.

### Architecture and Refactor Gate

For broad changes to module boundaries, ownership, public interfaces, data flow, or long-term maintainability, use `codebase-design` or `improve-codebase-architecture` when available. Map boundaries, consumers, contracts, migration needs, and verification before writing the PRD.

Before structural refactoring, define a behavior-preservation boundary: public interfaces, failure behavior, ordering, compatibility, and the proof that protects them. Keep feature changes outside the refactor, move one ownership boundary at a time, and keep intermediate states buildable and testable.

### Capability Discovery Gate

When required specialist knowledge, tooling, templates, or integrations are absent, use `find-skills`. Assess relevance, source reputation, and adoption before recommending installation. Do not install a skill or make an external change unless the user asks.

## Fallback Behavior

If a companion skill is unavailable, preserve its intent locally: investigate before asking, obtain design approval for new creative work, debug from evidence, keep spikes disposable, map architecture before broad change, test before implementation, and verify before completion. State the unavailable capability and the local substitute.

## Five Core Stages

### Stage 1: grill-me

Clarify only decisions that materially affect delivery after applicable routing gates. Lock the goal, audience, success criteria, in-scope and out-of-scope behavior, compatibility, performance, security, release constraints, affected code paths, APIs, data models, and existing tests. If enough information exists, state the assumptions and continue.

### Stage 2: prd

Write a concise, implementation-facing PRD that includes the problem, goals and non-goals, current behavior, proposed behavior, acceptance criteria, constraints, risks, open assumptions, verification strategy, and the selected risk tier. Include approved UI and architecture decisions when applicable.

### Stage 3: issues

Break the PRD into a dependency-aware task graph, not a flat checklist. Each task must be independently understandable, name its dependencies, and expose its observable completion rule. Work only the frontier: tasks whose dependencies are complete. Order tasks so early work reduces uncertainty or unblocks later work.

Use this local format unless the user requests a live tracker or `superpowers:writing-plans` supplies a richer plan:

```markdown
## Task 1: <title>

**Depends on:** <task numbers or none>
**Outcome:** <observable result>
**Work:** <specific implementation work>
**Acceptance:** <test, build, or review evidence>
```

For multi-step delivery with Superpowers available, use `superpowers:writing-plans` after the PRD is stable. Use `superpowers:using-git-worktrees` when isolation is needed, then select `superpowers:executing-plans` for inline work or `superpowers:subagent-driven-development` when independent tasks benefit from parallel implementation and review.

### Stage 4: tdd

Use `superpowers:test-driven-development` when available. Otherwise, for each frontier task, identify the smallest meaningful failing test, add or update it before production code, run it to confirm the expected failure, implement the minimum change, then rerun focused and relevant broader verification.

If automated tests are not practical, state why and use the closest proof: typecheck, build, lint, snapshot review, or manual browser verification. Never claim success without fresh evidence.

### Stage 5: refactor code

After behavior is verified, refactor only inside the behavior-preservation boundary. Prefer domain-revealing names, less incidental duplication, clearer control flow, and existing local abstractions. Avoid unrelated cleanup, dependency growth without a correctness need, and feature work mixed into the refactor. Rerun the same proof after the change.

## Risk-Based Review and Verification

Choose verification proportional to the blast radius:

- **Low risk:** focused automated proof and a self-review of the changed path.
- **Medium risk:** focused proof plus the relevant suite, build/typecheck, and a separate review pass when available.
- **High risk:** independent review, explicit compatibility or migration checks, and before/after evidence for every affected boundary.

Use `superpowers:requesting-code-review`, `superpowers:verification-before-completion`, and `superpowers:finishing-a-development-branch` when their triggers match and they are available. Use `handoff` for multi-agent or multi-session work. Do not require an independent review loop for low-risk changes.

Record delivery evidence in the final response, handoff, or pull request:

```markdown
## Delivery Evidence

**Before:** <baseline behavior, failing test, screenshot, or command output>
**After:** <passing test, screenshot, or command output>
**Blast radius:** <low, medium, or high — affected boundaries>
**Gaps:** <unverified area or none>
```

## Final Response

Report the routing gates used or unavailable, approved design decisions when applicable, PRD summary, completed task-graph frontier, verification evidence and gaps, refactor boundary, review status, and changed files when useful for handoff.
