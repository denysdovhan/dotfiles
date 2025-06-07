#
# ~/.zshrc
#
# ------------------------------------------------------------------------------
# Environment
# ------------------------------------------------------------------------------

export PATH=/usr/local/sbin:/usr/local/bin:$PATH

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
  export EDITOR='vim'
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

# Spaceship project directory (for local development)
SPACESHIP_PROJECT="$HOME/Projects/Repos/spaceship/spaceship-prompt"

# Reset zgen on change
ZGEN_RESET_ON_CHANGE=(
  ${HOME}/.zshrc
  ${DOTFILES}/lib/*.zsh
  #${DOTFILES}/custom/*.zsh
)

# Load zgen
source "${HOME}/.zgen/zgen.zsh"

# Load zgen init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # Oh-My-Zsh plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/history-substring-search
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/yarn
    zgen oh-my-zsh plugins/nvm
    zgen oh-my-zsh plugins/fnm
    zgen oh-my-zsh plugins/extract
    zgen oh-my-zsh plugins/ssh-agent
    zgen oh-my-zsh plugins/gpg-agent
    zgen oh-my-zsh plugins/macos
    zgen oh-my-zsh plugins/vscode
    zgen oh-my-zsh plugins/gh
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh plugins/direnv
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/docker-compose
    zgen oh-my-zsh plugins/node
    zgen oh-my-zsh plugins/deno

    # Custom plugins
    zgen load chriskempson/base16-shell
    zgen load djui/alias-tips
    zgen load marzocchi/zsh-notify
    zgen load hlissner/zsh-autopair
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions
    zgen load Aloxaf/fzf-tab

    # Files
    zgen load $DOTFILES/lib
    zgen load $DOTFILES/custom

    # Load Spaceship prompt from remote
    if [[ ! -d "$SPACESHIP_PROJECT" ]]; then
      zgen load spaceship-prompt/spaceship-prompt spaceship
    fi

    # Completions
    zgen load zsh-users/zsh-completions src

    # Save all to init script
    zgen save
fi

# Load Spaceship form local project
if [[ -d "$SPACESHIP_PROJECT" ]]; then
  source "$SPACESHIP_PROJECT/spaceship.zsh"
fi

# ------------------------------------------------------------------------------
# Init tools
# ------------------------------------------------------------------------------

# # Per-directory configs
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# Like cd but with z-zsh capabilities
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
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
if [ -f "$HOME/.fzf.zsh" ]; then
  source "$HOME/.fzf.zsh"
fi

# ------------------------------------------------------------------------------
# Overrides
# ------------------------------------------------------------------------------

# Source local configuration
if [[ -f "$HOME/.zshlocal" ]]; then
  source "$HOME/.zshlocal"
fi

# ------------------------------------------------------------------------------
PATH=$(pyenv root)/shims:$PATH
eval "$(pyenv init -)"

PATH="/Users/pdss/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/pdss/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/pdss/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/pdss/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/pdss/perl5"; export PERL_MM_OPT;
export PATH="/usr/local/opt/apr-util/bin:$PATH"
export PATH="/usr/local/opt/m4/bin:$PATH"
export PATH=/usr/libexec:${PATH}


eval "$(pkgx --quiet dev --shellcode)"  # https://github.com/pkgxdev/dev
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
eval "(op signin)"
eval "$(gh copilot alias -- zsh)"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/expat/bin:$PATH"
export PATH="/usr/local/opt/unzip/bin:$PATH"
export PATH="/usr/local/opt/berkeley-db@5/bin:$PATH"
