#!/bin/sh

# WP-CLI Installer (wp-cli.org)
# This script will download wp-cli script and put it to /usr/local/bin/wp

# Ask for the administrator password upfront
sudo -v

# Download script and save as ./wp
curl -k https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o ./wp

# Add execute permissions
chmod +x wp

# Move script into /usr/local/bin/wp
sudo mv wp /usr/local/bin/wp && echo "Done!" || echo "Filed!"
