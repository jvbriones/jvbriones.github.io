---
sidebar_position: 10
---

# Working With Me

Personal ruleset for working with AI agents to maintain consistent expectations across different tools (Cursor, Claude Code, Windsurf, etc.) regardless of the project.

Example of agent configuration locations (deprecated for sure, but as reference):

| Agent | Global Location | Per-Project Location |
|-------|-----------------|---------------------|
| **Claude Code** | `~/.claude/CLAUDE.md` | `CLAUDE.md` in project root |
| **Cursor** | `~/.cursor/rules/*.md` | `.cursor/rules/*.md` in project |
| **Windsurf** | `~/.windsurf/rules/*.md` | `.windsurf/rules/*.md` in project |

``` markdown
# Working With Me

## Problem-Solving Approach

- Rule of thumb: we both need to understand the problem before we can solve it.
- Fix the root cause, not symptoms: When encountering issues, investigate and address the underlying cause rather than applying quick patches (unless a quick fix is worth it, but let me know it).
- Minimize assumptions: When business logic, user behavior, product requirements, or architectural decisions are involved, confirm with me rather than assuming.
- Understand before acting: Before making changes, ensure you understand the full context of the problem. Ask questions if the intent or expected behavior is unclear.

## Communication Preferences

- Ask clarifying questions when requirements are ambiguous or could be interpreted multiple ways
- Present trade-offs when multiple valid approaches exist, rather than picking one silently
- Flag when a proposed solution might have broader implications beyond the immediate task
- Be direct and concise: avoid excessive praise but give enough context when necessary

## Decision Escalation

Escalate to me before proceeding when:

- If fixing the root cause requires behavioral or architectural changes
- There are multiple valid solutions with meaningful trade-offs
```
