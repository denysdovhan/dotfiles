#!/usr/bin/env bash

# Error reporter
error() {
  echo ; echo "${RED}${BOLD}${*}${RESET}" ; echo
}

if ! hash npm 2>/dev/null ; then
	error "NPM is not installed!"
	exit
fi

npm i -g trash-cli
npm i -g github-upstreamer
npm i -g greenkeeper
npm i -g npm-check-updates
npm i -g npm-name-cli
npm i -g speed-test