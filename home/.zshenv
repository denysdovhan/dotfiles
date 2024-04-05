# Disable "Last Login: message"
test -e "$HOME/.hushlogin" || touch "$HOME/.hushlogin"

# ZSH Specific envs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/tmp/users/$UID"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump-$UID"

export PATH="$PATH:$HOME/.local/bin"
export SUDO_ASKPASS="$HOME/.local/bin/askpass"

