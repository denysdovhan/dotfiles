#!/usr/bin/env bash

set -e

SOURCE="$HOME/.config/agents/AGENTS.md"

link_agent_instructions() {
  target_dir="$1"
  target_name="${2:-${SOURCE##*/}}"

  if [ ! -d "$target_dir" ]; then
    return
  fi

  ln -sfn "$SOURCE" "$target_dir/$target_name"
}

link_agent_instructions "$HOME/.codex"
link_agent_instructions "$HOME/.cursor"
link_agent_instructions "$HOME/.config/github-copilot"
link_agent_instructions "$HOME/.config/opencode"
link_agent_instructions "$HOME/.claude" "CLAUDE.md"
