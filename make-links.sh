#!/bin/bash

# Remove older folders
rm -r ~/Documents
rm -r ~/Downloads
rm -r ~/Music
rm -r ~/Videos
rm -r ~/Pictures

# Make links from /windows/ 
ln -s /windows/Documents ~/Documents
ln -s /windows/Downloads ~/Downloads
ln -s /windows/Dropbox ~/Dropbox
ln -s /windows/Music ~/Music
ln -s /windows/Videos ~/Videos
ln -s /windows/Pictures ~/Pictures

# Custom links
ln -s ~/Dropbox/Projects ~/Projects

