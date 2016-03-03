#
# ~/.zshrc
#

# Export path to root of dotfiles repo
export DOTFILES=${DOTFILES:-"$HOME/Dotfiles"}

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Do not override files using `>`, but it's still possible using `>!`
set -o noclobber

# Extend $PATH without duplicates
function _extend_path() {
  if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
    PATH="$1:$PATH"
  fi
}

# Add custom bin to $PATH
[ -d ~/.bin ] && _extend_path "$HOME/.bin"
[ -d $DOTFILES/bin ] && _extend_path $DOTFILES/bin

# NVM
if [ -d $HOME/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -r "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi

# Default pager
export PAGER='less'

# less options
less_opts=(
  # Quit if entire file fits on first screen.
  --quit-if-one-screen
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
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim' # change if needed
fi

# SSH
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Add travis gem
TRAVIS="$HOME/.travis/travis.sh"
[ -f $TRAVIS ] && source $TRAVIS

# Atom
export ATOM_USER=${ATOM_USER:-denysdovhan}

# OH MY ZSH
# == == ===

# Use case-sensitive completion.
# CASE_SENSITIVE="true"

# Use hyphen-insensitive completion.
# Note: Case sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Disable colors in ls.
# DISABLE_LS_COLORS="true"

# Disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Change the command execution time stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Custom folder than $ZSH/custom
ZSH_CUSTOM="$DOTFILES/zsh"

# ZGEN
# ====

# load zgen
source "$HOME/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save..."

  # Use Oh-My-Zsh
  zgen oh-my-zsh

  # Load Oh-My-Zsh plugins
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/node
  zgen oh-my-zsh plugins/npm
  zgen oh-my-zsh plugins/nvm
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/web-search

  # Load external plugins
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load hlissner/zsh-autopair
  zgen load akoenig/npm-run.plugin.zsh
  zgen load akoenig/gulp.plugin.zsh

  # Load theme
  zgen load denysdovhan/spaceship-zsh-theme spaceship

  # Automaticaly refresh ~/.zshrc and ~/.zshlocal
  if [[ -f ~/.zshlocal ]]; then
    ZGEN_RESET_ON_CHANGE=("$HOME/.zshrc" "$HOME/.zshlocal")
  else
    ZGEN_RESET_ON_CHANGE=("$HOME/.zshrc")
  fi

  # save all to init script
  zgen save
fi

# Load extra (private) settings
[ -f ~/.zshlocal ] && source ~/.zshlocal
