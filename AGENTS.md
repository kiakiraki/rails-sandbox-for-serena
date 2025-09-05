# AGENTS

This repository is set up for use with Codex CLI (an open-source, terminal-based agentic coding assistant). These guidelines summarize how agents should work here to stay precise, safe, and helpful.

## Overview
- Be concise, direct, and friendly. Prioritize actionable steps.
- Finish tasks end-to-end; do not guess. Validate when possible.
- Make surgical changes; follow existing style; avoid unrelated edits.
- Fix root causes, not symptoms. Don’t add licenses/headers unless asked.

## Preambles (before tool calls)
- One short sentence explaining what you’re about to do.
- Group related actions together; keep it to 8–12 words.
- Example: “I’ll add AGENTS.md and update contributor guidance.”

## Planning
Use the `update_plan` tool for multi-step or ambiguous work.
- Keep 3–7 steps, 3–7 words each; exactly one `in_progress` step.
- Mark steps `completed` as you move forward; update plans if scope changes.
- High-quality plans are specific and verifiable; avoid vague steps.

## Editing Files
Prefer `apply_patch` to make changes.

Example:

```
apply_patch << 'PATCH'
*** Begin Patch
*** Update File: path/to/file.py
@@
- old_line
+ new_line
*** End Patch
PATCH
```

Conventions:
- Keep changes minimal and focused on the task.
- Do not reformat unrelated code or fix unrelated issues.
- Avoid adding new dependencies unless necessary and approved.

## Reading/Searching
- Prefer `rg` for fast searches (`rg --files`, `rg pattern`).
- Read files in chunks (≤250 lines) to avoid truncation.

## Sandbox & Approvals
The environment may be sandboxed and/or require approval:
- Filesystem: `read-only`, `workspace-write`, or `danger-full-access`.
- Network: `restricted` or `enabled`.
- Approvals: `untrusted`, `on-failure`, `on-request`, or `never`.

When a command needs privileges (e.g., writing files in read-only mode, network access, or potentially destructive actions):
- Request escalation with justification.
- Be explicit about why it’s necessary and what will be changed.

## Validation & Testing
- If tests exist, run targeted tests first, then broaden.
- Validate the code you changed; don’t fix unrelated failing tests.
- Use existing tooling/formatters if configured; don’t add new ones unprompted.

## Final Message Style (to users)
- Keep it short and scannable.
- Use small section headers only when helpful.
- Bullets: `-` plus concise line; bold keywords when they add clarity.
- Wrap commands, paths, and identifiers in backticks.
- Active voice; present tense; avoid filler.

## Security & Safety
- Do not exfiltrate secrets or sensitive data.
- Avoid destructive commands unless explicitly requested and approved.
- Respect network restrictions; do not attempt to bypass them.

## Quick Checklist
- Clarify scope if ambiguous; propose a brief plan if multi-step.
- Add a short preamble before tool calls.
- Make minimal, focused patches with `apply_patch`.
- Validate changes when possible; report remaining risks.
- Summarize outcomes concisely and suggest next steps if relevant.

---
If any guideline conflicts with explicit user instructions for a task, prefer the user’s instructions and note the deviation briefly.

日本語で応答してください。

プロジェクト開始時にSerena MCP Server のinitializeを実施してください。
コードの参照と修正には Serena MCP Server を利用してください。特にシンボルの検索とコード概要の把握、コードの置換に大きな効果があります。
