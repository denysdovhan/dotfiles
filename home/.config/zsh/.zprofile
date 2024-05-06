# .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
#
# .zprofile is for login shells.
#   It is basically the same as .zlogin except that it's sourced before .zshrc whereas .zlogin is sourced after .zshrc.
#   According to the zsh documentation, ".zprofile is meant as an alternative to .zlogin for ksh fans;
#   the two are not intended to be used together, although this could certainly be done if desired."

# Added by Homebrew
eval "$(/usr/local/bin/brew shellenv)"

# Added by The Fuck
eval $(thefuck --alias)
