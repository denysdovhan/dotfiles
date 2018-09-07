#
# ~/.zshrc
#

# Export path to root of dotfiles repo
export DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

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
[ -d $DOTFILES/bin ] && _extend_path "$DOTFILES/bin"
[ -d ~/.npm-global ] && _extend_path "~/.npm-global/bin"

# Extend $NODE_PATH
if [ -d ~/.npm-global ]; then
  export NODE_PATH="$NODE_PATH:$HOME/.npm-global/lib/node_modules"
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
if [[ -n "$SSH_CONNECTION" ]]; then
  # on the server
  if [ command -v vim >/dev/null 2>&1 ]; then
    export EDITOR='vim'
  else
    export EDITOR='vi'
  fi
else
  # local
  export EDITOR='vim' # change if needed
fi

# SSH
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Add travis gem
TRAVIS="$HOME/.travis/travis.sh"
[ -f "$TRAVIS" ] && source $TRAVIS

# Atom
export ATOM_USER=${ATOM_USER:=denysdovhan}

# LSCOLORS
# Online editor: https://geoff.greer.fm/lscolors/
export LSCOLORS="Gxfxcxdxbxegedabagacab"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:ow=0;41:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:*.patch=00;34:*.o=00;32:*.so=01;35:*.ko=01;31:*.la=00;33'
# Zsh to use the same colors as ls
# Link: http://superuser.com/a/707567
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# LSCOLORS
# Online editor: https://geoff.greer.fm/lscolors/
export LSCOLORS="Gxfxcxdxbxegedabagacab"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:ow=0;41:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:*.patch=00;34:*.o=00;32:*.so=01;35:*.ko=01;31:*.la=00;33'
# Zsh to use the same colors as ls
# Link: http://superuser.com/a/707567
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

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
# ENABLE_CORRECTION="true"

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

source "$DOTFILES/lib/zplug.zsh"

# load zgen
# source "$HOME/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save..."

  # Use Oh-My-Zsh
  zgen oh-my-zsh

  # Load Oh-My-Zsh plugins
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/node
  # zgen oh-my-zsh plugins/npm
  zgen oh-my-zsh plugins/nvm
  zgen oh-my-zsh plugins/rvm
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/web-search
  zgen oh-my-zsh plugins/vagrant
  zgen oh-my-zsh plugins/yarn
  zgen oh-my-zsh plugins/heroku
  # TODO: Use extract plugin

  # Load external plugins
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load hlissner/zsh-autopair
  # zgen load akoenig/npm-run.plugin.zsh
  zgen load akoenig/gulp.plugin.zsh
  zgen load denysdovhan/gitio-zsh
  # zgen load lukechilds/zsh-better-npm-completion

  # Load theme
  # zgen load denysdovhan/spaceship-zsh-theme spaceship
  zgen load "$HOME/Projects/Repos/spaceship-prompt/spaceship.zsh"

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting