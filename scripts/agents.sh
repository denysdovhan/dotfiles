#!/usr/bin/env bash

set -e

DOTFILES=${DOTFILES:-"$HOME/.dotfiles"}
SOURCE="$DOTFILES/agents/AGENTS.md"

link_agent_instructions() {
  target_dir="$1"

  if [ ! -d "$target_dir" ]; then
    return
  fi

  ln -sfn "$SOURCE" "$target_dir/AGENTS.md"
}

link_agent_instructions "$HOME/.codex"
link_agent_instructions "$HOME/.cursor"
link_agent_instructions "$HOME/.config/agents"
link_agent_instructions "$HOME/.config/github-copilot"
link_agent_instructions "$HOME/.config/opencode"
