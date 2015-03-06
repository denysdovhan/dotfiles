#!/bin/bash

spacerapp="$HOME/.local/share/applications/spacer.desktop"

case "$1" in
    add)
        if [ ! -f $spacerapp ]
        then
            echo "Spacer app not found."
            echo "Copying blank.png to $HOME/.icons/"

            mkdir -p "$HOME/.icons/"
            cp "./blank.png" "$HOME/.icons/"


            echo "Creating spacer.desktop file"
            cat <<EOF > $spacerapp
[Desktop Entry]
Version=1.0
Type=Application
Name=Spacer
Exec=nothing
Icon=$HOME/.icons/blank.png
NoDisplay=true
EOF
        fi

        UUID=$(cat /proc/sys/kernel/random/uuid)
        spacerDockItem="$HOME/.config/plank/dock1/launchers/spacer-$UUID.dockitem"

        cat <<EOF > $spacerDockItem
[PlankItemsDockItemPreferences]
Launcher=file://$HOME/.local/share/applications/spacer.desktop
EOF

        echo "New spacer dock item created with name \"$spacerDockItem\""
        ;;
esac

