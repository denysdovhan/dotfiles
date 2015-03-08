#!/bin/bash
# Restores file permissions for all files on a debian system for which .deb
# packages exist.
#
# Author: Larry Kagan <me at larrykagan dot com>
# Since 2007-02-20
ARCHIVE_DIR=/var/cache/apt/archives/
PACKAGES=`ls $ARCHIVE_DIR`
cd /
function changePerms()
{
CHOWN="/bin/chown"
CHMOD="/bin/chmod"
#PERMS=$1
PERMS=`echo $1 | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'`
PERMS=`echo ${PERMS:1}`
OWN=`echo $2 | /usr/bin/tr '/' '.'`
PATHNAME=$3
PATHNAME=`echo ${PATHNAME:1}`
echo -e "CHOWN: $CHOWN $OWN $PATHNAME"
result=`$CHOWN $OWN $PATHNAME`
if [ $? -ne 0 ]; then
echo -e $result
fi
echo -e "CHMOD: $CHMOD $PERMS $PATHNAME"
result=`$CHMOD $PERMS $PATHNAME`
if [ $? -ne 0 ]; then
echo -e $result
fi
}
for PACKAGE in $PACKAGES;
do
if [ -d $PACKAGE ]; then
continue;
fi
echo -e "Getting information for $PACKAGE\n"
FILES=`/usr/bin/dpkg -c "${ARCHIVE_DIR}${PACKAGE}"`
for FILE in "$FILES";
do
#FILE_DETAILS=`echo "$FILE" | awk '{print $1"\t"$2"\t"$6}'`
echo "$FILE" | awk '{print $1"\t"$2"\t"$6}' | while read line;
do
changePerms $line
done
#changePerms $FILE_DETAILS
done
done