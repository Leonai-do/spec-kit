# Framework Workflow Commands Guide

This guide provides a step-by-step overview of how and when to use the workflow commands available in the `.agent/workflows` directory and the global framework. This ecosystem is built on **Spec-Driven Development (SDD)**, focusing on clear requirements before implementation.

---

## 🏗️ Phase 1: Project Foundation & Health

_Setting the ground rules and assessing current state._

### 📜 `/autospec.constitution`

- **When to use**: At the very start of a project or when project-wide governance rules change.
- **Why**: Establishes non-negotiable principles (e.g., "Test-First", "No secrets in code").
- **Step-by-Step**:
  1. Run `/autospec.constitution`.
  2. The agent will analyze your project and propose a `constitution.yaml` (saved in `.autospec/memory/`).
  3. Review and approve the principles.

### 🔍 `/opt-project-analysis-auditing-roadmapping`

- **When to use**: Before starting a new major task or when you need a status update on a large project.
- **Why**: Performs a deep audit of Git state, OpenSpec status, and progress.
- **Step-by-Step**:
  1. Run `/opt-project-analysis-auditing-roadmapping`.
  2. It generates a comprehensive report in `docs/docs-local/YYYY-MM-DD/project-analysis-report.md`.
  3. Review the "Immediate Action Items" for your next steps.

---

## 📝 Phase 2: Feature Definition (Specification)

_Converting ideas into formal requirements._

### 💡 `/autospec.specify`

- **When to use**: When you have a new feature idea or bug fix to implement.
- **Why**: Translates natural language into a structured YAML spec with user stories and acceptance criteria.
- **Step-by-Step**:
  1. Run `/autospec.specify <your feature description>`.
  2. It creates a feature branch and a `spec.yaml` in the `specs/<branch-name>/` directory.
  3. Review the generated user stories and success criteria.

### ❓ `/autospec.clarify`

- **When to use**: If the `spec.yaml` contains `clarification_needed` markers.
- **Why**: Resolves ambiguities in the specification before planning begins.
- **Step-by-Step**:
  1. Update the `spec.yaml` with your answers or run the command to prompt for help.
  2. The agent will incorporate the answers back into the spec.

### 🗳️ `/1-openspec-global-proposal`

- **When to use**: For formal changes or architectural proposals in an OpenSpec-driven environment.
- **Why**: Bridges the gap between high-level specs and technical design documents.
- **Step-by-Step**:
  1. Run `/1-openspec-global-proposal`.
  2. It scaffolds `proposal.md`, `tasks.md`, and `design.md` under `openspec/changes/<id>/`.
  3. DO NOT write code yet; focus on the design and test strategy.

---

## 📅 Phase 3: Implementation Planning

_Mapping out the 'how' before the 'do'._

### 🗺️ `/autospec.plan`

- **When to use**: After your `spec.yaml` is finalized and approved.
- **Why**: Generates a high-level implementation plan (technologies, architecture, risks).
- **Step-by-Step**:
  1. Run `/autospec.plan`.
  2. It reads `spec.yaml` and creates `plan.yaml`.
  3. Review the technical approach and architectural decisions.

### 📋 `/autospec.tasks`

- **When to use**: Once the high-level plan is ready.
- **Why**: Breaks the implementation plan into granular, verifiable tasks.
- **Step-by-Step**:
  1. Run `/autospec.tasks`.
  2. It generates `tasks.yaml` with specific files to modify and verification steps.

### ✅ `/autospec.checklist`

- **When to use**: Before starting the implementation.
- **Why**: Provides a QA checklist to ensure the final implementation matches the spec and plan.
- **Step-by-Step**:
  1. Run `/autospec.checklist`.
  2. It creates `checklist.yaml` based on acceptance criteria.

---

## 🛠️ Phase 4: Execution & Validation

_Writing code and verifying correctness._

### 🚀 `/autospec.implement`

- **When to use**: When your tasks are ready and approved.
- **Why**: Automates the execution of the tasks defined in `tasks.yaml`.
- **Step-by-Step**:
  1. Run `/autospec.implement`.
  2. The agent will work through the task list, writing code and running tests.

### 🏗️ `/2-openspec-global-apply`

- **When to use**: To implement a previously approved OpenSpec proposal.
- **Why**: Executes the specific changes and spec deltas defined in the proposal stage.

### ⚖️ `/autospec.analyze`

- **When to use**: After implementation is complete.
- **Why**: Cross-checks the code against `spec.yaml`, `plan.yaml`, and `tasks.yaml` to ensure consistency.
- **Step-by-Step**:
  1. Run `/autospec.analyze`.
  2. Addresses any "drift" (deviations from the original spec).

### 🕵️ `/opt-global-senior-code-review-specialist`

- **When to use**: Before merging a major feature.
- **Why**: Provides an exhaustive, evidence-based review of the code quality and security.

---

## 📦 Phase 5: Lifecycle & Maintenance

_Finishing up and optimizing._

### 🗄️ `/3-openspec-global-archive`

- **When to use**: After a feature is deployed/merged.
- **Why**: Updates the project's permanent specifications and archives the change history.

### 🔗 `/opt-rapo-repo-aware-prompt-optimizer`

- **When to use**: When you need to explain your repository structure to another AI or for documentation.
- **Why**: Generates a comprehensive repo map and context summary.

---

## 🛟 Support & Utility Commands

- **`/opt-openspec-global-deep-research`**: Use when you hit a technical unknown or need to find best practices.
- **`/opt-openspec-global-fix-build`**: Use when the implementation stage is stuck on build errors or failing tests.
- **`/0-poise-prompt-optimization-synthesis-engine`**: Use to optimize the system prompts or complex instructions.
- **`/opt-skills-specialist`**: Use to document new "skills" (MCP tools or workflows) you've developed.

---

_Created by Antigravity - 2026-01-05_
