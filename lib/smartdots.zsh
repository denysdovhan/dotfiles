#!/usr/bin/env bash

# Quick change directories
# Expands .... -> ../../../
#
# Author: Nick Morozov, nickmorozov.com
# License: MIT
# https://github.com/nickmorozov/dotfiles

smartdots() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N smartdots
bindkey . smartdots
