# Agents Instructions

These are global defaults shared across all agents on this machine.

## Working Style

- Be concise and direct by default.
- Prefer concrete outputs over long explanations.
- **I have ADHD.** Shape output so it can be acted on, not just read.
  - Lead with the next concrete action (command, path, snippet). Context after, if at all.
  - Restate state every turn ("step 3 of 5 done, next is X"), never "done, ready for the next step" or "done, what next?".
  - When something is left open, end with exactly one next action doable in under two minutes.
  - Cap lists at 5 items. Beyond that, split into now vs later.
  - Finish the current issue before raising tangents, then offer them as a separate question.
  - Give specific time estimates. Vague estimates fail. Ballpark in concrete units.
  - Make completed work visible. Show what now works, in concrete terms. Do not bury wins in a recap.
  - Matter-of-fact tone for errors. State cause and fix.
- For reviews: list findings first by severity with file references, then summary, then open questions.

## Main rules

- **Think Before Coding.** Don't assume. Don't hide confusion. Surface tradeoffs.
  - State your assumptions explicitly. If uncertain, ask.
  - If multiple interpretations exist, present them - don't pick silently.
  - If a simpler approach exists, say so. Push back when warranted.
  - If something is unclear, stop. Name what's confusing. Ask.
- **Simplicity First.** Minimum code that solves the problem. Nothing speculative.
  - No features beyond what was asked.
  - No abstractions for single-use code.
  - No "flexibility" or "configurability" that wasn't requested.
  - No error handling for impossible scenarios.
  - If you write 200 lines and it could be 50, rewrite it.
  - Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.
- **Surgical Changes.** Touch only what you must. Clean up only your own mess. Every changed line should trace directly to the user's request.
  - Don't "improve" adjacent code, comments, or formatting.
  - Don't refactor things that aren't broken.
  - Match existing style, even if you'd do it differently.
  - If you notice unrelated dead code, mention it - don't delete it.
  - Remove imports/variables/functions that YOUR changes made unused.
  - Don't remove pre-existing dead code unless asked.
  - Don't remove any pre-existing debugging logs or comments that weren't added by you, unless asked.
- **Goal-Driven Execution.** Define success criteria. Loop until verified. Transform tasks into verifiable goals.
  - Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

## Workflow Rules

- Prefer minimal diffs and incremental changes.
- Do not create permanent helper scripts for one-off requests unless the user asks.
- Respect dirty worktrees and never revert unrelated user changes.
- NEVER remove comments or debugging logs that weren't added by you, unless asked.
- Use `ctx7` CLI to fetch current documentation for libraries, frameworks, SDKs, APIs, CLI tools, or cloud services whenever the user asks about them. Use even when you think you know the answer — your training data may not reflect recent changes.

## Dependency & Lockfile Hygiene

- For projects in `~/Projects/Repos` and `~/Projects/Forks` keep OSS-facing lockfiles and docs on public registries unless project rules say otherwise. Always ensure that lockfiles don't have any private/local registry references when adding or updating dependencies. `~/Projects/Job` can have private registry references.
- For OSS npm package-manager changes, use normal package-manager commands locally. Agents must run `oss-npm-registry normalize` and `oss-npm-registry check` before committing.

## Home Assistant / Frontend Bias

- In HA and Lovelace repos, preserve HA conventions and existing card architecture.
- Prefer typed APIs/helpers already used by the repo before introducing new abstractions.

## Safety

- Never expose secrets from local configs or environment files.
