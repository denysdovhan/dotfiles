# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# ------------------------------------------------------------------------------

#
# ~/.zshrc
#
# ------------------------------------------------------------------------------
# Environment
# ------------------------------------------------------------------------------

# Export path to root of dotfiles repo
export DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Do not override files using `>`, but it's still possible using `>!`
set -o noclobber

# Extend $PATH without duplicates
_extend_path() {
  [[ -d "$1" ]] || return

  if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
    export PATH="$1:$PATH"
  fi
}

# Add custom bin to $PATH
_extend_path "$HOME/.local/bin"
_extend_path "$DOTFILES/bin"
_extend_path "$HOME/.npm-global/bin"
_extend_path "$HOME/.rvm/bin"
_extend_path "$HOME/.yarn/bin"
_extend_path "$HOME/.config/yarn/global/node_modules/.bin"
_extend_path "$HOME/.bun/bin"

# Extend $NODE_PATH
if [ -d ~/.npm-global ]; then
  export NODE_PATH="$NODE_PATH:$HOME/.npm-global/lib/node_modules"
fi

# bun completions
if [ -s "/Users/denysd/.bun/_bun" ]; then
  source "/Users/denysd/.bun/_bun"
fi

# Default pager
export PAGER='less'

# less options
less_opts=(
  # Quit if entire file fits on first screen.
  -FX
  # Ignore case in searches that do not contain uppercase.
  --ignore-case
  # Allow ANSI colour escapes, but no other escapes.
  --RAW-CONTROL-CHARS
  # Quiet the terminal bell. (when trying to scroll past the end of the buffer)
  --quiet
  # Do not complain when we are on a dumb terminal.
  --dumb
)
export LESS="${less_opts[*]}"

# Default editor for local and remote sessions
if [[ -n "$SSH_CONNECTION" ]]; then
  # on the server
  if [ command -v vim >/dev/null 2>&1 ]; then
    export EDITOR='vim'
  else
    export EDITOR='vi'
  fi
else
  export EDITOR='vim'
fi

# Better formatting for time command
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'

# ------------------------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------------------------
ZSH_DISABLE_COMPFIX=true

# OMZ is managed by Sheldon
export ZSH="$HOME/.local/share/sheldon/repos/github.com/ohmyzsh/ohmyzsh"

plugins=(
  history-substring-search
  git
  npm
  yarn
  nvm
  sudo
  extract
  ssh-agent
  gpg-agent
  macos
  gh
  vscode
  common-aliases
  command-not-found
  docker
)

# Autoload node version when changing cwd
NVM_AUTOLOAD=1

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

# Shell plugins
eval "$(sheldon source)"
# Per-directory configs
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# ------------------------------------------------------------------------------
# Overrides
# ------------------------------------------------------------------------------

# Sourcing all zsh files from $DOTFILES/custom
custom_files=($(find $DOTFILES/custom -type f -name "*.zsh"))
if [[ "${#custom_files[@]}" -gt 0 ]]; then
  for file in "${custom_files[@]}"; do
    source "$file"
  done
fi

# Source local configuration
if [[ -f "$HOME/.zshlocal" ]]; then
  source "$HOME/.zshlocal"
fi

# ------------------------------------------------------------------------------

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
