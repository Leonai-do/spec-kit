# Autospec Diagnosis and Beginner Manual

**Date:** 2026-01-05  
**Author:** RAPO Agent  
**Project:** `/home/leonai-do/Host-D-Drive/LeonAI_DO/dev/Spec Driven Vive Coding`  
**Status:** ✅ RESOLVED

---

## Executive Summary

This report documents the diagnosis and resolution of the autospec installation issue where the `autospec constitution` command was failing with the error: **"constitution file not found at .autospec/memory/constitution.yaml"**.

**Key Finding**: You can create the constitution **without any AI agent or API key** using:

1. **Standalone script**: `.autospec/bin/create-constitution.sh`
2. **Manual execution**: Follow instructions in `.agent/workflows/autospec.constitution.md`

---

## Part 1: Diagnosis Report

### Root Cause Analysis

#### Problem Identified

When running `autospec constitution`, the command failed with:

```
Error: constitution stage failed: constitution stage exhausted retries: validation failed and retry exhausted: constitution file not found at .autospec/memory/constitution.yaml - run 'autospec constitution' to create it
```

#### Contributing Factors

1. **AI Agent Dependency**: The constitution command relies on an AI agent (Gemini CLI) to analyze the project and generate the constitution.yaml file
2. **Missing API Key**: `GEMINI_API_KEY` environment variable was not set
3. **Non-Interactive Mode**: Running in non-interactive mode prevented agent configuration

### The Solution: No API Key Required

**You don't need Gemini CLI or any API key!** The slash command is just a markdown file with instructions that any AI (or human) can follow.

#### Two Options:

**Option 1: Standalone Script (Fastest)**

```bash
.autospec/bin/create-constitution.sh
```

**Option 2: Manual Execution**

1. read_file `.agent/workflows/autospec.constitution.md`
2. Follow the instructions to create constitution.yaml
3. Validate with `autospec artifact .autospec/memory/constitution.yaml`

---

## Part 2: No-API-Key Constitution Creation

### Quick Start (Choose One)

#### Option A: One-Line Script

```bash
.autospec/bin/create-constitution.sh
```

This script:

- Gets autospec version automatically
- Creates `.autospec/memory/` directory
- Generates valid constitution.yaml from template
- Validates using autospec CLI
- No AI agent required

#### Option B: Manual with AI Agent

If you want me (or any AI) to create the constitution:

1. I read `.agent/workflows/autospec.constitution.md` (the slash command template)
2. I follow the instructions in that file
3. I create `.autospec/memory/constitution.yaml`
4. I validate with `autospec artifact .autospec/memory/constitution.yaml`

**No API key needed** - I use the autospec CLI directly.

#### Option C: Completely Manual

1. read_file `.agent/workflows/autospec.constitution.md` for template
2. Create `.autospec/memory/constitution.yaml` manually
3. Run `autospec artifact .autospec/memory/constitution.yaml` to validate

### File Structure

```
.agent/workflows/
├── AUTOSPEC-SLASH-COMMANDS.md    # This guide
└── autospec.constitution.md      # Slash command template

.autospec/
├── bin/
│   └── create-constitution.sh    # Standalone script (no API key)
└── memory/
    └── constitution.yaml         # Your project constitution
```

---

## Part 3: Beginner Manual

### What is Autospec?

Autospec is a **spec-driven development automation** tool that:

- Defines features in YAML specifications
- Generates implementation plans and tasks
- Executes workflows with or without AI agents
- Maintains project constitution and governance

### Quick Start

#### 1. Installation

```bash
# Install via Homebrew (macOS)
brew install ariel-frischer/autospec/autospec

# Or download from releases
curl -L https://github.com/ariel-frischer/autospec/releases/latest
```

#### 2. Create Constitution (Required First Step)

**Without API key**:

```bash
.autospec/bin/create-constitution.sh
```

**With AI agent** (if you have Gemini/Claude configured):

```bash
autospec constitution "Focus on security and testing"
```

#### 3. Define a Feature

```bash
# Complete workflow: specify → plan → tasks → implement
autospec all "Add user authentication feature"

# Or run individual stages
autospec specify "Add search feature"
autospec plan
autospec tasks
autospec implement
```

### Core Commands

