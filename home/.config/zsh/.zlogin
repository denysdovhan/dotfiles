# .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
#
# .zlogin is for login shells.
#   It is sourced on the start of a login shell but after .zshrc, if the shell is also interactive.
#   This file is often used to start X using startx.
#   Some systems start X on boot, so this file is not always very useful.
