# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
[[ -f "$ZDOTDIR/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$ZDOTDIR/.fig/shell/zshrc.pre.zsh"
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
_extend_path "$XDG_CONFIG_HOME/yarn/global/node_modules/.bin"
_extend_path "$HOME/.bun/bin"

# Extend $NODE_PATH
if [ -d ~/.npm-global ]; then
  export NODE_PATH="$NODE_PATH:$HOME/.npm-global/lib/node_modules"
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
  if command -v vim >/dev/null 2>&1; then
    export EDITOR='vim'
  else
    export EDITOR='vi'
  fi
else
  export EDITOR='nvim'
fi

# Better formatting for time command
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'

# ------------------------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------------------------
ZSH_DISABLE_COMPFIX=true

# Autoload node version when changing cwd
zstyle ':omz:plugins:nvm' autoload true

# Use passphase from macOS keychain
if [[ "$OSTYPE" == "darwin"* ]]; then
  zstyle :omz:plugins:ssh-agent ssh-add-args --apple-load-keychain
fi

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

ZGEN_RESET_ON_CHANGE=(
  ${ZDOTDIR}/.zshrc
  ${ZDOTDIR}/.zsh.local
  ${ZDOTDIR}/.zprofile
  ${DOTFILES}/lib/*.zsh
)

# Automatically add symlinks
ZGENOM_AUTO_ADD_BIN=1

function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

# Load zgenom
source "${ZDOTDIR}/.zgenom/zgenom.zsh"
zgenom autoupdate

# Load zgenom init script
if ! zgenom saved; then
    zgenom ohmyzsh

    # OhMyZsh plugins
    zgenom ohmyzsh plugins/git
    zgenom ohmyzsh plugins/history-substring-search
    zgenom ohmyzsh plugins/sudo
    zgenom ohmyzsh plugins/command-not-found
    zgenom ohmyzsh plugins/npm
    zgenom ohmyzsh plugins/nvm
    zgenom ohmyzsh plugins/extract
    zgenom ohmyzsh plugins/ssh-agent
    zgenom ohmyzsh plugins/macos
    zgenom ohmyzsh plugins/gh
    zgenom ohmyzsh plugins/common-aliases
    zgenom ohmyzsh plugins/brew
    zgenom ohmyzsh plugins/sfdx
    zgenom ohmyzsh plugins/aliases
    zgenom ohmyzsh plugins/iterm2
    zgenom ohmyzsh plugins/thefuck
    zgenom ohmyzsh plugins/vi-mode

    # Custom plugins
    zgenom load jeffreytse/zsh-vi-mode
    zgenom load djui/alias-tips
    zgenom load agkozak/zsh-z
    zgenom load marzocchi/zsh-notify
    zgenom load hlissner/zsh-autopair
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zdharma-continuum/fast-syntax-highlighting
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load spaceship-prompt/spaceship-vi-mode
    zgenom load unixorn/autoupdate-zgenom
    zgenom load unixorn/fzf-zsh-plugin
    
    # Files
    zgenom load $DOTFILES/lib
    zgenom load $DOTFILES/custom

    # Spaceship Prompt
    zgenom load spaceship-prompt/spaceship-prompt spaceship

    # Completions
    zgenom load zsh-users/zsh-completions src

    # Save all to init script
    zgenom save
    
    # Compile your zsh files
    zgenom compile $ZDOTDIR
fi

# ------------------------------------------------------------------------------
# Direnv
# ------------------------------------------------------------------------------

# Per-directory configs
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# ------------------------------------------------------------------------------
# Load additional zsh files
# ------------------------------------------------------------------------------

# bun completions
if [ -s "$HOME/.bun/_bun" ]; then
  source "$HOME/.bun/_bun"
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

# Fuzzy finder bindings
export FZF_BASE="$HOME/.fzf"
if [ -f "$HOME/.fzf.zsh" ]; then
  source "$HOME/.fzf.zsh"
fi

# ------------------------------------------------------------------------------
# Overrides
# ------------------------------------------------------------------------------

# Source local configuration
if [[ -f "$ZDOTDIR/.zsh.local" ]]; then
  source "$ZDOTDIR/.zsh.local"
fi

# ------------------------------------------------------------------------------

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
[[ -f "$ZDOTDIR/.fig/shell/zshrc.post.zsh" ]] && builtin source "$ZDOTDIR/.fig/shell/zshrc.post.zsh"

