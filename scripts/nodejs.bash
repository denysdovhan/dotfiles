#!/usr/bin/env bash

# Function for pretty headers
function header() {
  echo
  echo -e "$(tput sgr 0 1)$(tput setaf 6)$1$(tput sgr0)"
}

# Install Node.js
header "Installing Node.js..."
if [[ "$(uname)" == 'Darwin' ]]; then
  brew install node
else
  curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

# Install nvm
header "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash

# Configure npm
# Ask required parameters
header "Configure npm init..."
echo "What is your name? (Denys Dovhan): " && read NAME
echo "What is your email? (email@denysdovhan.com): " && read EMAIL
echo "What is your website? (http://denysdovhan.com/): " && read SITE

# If required parameters dont entered, set them default values
: ${NAME:="Denys Dovhan"}
: ${EMAIL:="email@denysdovhan.com"}
: ${SITE:="http://denysdovhan.com/"}

echo "Author name set as: $NAME"
npm set init.author.name "$NAME"
echo "Author email set as: $EMAIL"
npm set init.author.email "$EMAIL"
echo "Author website set as: $SITE"
npm set init.author.url "$SITE"
echo

# Fixing npm permissions
header "Fixing npm permissions..."
NPM_PREFIX="$(npm config get prefix)"
if [[ "${NPM_PREFIX}" = '/usr/local' ]]; then
  sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}
elif [ ! "$NPM_PREFIX" = '/usr' ]; then
	[ ! -d ~/.npm-global ] && mkdir ~/.npm-global
	npm config set prefix '~/.npm-global'
fi
