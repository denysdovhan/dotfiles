#!/usr/bin/env bash

URL=https://github.com/tmux-plugins/tpm.git
REPO="$HOME/.tmux/plugins/tpm"

if [ ! -d "$REPO" ]; then
    git clone "$URL" "$REPO"
else
    cd "$REPO" || exit
    git pull
fi
