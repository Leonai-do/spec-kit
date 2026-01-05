# Autospec Slash Commands - Agent Execution Guide

This file provides instructions for executing autospec slash commands WITHOUT AI agent API keys.

## Location

Command templates are stored in: `.agent/workflows/`

## Quick Reference

### `/autospec.constitution` - Create Project Constitution

**Path**: `.agent/workflows/autospec.constitution.md`

**Purpose**: Define project principles and governance rules

**When to use**: Before starting any feature development

**Execution steps**:

1. Read `.agent/workflows/autospec.constitution.md`
2. Get autospec version: `autospec version --plain`
3. Load existing context (README.md, docs/, AGENTS.md)
4. Generate constitution.yaml following the template
5. Write to `.autospec/memory/constitution.yaml`
6. Validate: `autospec artifact .autospec/memory/constitution.yaml`
7. Report summary

**No API key required** - Uses only the autospec CLI

### Available Commands

| Command                  | File                       | Purpose                      |
| ------------------------ | -------------------------- | ---------------------------- |
| `/autospec.constitution` | `autospec.constitution.md` | Create project constitution  |
| `/autospec.specify`      | `autospec.specify.md`      | Create feature specification |
| `/autospec.plan`         | `autospec.plan.md`         | Generate implementation plan |
| `/autospec.tasks`        | `autospec.tasks.md`        | Create task breakdown        |
| `/autospec.implement`    | `autospec.implement.md`    | Execute implementation       |

## Agent Execution Pattern

For ANY slash command:

```
1. read_file the command file: .agent/workflows/<command>.md
2. Follow the "Outline" section instructions
3. Execute CLI commands as needed (autospec, git, etc.)
4. Create/update files as directed
5. Validate using autospec artifact <file>
6. Report results
```

## Standalone Script

For automatic constitution creation without AI agent:

```bash
.autospec/bin/create-constitution.sh
```

This script:

- Gets autospec version
- Creates directory structure
- Generates constitution.yaml from template
- Validates using autospec CLI

## Benefits

✅ **No API keys required** - Uses autospec CLI only  
✅ **Framework compatible** - Follows exact specification  
✅ **AI agent agnostic** - Works with any AI  
✅ **Traceable** - Command files provide full instructions  
✅ **Validatable** - Schema validation ensures compliance
