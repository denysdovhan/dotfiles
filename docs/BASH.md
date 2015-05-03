# Bash

My Dotfiles have a too many powerful tools such as: colorful Bash prompt, useful aliases, highlighting repository's Git status and current virtual environment.

You may put your custom settings into `~/.bash_extra`.

## Default settings

* All settings moved in `.bash_profile`.
* If bash isn't running interactively, it doesn't do anything.
* `/opt/lampp`, `/opt/lampp/bin`, `~/Dotfiles/bin` included into `PATH`.
* Bash doesn't put duplicate lines in the history.
* If possible, add tab completion for many more commands.
* Included bash completions for the `wp` command by [WP-CLI](http://wp-cli.org/).
* ~~Included bash completions for [Grunt](http://gruntjs.com/).~~
* Added tab completion for SSH hostnames based on `~/.ssh/config`.
* [Nano](http://www.nano-editor.org/) is default editor.
* `grep` and `ls` is already colorful.
* If you're `root`, your name highlighted in red.
* If the current directory is a Git repository, current branch will be highlighting:
  * `+` - uncommitted changes in the index;
  * `!` - unstaged changes;
  * `?` - untracked files;
  * `$` - stashed files.
* Аutomatically add new line if cursor position are not in first column.
* Aliases may to be sudo’ed.
* `rm` avoid stupidity. Аutomatically `-I` instead of `-i`, because it less intrusive than -i, while still giving protection against most mistakes.
* And many other.

## Projects tree

I suggest you to organize your project tree as follows:

```
Projects
├── _Forks          - here must be your forks
├── _Playground     - your playground for trying something
├── _Repo           - your repositories
└── _Sites          - your sites or web-projects
```


## Aliases

Aliases are the most important in dotfiles that can make your work fast and enjoyable. See code in `tilde/bash_aliases.bash`.

### Easiest navigation

* **`..`** → `cd ..`
* **`...`** → `cd ../..`
* **`....`** → `cd ../../..`
* **`.....`** → `cd ../../../..`
* **`~`** → `cd ~`
* **`-`** → `cd -`

### Folders shortcuts

* **`dr`** → `cd ~/Dropbox`
* **`dl`** → `cd ~/Downloads`
* **`dt`** → `cd ~/Desktop`
* **`pj`** → `cd ~/Projects`
* **`pjr`** → `cd ~/Projects/_Repos`
* **`pjf`** → `cd ~/Projects/_Forks`
* **`pjs`** → `cd ~/Projects/_Sites`
* **`pl`** → `cd ~/Projects/_Playground/`

### Commands Shortcuts

* **`e`** → `nano`
* **`+x`** → `chmod +x`
* **`x+`** → `chmod +x`
* **`ll`** → `ls -alF`
* **`la`** → `ls -A`
* **`l`** → `ls -CF`

### Clipboard tools

* **`xcopy`** → `xclip -selection clipboard`
* **`xpaste`** → `xclip -selection clipboard -o`

### Color conversion

* **`hex2hsl <[#]dead00> [alpha]`** - Convert #hex color to HSL/HSLA. `#dead00` → `hsl(47,99%,44%)`.
* **`hex2rgb <[#]dead00> [alpha]`** - Convert #hex color to RGB/RGBA. `#dead00` → `rgb(222,173,0)`.

### Virtual Environment

* **`venv`** - Activate virtual environment.
* **`venv-stop`** - Deactivate virtual environment.
* **`venv-init`** → `venv-init3`
* **`venv-init2`** - Initialize virtual environment with Python 2.
* **`venv-init3`** - Initialize virtual environment with Python 3.

### Django
* **`djm`** → `python manage.py`
* **`djs`** → `python manage.py runserver`
* **`djm3`** → `python3 manage.py`
* **`djs3`** → `python3 manage.py runserver`

### Misc

* **`update`** - Get Ubuntu Updates, and update npm and its installed packages.
* **`alert`** - Throw alert notify message. Add an `alert` alias for long running commands. Use like so: `sleep 10; alert`.
* **`password`** - Generate random password, copies it into clipboard and outputs it to terminal.
* **`path`** - Show $PATH in readable view.
* **`dotfiles`** - Update dotfiles.
* **`getpage`** - Download web page with all assets.

## Functions

Some functions that will make your life easier. See code in `tilde/bash_functions.bash`.

* **`header <TEXT>`** - Print cyan underlined header.
* **`error <TEXT>`** - Print red underlined error.
* **`open <FILE>`** - Open file from terminal.
* **`f <FILE>`** - Find shorthand.
* **`gz <FILE>`** - Get gzipped file size.
* **`extract <FILE>`** - Extract archives of various types. Supports types: `tar.bz2`, `tar.gz`, `tar.xz`, `tar`, `tbz2`, `tgz`, `bz2`, `rar`, `gz`, `zi.
`, `Z`.
* **`git-fork <original-author>`** - Add remote upsteam.
* **`git-upstream [branch]`** - Sync branch with upstream.
* **`nyan`** - Print nyan cat.
