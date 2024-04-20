# Extend $PATH without duplicates
_extend_path() {
  [[ -d "$1" ]] || return

  if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
    export PATH="$1:$PATH"
  fi
}

# Add custom bin to $PATH
_extend_path "$HOME/.local/bin"
_extend_path "/usr/local/bin" # Added by Toolbox
_extend_path "$DOTFILES/bin"
_extend_path "$HOME/.npm-global/bin"
_extend_path "$HOME/.rvm/bin"
_extend_path "$HOME/.yarn/bin"
_extend_path "$XDG_CONFIG_HOME/yarn/global/node_modules/.bin"
_extend_path "$HOME/.bun/bin"

# Added by Homebrew
eval "$(/usr/local/bin/brew shellenv)"
