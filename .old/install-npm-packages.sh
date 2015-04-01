#!/bin/bash

PACKAGES="less grunt-cli coffee-script bower nodemon\
          express-generator hexo"

# Installing global packages
echo "Installing global packages..."
npm i -g $PACKAGES && echo "Done!"
