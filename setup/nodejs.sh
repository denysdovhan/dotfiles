#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Install node.js from nodesource.com
echo "Installing nodejs..."
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs && echo "Done!"
echo

# Configure npm
# Ask required parameters
echo "Configure npm init..."
echo -n "What is your name? (Denys Dovhan): " && read NAME
echo -n "What is your email? (email@denysdovhan.com): " && read EMAIL
echo -n "What is your website? (http://denysdovhan.com/): " && read SITE

# If required parameters dont entered, set them default values
: ${NAME:="Denys Dovhan"}
: ${EMAIL:="email@denysdovhan.com"}
: ${SITE:="http://denysdovhan.com/"}

echo "Author name put as: $NAME"
npm set init.author.name "$NAME"
echo "Author email put as: $EMAIL"
npm set init.author.email "$EMAIL"
echo "Author website put as: $SITE"
npm set init.author.url "$SITE"
echo

# List of packages that must be installed globally
PACKAGES="
    less grunt-cli coffee-script bower nodemon express-generator hexo yo
    generator-email stylus nib wifi-password gulp stylint"

# Installing global packages
echo "Will be installed these packages:"
echo $PACKAGES

echo "Installing global packages..."
sudo npm i -g $PACKAGES && echo "Done!"
