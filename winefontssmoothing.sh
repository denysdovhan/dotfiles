#!/bin/sh
# Quick and dirty script for configuring wine font smoothing
#
# Author: Igor Tarasov <tarasov.igor@gmail.com>

WINE=${WINE:-wine}
WINEPREFIX=${WINEPREFIX:-$HOME/.wine}
DIALOG=whiptail

if [ ! -x "`which "$WINE"`" ]
then
    echo "Wine was not found. Is it really installed? ($WINE)"
    exit 1
fi

if [ ! -x "`which "$DIALOG"`" ]
then
    DIALOG=dialog
fi

TMPFILE=`mktemp` || exit 1

$DIALOG --menu \
    "Please select font smoothing mode for wine programs:" 13 51\
    4\
        1 "Smoothing disabled"\
        2 "Grayscale smoothing"\
        3 "Subpixel smoothing (ClearType) RGB"\
        4 "Subpixel smoothing (ClearType) BGR" 2> $TMPFILE

STATUS=$?
ANSWER=`cat $TMPFILE`

if [ $STATUS != 0 ]
then 
    rm -f $TMPFILE
    exit 1
fi

MODE=0 # 0 = disabled; 2 = enabled
TYPE=0 # 1 = regular;  2 = subpixel
ORIENTATION=1 # 0 = BGR; 1 = RGB

case $ANSWER in
    1) # disable
        ;;
    2) # enable
        MODE=2
        TYPE=1
        ;;
    3) # enable cleartype rgb
        MODE=2
        TYPE=2
        ;;
    4) # enable cleartype bgr
        MODE=2
        TYPE=2
        ORIENTATION=0
        ;;
    *)
        rm -f $TMPFILE
        echo Unexpected option: $ANSWER
        exit 1
        ;;
esac

echo "REGEDIT4

[HKEY_CURRENT_USER\Control Panel\Desktop]
\"FontSmoothing\"=\"$MODE\"
\"FontSmoothingOrientation\"=dword:0000000$ORIENTATION
\"FontSmoothingType\"=dword:0000000$TYPE
\"FontSmoothingGamma\"=dword:00000578" > $TMPFILE

echo -n "Updating configuration... "

$WINE regedit $TMPFILE 2> /dev/null

rm -f $TMPFILE

echo ok
