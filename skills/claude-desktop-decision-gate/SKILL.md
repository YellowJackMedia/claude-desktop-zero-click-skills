---
name: claude-desktop-decision-gate
description: Decide whether to ask questions, draft, rewrite, audit, or route work to a better skill before writing in Claude Desktop. Use when the request is underspecified or when workflow choice matters.
---

# Claude Desktop Decision Gate

Use this skill before writing anything substantial.

## Purpose

Prevent bad defaults by deciding the best action first.

## Gate logic

If the request lacks these, ask first:
- audience
- goal
- format
- deadline
- source material

If the request is clear, choose one path:
- **Draft** — new content from scratch
- **Rewrite** — existing content needs improvement
- **Strategy** — choose the right asset type
- **Audit** — content needs review before publishing
- **Research** — more facts are required

## Output format

Return one of these:
- `ASK QUESTIONS`
- `WRITE DRAFT`
- `REWRITE`
- `AUDIT`
- `STRATEGY`
- `RESEARCH`

Then add one sentence explaining why.

## Rules

- Prefer clarity over speed.
- Don't write first if the format is wrong.
- Don't rewrite before understanding the goal.
- Don't optimize a bad asset choice.

## Success condition

Claude Desktop pauses and chooses the right workflow instead of drifting into the wrong one.