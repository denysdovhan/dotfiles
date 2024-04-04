eval "$(/usr/local/bin/brew shellenv)"

LOCAL_PATH="${DOTFILES:-$HOME/.dotfiles}/bin"

# Askpass script based on security
export PATH="$PATH:$LOCAL_PATH"
export SUDO_ASKPASS="$LOCAL_PATH/askpass"

# Added by Toolbox App
export PATH="$PATH:/usr/local/bin"
