# Task Report: Workflow Commands Guide Generation

**Date:** 2026-01-05
**Time:** 13:30:00-04:00

## 1. Initial Project State

- The project has a comprehensive set of workflow commands split between local shortcuts in `.agent/workflows/` and global commands in `/home/leonai-do/.gemini/antigravity/global_workflows/`.
- The user has established the `Autospec` framework shortcuts recently.
- Documentation for how these commands integrate into a cohesive workflow was missing for the end-user.

## 2. Summary of User Request

The user requested a simple, step-by-step guide explaining how and when to use the commands found in `.agent/workflows/`. The guide should adhere to the framework's expected practices and be saved in `docs/docs-local/`.

## 3. Changes Made

- **File Created:** `docs/docs-local/2026-01-05/workflow-commands-guide.md`.
- **Content Summary:**
  - Explained the **Spec-Driven Development (SDD)** lifecycle.
  - Categorized commands into 5 Phases:
    1. Project Foundation (`constitution`, `analysis`).
    2. Specification (`specify`, `clarify`, `proposal`).
    3. Planning (`plan`, `tasks`, `checklist`).
    4. Execution (`implement`, `apply`, `analyze`, `code-review`).
    5. Lifecycle (`archive`, `rapo`).
  - Added a support section for utility tools (`research`, `fix-build`, `poise`).
- **Logic Applied:** Analyzed the actual implementations of `Autospec` and `OpenSpec` global commands to ensure the "step-by-step" instructions accurately reflect what the agent does when those commands are triggered.

## 4. Constraints & Decisions

- Included global commands (`opt-*`, `X-openspec-*`) as they are part of the system's available workflow, even though they were not in the local `.agent/workflows` directory.
- Focused on the "When" and "Why" to provide tactical value.
- Followed the project's reporting standards.

## 5. Next Steps

- The guide is ready for user review.
- Suggest performing a `/opt-project-analysis-auditing-roadmapping` to verify the state of the documentation against the project health.
