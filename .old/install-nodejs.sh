#!/bin/bash

NAME="Denys Dovhan"
EMAIl="email@denysdovhan.com"
SITE="http://denysdovhan.com/"

echo "Installing nodejs..."
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs && echo "Done!"
echo "Configure `npm init`..."
npm set init.author.name "$NAME"
npm set init.author.email "$EMAIL"
npm set init.author.url "$SITE"