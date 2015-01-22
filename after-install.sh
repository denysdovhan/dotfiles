#!/bin/bash

# System upgrade
apt-get update
apt-get -y --force-yes dist-upgrade

# Repo's list
add-apt-repository -y ppa:tualatrix/ppa
add-apt-repository -y ppa:ricotz/docky
add-apt-repository -y ppa:numix/ppa
add-apt-repository -y ppa:nilarimogard/webupd8
add-apt-repository -y ppa:danielrichter2007/grub-customizer
add-apt-repository -y ppa:kazam-team/unstable-series
add-apt-repository -y ppa:atareao/atareao
add-apt-repository -y ppa:skype-wrapper/ppa
add-apt-repository -y ppa:rpeshkov/ppa
add-apt-repository -y ppa:noobslab/apps

# Add keys for repos
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com `apt-get update 2>&1 | grep -o '[0-9A-Z]\{16\}$' | xargs` 

# Update information about packages
apt-get update

# List of packages
PACKAGES="ubuntu-tweak dconf-tools unity-tweak-tool compizconfig-settings-manager\
          synaptic p7zip-rar p7zip-full unace unrar zip unzip sharutils rar\
          uudeview mpack arj cabextract file-roller plank numix-gtk-theme\
          numix-icon-theme-circle git gitk caffeine-plus grub-customizer\
          kazam python3-cairo python3-xlib my-weather-indicator skype sni-qt:i386\
          gtk2-engines-murrine:i386 gtk2-engines-pixbuf:i386 skype-wrapper\
          sni-qt curl"

# Install all packages from $PACKAGES
apt-get -y --force-yes install $PACKAGES

# Clean system
apt-get autoclean
apt-get autoremove
