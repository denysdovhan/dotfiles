eval "$(/usr/local/bin/brew shellenv)"

# Askpass script based on security
export PATH="$PATH:${DOTFILES:-$HOME/.dotfiles}/bin"
export SUDO_ASKPASS="askpass"

# Added by Toolbox App
export PATH="$PATH:/usr/local/bin"
