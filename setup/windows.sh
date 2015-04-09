#!/bin/bash

# /windows folders syncronization.
# Makes symlinks for all folders in /windows to /home:
#   /windows/* will by available as ~/*

# For all folders in /windows, exclude system folders:
#   System Volume Information - storage location for System Restore points
#   $RECYCLE.BIN              - this is a Windows 8 Trash
#   Recycler                  - this is a Windows XP Trash
for folder in /windows/[!System\ Volume\ Information,\$RECYCLE.BIN,Recycler]*; do

  # Get only folders basename, without path to them
  folder=`basename $folder`

  # Make avaliable --force-yes and -f params.
  # With this, folders that already exists will be removed without notice
  if [[ $1 == '-f' ]] || [[ $1 == '--force-yes' ]]; then
    [ -d ~/$folder ] && rm -rf ~/$folder
    ln -s /windows/$folder ~/$folder && echo "Done!" || echo "Failed!"
    continue
  fi

  # Commands that will be execute when script has called without params
  while true; do
    echo -n "Do you want to make link for $folder in /home? [Y/n]: "
    read CONFIRM

    case $CONFIRM in
      y|Y|YES|yes|Yes )
        # When folder exists, then ask user if he want to remove this.
        if [[ -d ~/$1 ]]; then
          while true; do
            echo -n "Do you want to remove ~/$folder? [Y/n]: "
            read CONFIRM

            case $CONFIRM in
              y|Y|YES|yes|Yes )
                rm -r ~/$folder
                ln -s /windows/$folder ~/$folder && echo "Done!" || echo "Failed!"
                break
                ;;
              n|N|NO|no|No )
                # If user don't want, just continue
                continue
                ;;
            esac

          done
        fi
        break
        ;;
      n|N|NO|no|No )
        break
        ;;
    esac
  done
done
