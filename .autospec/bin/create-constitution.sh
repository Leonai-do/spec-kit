#!/bin/bash
# autospec-constitution-standalone.sh
# Create constitution without AI agent - uses templates and CLI only

set -e

# Get version and date
AUTOSPEC_VERSION=$(autospec version --plain 2>/dev/null | head -1 | tr -d '\n\r')
AUTOSPEC_VERSION=${AUTOSPEC_VERSION:-"1.0.0"}
CREATED_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
TODAY=$(date -u +"%Y-%m-%d")

# Project name from directory
PROJECT_NAME=$(basename "$(pwd)")

# Constitution path
CONSTITUTION_PATH=".autospec/memory/constitution.yaml"

echo "Creating constitution for: $PROJECT_NAME"
echo "Version: $AUTOSPEC_VERSION"
echo "Date: $TODAY"

# Create directory
mkdir -p .autospec/memory

# Generate constitution.yaml using printf to avoid sed issues
cat > "$CONSTITUTION_PATH" << 'CONSTEOF'
constitution:
  project_name: "SPEC_PROJECT_NAME"
  version: "1.0.0"
  ratified: "SPEC_RATIFIED_DATE"
  last_amended: "SPEC_AMENDED_DATE"

preamble: |
  This constitution defines the non-negotiable principles and governance rules for the
  project. All specifications, plans, and implementations must adhere to these principles
  to ensure code quality, security, and maintainability.

principles:
  - id: "PRIN-001"
    name: "Test-First Development"
    category: "quality"
    priority: "NON-NEGOTIABLE"
    description: |
      All new code must have tests written before implementation.
      Tests define the expected behavior and serve as living documentation.
    rationale: "Ensures code quality and prevents regressions"
    enforcement:
      - mechanism: "CI pipeline"
        description: "Build fails if tests are missing or failing"
    exceptions:
      - "Prototype/spike code explicitly marked as such"
      - "Documentation and configuration files"

  - id: "PRIN-002"
    name: "Documentation Standards"
    category: "process"
    priority: "MUST"
    description: |
      All public APIs, complex logic, and architecture decisions must be documented.
      Breaking changes must be documented in CHANGELOG.
    rationale: "Maintains project knowledge and onboarding efficiency"
    enforcement:
      - mechanism: "Code review"
        description: "Reviewers verify documentation completeness"
    exceptions: []

  - id: "PRIN-003"
    name: "Security First"
    category: "security"
    priority: "NON-NEGOTIABLE"
    description: |
      No secrets in code or version control. User input must be validated and sanitized.
      Dependencies must be regularly audited for vulnerabilities.
    rationale: "Protects project and users from security threats"
    enforcement:
      - mechanism: "Pre-commit hooks"
        description: "Secrets detection prevents commits with credentials"
      - mechanism: "CI pipeline"
        description: "Dependency vulnerability scanning"
    exceptions: []

  - id: "PRIN-004"
    name: "Performance Standards"
    category: "quality"
    priority: "MUST"
    description: |
      Validation functions must complete in <10ms.
      User-facing operations must complete in <1s.
    rationale: "Maintains responsive user experience"
    enforcement:
      - mechanism: "Benchmark tests"
        description: "Automated performance regression tests"
    exceptions:
      - "Batch operations with explicit timing expectations"

  - id: "PRIN-005"
    name: "Code Review Required"
    category: "process"
    priority: "MUST"
    description: |
      All changes require review by at least one maintainer before merging.
      Emergency changes may bypass review with post-hoc documentation.
    rationale: "Ensures code quality and knowledge sharing"
    enforcement:
      - mechanism: "Git branch protection"
        description: "PRs must have at least one approval"
    exceptions:
      - "Emergency hotfixes with team notification"

sections:
  - name: "Code Quality"
    content: |
      All code must pass linting and formatting checks.
      No warnings allowed in production builds.
      Dependencies must be explicitly versioned.

  - name: "Version Control"
    content: |
      Feature development must occur on dedicated branches.
      Commit messages must follow conventional commit format.
      Never commit directly to main/guardian-state branches.

  - name: "Architecture"
    content: |
      Follow established project patterns and conventions.
      New patterns must be approved by maintainers.
      Cross-cutting concerns must be handled consistently.

governance:
  amendment_process:
    - step: 1
      action: "Propose change via pull request"
      requirements: "Include rationale and impact assessment"
    - step: 2
      action: "Review period"
      requirements: "Minimum 48 hours for team review"
    - step: 3
      action: "Approval"
      requirements: "Requires maintainer approval"
    - step: 4
      action: "Merge and version bump"
      requirements: "Update version and last_amended date"

  versioning_policy: |
    Constitution versions follow semantic versioning.
    MAJOR: Changes that invalidate existing compliant code.
    MINOR: New principles or expanded guidance.
    PATCH: Clarifications without behavioral change.

  compliance_review:
    frequency: "quarterly"
    process: "Review all principles for relevance and enforcement effectiveness"

  rules:
    - "Changes require review by at least one maintainer"
    - "Breaking changes require explicit team discussion"
    - "Emergency changes may bypass review with post-hoc documentation"

sync_impact:
  version_change: "1.0.0 -> 1.0.0"
  modified_principles: []
  added_sections: []
  removed_sections: []
  templates_requiring_updates: []
  follow_up_todos: []

_meta:
  version: "1.0.0"
  generator: "autospec-standalone"
  generator_version: "SPEC_VERSION"
  created: "SPEC_CREATED_DATE"
  artifact_type: "constitution"
CONSTEOF

# Use Python for reliable replacement (avoids sed issues with special chars)
python3 << 'PYSCRIPT'
import re

# Read the file
with open('.autospec/memory/constitution.yaml', 'r') as f:
    content = f.read()

# Get values from environment
project_name = "SPEC_PROJECT_NAME"
import os
ratified = os.environ.get('SPEC_RATIFIED_DATE', '2026-01-05')
amended = os.environ.get('SPEC_AMENDED_DATE', '2026-01-05')
version = os.environ.get('SPEC_VERSION', '1.0.0')
created_date = os.environ.get('SPEC_CREATED_DATE', '2026-01-05T00:00:00Z')

# Get project name from current directory
import os
project_name = os.path.basename(os.getcwd())

# Replace placeholders
content = content.replace('SPEC_PROJECT_NAME', project_name)
content = content.replace('SPEC_RATIFIED_DATE', ratified)
content = content.replace('SPEC_AMENDED_DATE', amended)
content = content.replace('SPEC_VERSION', version)
content = content.replace('SPEC_CREATED_DATE', created_date)

# Write back
with open('.autospec/memory/constitution.yaml', 'w') as f:
    f.write(content)

print(f"Constitution created: .autospec/memory/constitution.yaml")
PYSCRIPT

# Validate
echo "Validating constitution..."
autospec artifact "$CONSTITUTION_PATH"

echo ""
echo "✅ Constitution created at: $CONSTITUTION_PATH"
echo "📄 Full path: $(realpath $CONSTITUTION_PATH)"
echo "📊 Version: 1.0.0"
echo "📋 Principles: 5"
echo "📑 Sections: 3"
