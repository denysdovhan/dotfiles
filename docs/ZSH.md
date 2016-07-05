# Zsh

You may put your custom settings into `~/.bash_extra`.

## Default settings

* All settings are stored in `.zshrc`.
* [“Oh My ZSH!”](http://ohmyz.sh/) is already built–in.
* [Vim](http://www.vim.org/) is default editor.
* Custom Zsh theme [“Spaceship”](https://github.com/denysdovhan/spaceship-zsh-theme) with git status, nvm, venv and other.
* Aliases may to be sudo’ed.
* `rm` avoid stupidity. Аutomatically `-I` instead of `-i`, because it less intrusive than -i, while still giving protection against most mistakes.
* And many other.

## Projects tree

I suggest you to organize your project tree as follows:

```
Projects
├── _Forks          - here must be your forks
├── _Playground     - your playground for trying something
└── _Repo           - your repositories
```


## Aliases

Aliases are the most important in dotfiles which can make your work fast and enjoyable. See code in `zsh/aliases.zsh`.

### Easiest navigation

* **`..`** → `cd ..`
* **`...`** → `cd ../..`
* **`....`** → `cd ../../..`
* **`.....`** → `cd ../../../..`
* **`~`** → `cd ~`
* **`-`** → `cd -`

More aliases in [oh-my-zsh Cheatsheet](https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet#commands).

### Folders shortcuts

* **`dr`** → `cd ~/Dropbox`
* **`dl`** → `cd ~/Downloads`
* **`dt`** → `cd ~/Desktop`
* **`pj`** → `cd ~/Projects`
* **`pjr`** → `cd ~/Projects/_Repos`
* **`pjf`** → `cd ~/Projects/_Forks`
* **`pl`** → `cd ~/Projects/_Playground/`

### Commands Shortcuts

* **`e`** → `$EDITOR`
* **`+x`** → `chmod +x`
* **`x+`** → `chmod +x`
* **`ll`** → `ls -alF`
* **`la`** → `ls -A`
* **`l`** → `ls -CF`

### Open

* **`open <FILE>`** — Open file from terminal.
* **`o <FILE>`** — Open file from terminal.
* **`oo`** — Open current folder.

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

* **`update`** — Get Ubuntu Updates, and update npm and its installed packages.
* **`alert`** — Throw alert notify message. Add an `alert` alias for long running commands. Use like so: `sleep 10; alert`.
* **`myip`** — My public IP address.
* **`mylocalip`** — My local IP address.
* **`password`** — Generate random password, copies it into clipboard and outputs it to terminal.
* **`path`** — Show $PATH in readable view.
* **`dotfiles`** — Update dotfiles.
* **`getpage`** — Download web page with all assets.
* **`get`** — Download file with original filename.
* **`battery`** — Battery status (**Linux** only).

## Plugins

As default installed these plugins: `git node npm nvm sudo web-search`. These plugins add a lot of useful thing. Here are my favorites:

* **`npmg`** → `npm -g`
* **`npmS`** → `npm i --save`
* **`npmD`** → `npm i --save-dev`
* **`node-docs [SECTION]`** — Open the node api, for your current version, in your browser.


* **`google [SEARCH_QUERY]`** — Search for `[SEARCH_QUERY]` on **Google**.
* **`bing [SEARCH_QUERY]`** — Search for `[SEARCH_QUERY]` on **Bing**.
* **`yahoo [SEARCH_QUERY]`** — Search for `[SEARCH_QUERY]` on **Yahoo**.
* **`duckduckgo [SEARCH_QUERY]`** — Search for `[SEARCH_QUERY]` on **DuckDuckGo**.


* Tab `ESC` twice — Puts sudo in front of the current command, or the last one if the command line is empty.

## Bin

Some functions that will make your life easier. See code in [`bin/`](../bin/).

* **`gz <FILE>`** — Get gzipped file size.
* **`n <PROGRAM>`** — Runs given command using binary in node_modules/.bin of the current project.
* **`server [PORT]`** — Start an HTTP server from a directory, optionally specifying the port (default: 8000).
* **`extract <FILE>`** — Extract archives of various types. Supports types: `tar.bz2`, `tar.gz`, `tar.xz`, `tar`, `tbz2`, `tgz`, `bz2`, `rar`, `gz`, `zi.
`, `Z`.
* **`zsh_stats`** — Get zsh usage stats.
* **`git-changelog`** — Generate changelog based on git commits.
* **`git-fork <original-author>`** — Add remote upstream.
* **`git-upstream [branch]`** — Sync branch with upstream.
* **`osx-shadow [-r|--rm] <original.png> [result.png]`** — Add (or remove) OSX-like shadow to image.
* **`nyan`** — Print nyan cat.
