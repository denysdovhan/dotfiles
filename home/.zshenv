# .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
#
# .zshenv is always sourced.
#
# It often contains exported variables that should be available to other programs.
# For example, $PATH, $EDITOR, and $PAGER are often set in .zshenv.
# Also, you can set $ZDOTDIR in .zshenv to specify an alternative location for the rest of your zsh configuration.

# Enable aliases to be sudo’ed
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

# Check if command exists
_exists() {
  command -v $1 > /dev/null 2>&1
}

# Extend $PATH without duplicates
_extend_path() {
  [[ -d "$1" ]] || return

  if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
    export PATH="$1:$PATH"
  fi
}

# ZSH Specific envs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/tmp/users/$UID"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump-$UID"

# Sudo askpass implementation. TODO: replace with gpg
export SUDO_ASKPASS="$HOME/.local/bin/askpass"

# Spaceship config
export SPACESHIP_CONFIG="$XDG_CONFIG_HOME/spaceship/config.zsh"

# Create host file
if [ ! -f "$ZDOTDIR/zsh.$HOST" ]; then
  touch "$ZDOTDIR/zsh.$HOST"
fi

# Disable "Last Login: message"
if [ ! -f "$HOME/.hushlogin" ]; then
  touch "$HOME/.hushlogin"
fi

# Add custom bin to $PATH
_extend_path "/usr/local/bin" # Added by Toolbox
_extend_path "$HOME/.local/bin"
_extend_path "$HOME/.npm-global/bin"
_extend_path "$HOME/.rvm/bin"
_extend_path "$HOME/.yarn/bin"
_extend_path "$HOME/.bun/bin"
_extend_path "$DOTFILES/bin"
_extend_path "$XDG_CONFIG_HOME/yarn/global/node_modules/.bin"

