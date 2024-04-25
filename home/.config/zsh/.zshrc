# .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
#
# .zshrc is for interactive shells.
#   You set options for the interactive shell there with the setopt and unsetopt commands.
#   You can also load shell modules, set your history options, change your prompt, set up zle and completion, et cetera.
#   You also set any variables that are only used in the interactive shell (e.g. $LS_COLORS).

# ------------------------------------------------------------------------------
# Environment
# ------------------------------------------------------------------------------

# Title
export DISABLE_AUTO_TITLE="true"

# Export path to root of dotfiles repo
export DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Z Navigation
export _Z_DATA="$ZDOTDIR/.z"

# Homebrew
export HOMEBREW_NO_ENV_HINTS="true"
export HOMEBREW_INSTALL_BADGE="☕️"
export HOMEBREW_COLOR="true"

HB_CNF_HANDLER="$(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
    source "$HB_CNF_HANDLER"
fi

# Do not override files using `>`, but it's still possible using `>!`
set -o noclobber

# Extend $NODE_PATH
if [ -d ~/.npm-global ]; then
  export NODE_PATH="$NODE_PATH:$HOME/.npm-global/lib/node_modules"
fi

# Default pager
export PAGER='less'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

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
  ${HOME}/.zshenv
  ${ZDOTDIR}/.zprofile
  ${ZDOTDIR}/.zshrc
  ${ZDOTDIR}/.zlogin
  ${ZDOTDIR}/.zlogout
  ${DOTFILES}/lib/*.zsh # Upstream scripts
  ${SPACESHIP_CONFIG}
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

    # Custom plugins
    zgenom load jeffreytse/zsh-vi-mode
    zgenom load djui/alias-tips
    zgenom load agkozak/zsh-z
    zgenom load marzocchi/zsh-notify
    zgenom load hlissner/zsh-autopair
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zdharma-continuum/fast-syntax-highlighting
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load unixorn/autoupdate-zgenom
    zgenom load unixorn/fzf-zsh-plugin
    zgenom load amyreese/zsh-titles 
    
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
    zgenom compile $ZGEN_RESET_ON_CHANGE
fi

zgenom clean

# Diff - lib/theme-and-appearance.zsh has its own function which we override here
if _exists diff-so-fancy; then
  quiet unset diff
  diff() {
    command diff --color -u "$@" | diff-so-fancy | less
  }
fi

# ------------------------------------------------------------------------------
# Direnv
# ------------------------------------------------------------------------------

# Per-directory configs
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# ------------------------------------------------------------------------------
# iTerm
# ------------------------------------------------------------------------------
# Allows to pass variables into the app UI
iterm2_print_user_vars() {
    iterm2_set_user_var now $(echo $(date +'%a\xC2\xA0%H:%M'))
    iterm2_set_user_var title $(echo "$(whoami)@$(hostname):$(pwd)")
    iterm2_set_user_var editor $(echo $(which $EDITOR))
}

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
if [ -f "zsh.$HOST" ]; then
  source "zsh.$HOST"
fi

