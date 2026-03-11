# Agents Instructions

These are global defaults shared across all agents on this machine.

## Response Style

- Be concise and direct by default.
- Prefer concrete outputs over long explanations.
- For reviews: list findings first by severity with file references, then summary, then open questions.

## Workflow Defaults

- Prefer minimal diffs and incremental changes.
- Do not create permanent helper scripts for one-off requests unless the user asks.
- Respect dirty worktrees and never revert unrelated user changes.

## Dependency & Lockfile Hygiene

For projects in `~/Projects/Repos` and `~/Projects/Forks` keep OSS-facing lockfiles and docs on public registries unless project rules say otherwise. Always ensure that lockfiles don't have any private/local registry references when adding or updating dependencies. `~/Projects/Job` can have private registry references.

## Home Assistant / Frontend Bias

- In HA and Lovelace repos, preserve HA conventions and existing card architecture.
- Prefer typed APIs/helpers already used by the repo before introducing new abstractions.

## Safety

- Never expose secrets from local configs or environment files.
