# Agents Repository Guidelines

## Project Structure & Module Organization

- `home/`: source of symlinked dotfiles (for example `home/.zshrc`, `home/.gitconfig`).
- `lib/`: shared Zsh modules loaded by shell config (`aliases.zsh`, `smartdots.zsh`, `lscolors.zsh`).
- `bin/`: small executable utilities available on PATH (`git-upstream`, `git-cleanup`, `password`).
- `scripts/`: maintenance scripts for this repository (`bootstrap`, `update`, `projects`, `zgen`).
- `custom/`: machine- or user-specific overrides and notes.
- `dotbot/`: vendored Dotbot submodule used by `./install` to create links from `install.conf.yaml`.

## Build, Test, and Development Commands

- `./install`: sync Dotbot submodule and apply `install.conf.yaml` links.
- `./install --except shell`: relink dotfiles without running shell steps (used during updates).
- `./scripts/bootstrap`: interactive first-machine bootstrap (Homebrew, Git, Zsh, npm globals).
- `./scripts/update`: pull latest dotfiles and run package manager updates.
- `./scripts/projects`: create `~/Projects/{Repos,Forks,Job,Playground}` on macOS.
- `./scripts/zgen`: clone or update `~/.zgen` plugin manager.

## Workflow

- `README.md` should always be up-to-date with the codebase.
- When changes made to configuration in `home`, `bin` or `lib`, keep `README.md` updated to reflect these changes.

## Coding Style & Naming Conventions

- Follow `.editorconfig`: UTF-8, LF endings, final newline, spaces with 2-space indent by default.
- Python files use 2-space indentation.
- Prettier config enforces single quotes (`.prettierrc`).
- Keep shell scripts POSIX/Bash-friendly, executable, and lowercase-named (for example `scripts/update`).
- Prefer descriptive function names in scripts: `install_homebrew`, `update_dotfiles`.

## Testing Guidelines

- There is no top-level automated test suite for dotfiles changes.
- For script/config changes, validate by running the affected script directly (for example `./install`, `./scripts/update`) in a safe environment.

## Commit & Pull Request Guidelines

- Match existing history: Conventional Commit style, e.g. `feat(zshrc): ...`, `fix: ...`, `chore: ...`, `refactor: ...`.
- Keep commits focused by area (`Brewfile`, `zsh`, `gitconfig`, `scripts`).
- PRs should include:
  - clear summary of behavior changes,
  - related issue/context,
  - before/after snippets for prompt, alias, or terminal UX updates,
  - manual verification steps executed.

## Security & Configuration Tips

- Never commit machine-specific secrets; keep identity in `~/.gitlocal` and shell overrides in `~/.zshlocal`.
- Review `install.conf.yaml` carefully before adding new links that target home-directory files.
