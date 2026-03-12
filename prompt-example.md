# [Project]

## Purpose

This is the **master prompt** for the Financial Project.
It defines the system rules and specifies which additional prompts and agents should be used for specialized tasks.

---

# Project Overview

[overview/context for the project]

---

# Behaviour

Whenever new `.md` files are created, they must be stored in:

[place for the md files]

Follow the behaviour rules defined in:

[place for the md behaviour.md]

---

# Architecture

The architectural rules for this project are defined in:

[place for the md architecture.md]

Before implementing any code changes, read this file and follow its rules.

These rules define:

* the system layers
* dependency direction
* where business logic must live
* repository and infrastructure responsibilities

The architecture rules must **never be violated**.

If a requested change would break these rules, stop and ask the developer before proceeding.

---

# Development Role

Development rules and C# coding conventions are defined in:

[place for the role md csharp.md]


Always follow those guidelines when writing or modifying code.

---

# Codebase Analyzer

The system must maintain a persistent understanding of the codebase.

Check if the file exists:

[place for md discovery-findings.md]


If the file exists:

* Read its contents
* Incorporate the information into the current context

If the file does not exist:

* Execute the process defined in

[place for md codebase-analyzer-agent.md]


* Generate the discovery findings
* Save them to:

[place for md discovery-findings.md]

---

# Agents

This project uses specialized agents to assist development.

The following agents are available:

Task Planner  
Responsible for transforming tasks into step-by-step implementation plans.

See:
[place for md task-planner-agent.md]


Codebase Analyzer  
Responsible for discovering patterns and conventions in the codebase.

See:
[place for md codebase-analyzer-agent.md]

Code Review Agent  
Responsible for reviewing generated code to ensure quality and architecture compliance.

See:
[place for md code-review-agent.md]


---

# Agent Usage Rules

Each agent has a **clear trigger and purpose**:

1. **Codebase Analyzer**
   - Trigger: Only run if `discovery-findings.md` does not exist or is outdated.
   - Action: Analyze the codebase and generate discovery-findings.md.
   - Output: Provides architecture, patterns, and conventions for context.

2. **Task Planner**
   - Trigger: Always run before implementing a new task.
   - Action: Convert the current task into a **step-by-step plan**.
   - Output: Atomic steps for safe execution.

3. **Code Review Agent**
   - Trigger: Always run **after executing a plan step**.
   - Action: Review all code changes for:
       - Architecture compliance
       - Pattern consistency
       - Quality and maintainability
   - Output: Approve or request changes before proceeding.

---

# Workflow

Always follow this workflow order:

1. Run the Codebase Analyzer if discovery findings do not exist.
2. Read the architecture guidelines.
3. Read the current [place for md task.md] definition.
4. Use the Task Planner agent to create an implementation plan.
5. Execute the plan step by step.
6. Use the Code Review agent to review changes.
7. Record progress in the task log, and store at the [place for md task-progress.md]