| Command                    | Alias     | Description                  |
| -------------------------- | --------- | ---------------------------- |
| `autospec all <desc>`      |           | Run complete workflow        |
| `autospec specify <desc>`  | `spec, s` | Create specification         |
| `autospec plan`            | `p`       | Generate implementation plan |
| `autospec tasks`           | `t`       | Create task breakdown        |
| `autospec implement`       | `impl, i` | Execute implementation       |
| `autospec constitution`    | `const`   | Manage project constitution  |
| `autospec status`          | `st`      | Show implementation progress |
| `autospec doctor`          | `doc`     | Check dependencies           |
| `autospec view`            |           | Dashboard overview           |
| `autospec artifact <file>` |           | Validate artifact schema     |

### Constitution Structure

A valid constitution.yaml must have:

```yaml
constitution:
  project_name: "Your Project"
  version: "1.0.0"
  ratified: "YYYY-MM-DD"
  last_amended: "YYYY-MM-DD"

preamble: |
  Brief project purpose statement

principles:
  - id: "PRIN-001"
    name: "Principle Name"
    category: "quality|process|architecture|security|governance"
    priority: "NON-NEGOTIABLE|MUST|SHOULD|MAY"
    description: |
      Detailed principle description
    rationale: "Why this matters"
    enforcement:
      - mechanism: "Tool or process"
        description: "How it's enforced"
    exceptions:
      - "Allowed exception"

sections:
  - name: "Section Name"
    content: |
      Section content

governance:
  amendment_process:
    - step: 1
      action: "Propose change"
      requirements: "What's needed"

_meta:
  version: "1.0.0"
  artifact_type: "constitution"
```

### Priority Levels Explained

| Level            | Meaning                  | Can Bypass?                  |
| ---------------- | ------------------------ | ---------------------------- |
| `NON-NEGOTIABLE` | Cannot be bypassed       | ❌ No                        |
| `MUST`           | Required unless exempted | ⚠️ With documented exception |
| `SHOULD`         | Strongly recommended     | ⚠️ With justification        |
| `MAY`            | Optional best practice   | ✅ Yes                       |

### Principle Categories

| Category       | Focus Area                         |
| -------------- | ---------------------------------- |
| `quality`      | Code quality, testing, performance |
| `process`      | Workflow, review requirements      |
| `architecture` | Technical patterns, structure      |
| `security`     | Security requirements              |
| `governance`   | Decision-making, change management |

### How to Use Me (RAPO) for Constitution

You can ask me to create or update the constitution:

```
Please create/update the constitution focusing on [your principles]
```

I'll:

1. read_file `.agent/workflows/autospec.constitution.md`
2. Follow the instructions
3. Generate a valid constitution.yaml
4. Validate with `autospec artifact`
5. Report the results

**No Gemini API key needed** - I use autospec CLI directly.

---

## Part 4: Gemini CLI Integration (Optional)

### Setup (If You Want AI Agent)

If you prefer to use Gemini CLI for constitution creation:

1. **Set API Key**:

   ```bash
   export GEMINI_API_KEY="your-api-key"
   ```

2. **Configure Agent**:

   ```bash
   autospec init --ai gemini
   ```

3. **Use**:
   ```bash
   autospec constitution "Focus on security"
   ```

### Why You Might NOT Want This

- ❌ Requires API key
- ❌ External dependency
- ❌ Can fail in non-interactive mode
- ✅ The standalone script works without any of this

---

## Verification Results

| Test                     | Result                                  |
| ------------------------ | --------------------------------------- |
| Constitution file exists | ✅ `.autospec/memory/constitution.yaml` |
| Schema validation        | ✅ Valid (5 principles, 3 sections)     |
| Artifact validation      | ✅ Passed                               |
| Standalone script        | ✅ Executable                           |
| Manual execution guide   | ✅ Available                            |

### Current Constitution Summary

```
✓ .autospec/memory/constitution.yaml is valid
Summary: must principles: 3, sections: 3, principles: 5, non negotiable principles: 2
```

---

## References

- **Source**: [https://github.com/ariel-frischer/autospec](https://github.com/ariel-frischer/autospec)
- **Command Templates**: `.agent/workflows/`
- **Standalone Script**: `.autospec/bin/create-constitution.sh`
- **Schema Validation**: `autospec artifact <file>`

---

## Conclusion

The autospec constitution can be created **without any AI agent or API key** using:

1. **`.autospec/bin/create-constitution.sh`** - One-line standalone script
2. **`.agent/workflows/autospec.constitution.md`** - Template for manual/external AI execution

The system is now ready for spec-driven development workflows with or without AI agent integration.

**To create/update constitution**, simply run:

```bash
.autospec/bin/create-constitution.sh
```

Or ask me: "Please create/update the constitution"
