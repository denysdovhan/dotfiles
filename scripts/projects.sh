#!/usr/bin/env bash

if [ "$(uname)" != "Darwin" ]; then
  echo "Skipping Projects scaffolding on non-MacOS platform"
  exit 0
fi

mkdir -p ~/Projects/Repos
mkdir -p ~/Projects/Forks
mkdir -p ~/Projects/Job
mkdir -p ~/Projects/Playground
