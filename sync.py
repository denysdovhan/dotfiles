#!/usr/bin/env python

"""
Dotfiles syncronization.
Makes symlinks for all files: ./home/.zshrc will by available as ~/.zshrc.
Based on: https://github.com/sapegin/dotfiles/blob/master/sync.py
"""

import os
import sys
import glob
import shutil

# Get first, second an third arguments
arg1 = sys.argv[1] if 1 < len(sys.argv) else None # Source
arg2 = sys.argv[2] if 2 < len(sys.argv) else None # Dest
arg3 = sys.argv[3] if 3 < len(sys.argv) else None # Backup

DOTFILES_DIR  = os.path.dirname(os.path.abspath(__file__))
SOURCE_DIR    = os.path.join(DOTFILES_DIR, arg1 or 'home')
DEST_DIR      = arg2 or os.path.expanduser('~')
BACKUP_DIR    = os.path.join(DOTFILES_DIR, arg3 or 'backup')
EXCLUDE       = []

# remove path
def forse_remove(path):
    if os.path.isdir(path) and not os.path.islink(path):
        shutil.rmtree(path, False)
    else:
        os.unlink(path)

# ckeck if is this a link to dest
def is_link_to(link, dest):
    is_link = os.path.islink(link)
    is_link = is_link and os.readlink(link).rstrip('/') == dest.rstrip('/')
    return is_link

# copy path to dest
def copy(path, dest):
    if os.path.isdir(path):
        shutil.copytree(path, dest)
    else:
        shutil.copy(path, dest)

def main():
    os.chdir(SOURCE_DIR)
    for filename in [file for file in os.listdir('.') if file not in EXCLUDE]:
        dotfile = os.path.join(DEST_DIR, filename)
        source = os.path.relpath(filename, os.path.dirname(dotfile))

        # check that we aren't overwriting anything
        if os.path.exists(dotfile):
            if is_link_to(dotfile, source):
                continue

            res = raw_input("Overwrite file `%s'? [y/N] " % dotfile)
            if not res.lower().startswith('y'):
                print "Skipping `%s'..." % dotfile
                continue
            else:
                # Made backup copy if we're overwriting this file
                res = raw_input("Make a backup of '%s'? [y/N] " % dotfile)
                if res.lower().startswith('y'):
                    if not os.path.exists(BACKUP_DIR):
                        os.mkdir(BACKUP_DIR)
                    backup = os.path.join(BACKUP_DIR, os.path.basename(dotfile))
                    copy(dotfile, backup)
                    print "Made a backup '%s'" % backup

            forse_remove(dotfile)

        os.symlink(source, dotfile)
        print "%s => %s" % (dotfile, source)

if __name__ == '__main__':
    main()
