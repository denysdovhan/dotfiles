#!/bin/bash

killall google-chrome
echo "Wait few seconds..."
sudo sed -i 's/\/usr\/bin\/google-chrome-stable/google-chrome/g' /usr/share/applications/google-chrome.desktop && echo "Chrome fixed!"

mv ~/.config/google-chrome/ ~/.config/google-chrome-old/
echo "Please, open your Google Chrome and then close."
echo "You have a 30 sec:"

echo -ne '[##############################](30s)\r'
sleep 3
echo -ne '[###########################   ](27s)\r'
sleep 3
echo -ne '[########################      ](24s)\r'
sleep 3
echo -ne '[#####################         ](21s)\r'
sleep 3
echo -ne '[##################            ](18s)\r'
sleep 3
echo -ne '[###############               ](15s)\r'
sleep 3
echo -ne '[############                  ](12s)\r'
sleep 3
echo -ne '[#########                     ](9s)\r'
sleep 3
echo -ne '[######                        ](6s)\r'
sleep 3
echo -ne '[###                           ](3s)\r'
sleep 3
echo -ne '[                              ](0s)\r\n'

cp -r ~/.config/google-chrome-old/Default ~/.config/google-chrome
rm -r ~/.config/google-chrome-old/

echo "Done."