#!/usr/bin/env bash

URL=https://github.com/tarjoilija/zgen.git
REPO="$HOME/.zgen"

if [ ! -d "$REPO" ]; then
    git clone "$URL" "$REPO"
else
    cd "$REPO" || exit
    git pull
fi
