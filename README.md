# Denys Dovhan’s dotfiles

<p align="center">
  <img alt="Spaceship with Hyper and One Dark" src="https://user-images.githubusercontent.com/10276208/36086434-5de52ace-0ff2-11e8-8299-c67f9ab4e9bd.gif" width="980px">
</p>

There are tons of useful things in here:

- The usefulness of [“Oh My ZSH!”](http://ohmyz.sh/) is already built–in.
- [🚀⭐️ Spaceships ZSH](https://github.com/denysdovhan/spaceship-prompt) as a prompt.
- 🐟 [Fish](https://fishshell.com/)-like autosuggestions.
- Syntax highlighting of commands while they are typed.
- Automatically closing and deleting of quotes and brackets when you type them.
- Browser-like substring search for history.
- [🌺 zplug](https://zplug.sh) for dependency management.
- Useful [aliases](./lib/aliases.zsh).
- Git config, global `.gitignore` file and aliases.
- Dotfiles synchronization (`sync.py`) with backup.
- Restoring old dotfiles (`restore.py`) from backup.
- A lot of [useful bins](https://github.com/denysdovhan/dotfiles/tree/master/bin).
- `update` script for updating dotfiles, npm, brew, gems, etc.

Missing feature? 🍴 Fork this repo and make it better!

## Installation

Dotfiles are installed by running one of the following commands in your terminal, just copy one of the following commands and execute in the terminal:

**via `curl`**

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/dotfiles/master/installer.sh)"
```

**via `wget`**

```sh
bash -c "$(wget https://raw.githubusercontent.com/denysdovhan/dotfiles/master/installer.sh -O -)"
```

Tell Git who you are using these commands:

```
git config -f ~/.gitlocal user.email "email@yoursite.com"
git config -f ~/.gitlocal user.name "Name Lastname"
```

## Updating

Use single command to get latest updates:

```
update
```

This command will update dotfiles, their dependencies, `brew` or `apt-get` packages, global `npm` dependencies, `gem`s, `apm` plugins.

## Under the hood

> **Note:** You may put your custom settings into `~/.zshlocal`.

### Projects tree

I suggest you to organize project folder as follows:

```
~/Projects
├── Forks       # for GitHub fork
├── Job         # for job projects
├── Playground  # for short-term experiments
└── Repos       # for long-term projects
```

### Aliases

Aliases are gonna make your work fast and enjoyable. See code in `$DOTFILES/lib/aliases.zsh`. Here is what's included:

- Aliases from Oh-My-Zsh. See [Oh-My-Zsh Cheatsheet](https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet#commands) for more.
- Easier navigation
  - **`..`** → `cd ..`
  - **`...`** → `cd ../..`
  - **`....`** → `cd ../../..`
  - **`.....`** → `cd ../../../..`
  - **`~`** → `cd ~`
  - **`-`** → `cd -`
- Folders shortcuts
  - **`dr`** → `cd ~/Dropbox`
  - **`dl`** → `cd ~/Downloads`
  - **`dt`** → `cd ~/Desktop`
  - **`pj`** → `cd ~/Projects`
  - **`pjr`** → `cd ~/Projects/_Repos`
  - **`pjf`** → `cd ~/Projects/_Forks`
  - **`pl`** → `cd ~/Projects/_Playground/`
- Commands Shortcuts
  - **`e`** → `$EDITOR`
  - **`+x`** → `chmod +x`
  - **`x+`** → `chmod +x`
  - **`ll`** → `ls -alF`
  - **`la`** → `ls -A`
  - **`l`** → `ls -CF`
- Open
  - **`open <FILE>`** — open file from terminal.
  - **`o <FILE>`** — open file from terminal.
  - **`oo`** — open current folder.
- Color conversion
  - **`hex2hsl <[#]dead00> [alpha]`** - convert #hex color to HSL/HSLA. `#dead00` → `hsl(47,99%,44%)`.
  - **`hex2rgb <[#]dead00> [alpha]`** - convert #hex color to RGB/RGBA. `#dead00` → `rgb(222,173,0)`.
- Misc
  - **`update`** — get updates (Runs `$DOTFILES/scripts/update.zsh`).
  - **`dotfiles`** — jump quickly into dotfiles folder.
  - **`myip`** — my local IP address.
  - **`password`** — generate random password, copies it into clipboard and outputs it to terminal.
  - **`path`** — print $PATH in readable view.
  - **`getpage`** — download web page with all assets.
  - **`get`** — download file with original filename.

### Oh-My-Zsh plugins

These OMZ plugins are included:

- [`git`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git) — git aliases and functions.
- [`npm`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/npm) — provides completion as well as adding many useful aliases.
- [`yarn`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/yarn) — the same as for `npm`, but for `yarn`
- [`nvm`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/nvm) — auto-sourcing `nvm`.
- [`sudo`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/sudo) — `[Esc] [Esc]` to re-run previous command with sudo.
- [`extract`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/extract) — defines a function called `extract` that extracts the archive file you pass it, and it supports a wide variety of archive filetypes.
- [`ssh-agent`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/ssh-agent) — automatically starts ssh-agent to set up and load whichever credentials you want for ssh connections.
- [`gpg-agent`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/gpg-agent) — enables `gpg-agent` if it is not running.

### Bin

Dotfiles also include some functions that will make your life easier. See code in [`bin/`](./bin).

- `color.js` — HTML color converter.
- `emptytrash` — empty the Trash on all mounted volumes and the main HDD.
- `git-changelog` — generate changelog based on commit history.
- `git-cleanup` — removes old Git branches and does other cleanup.
- `git-fork` — add remote upsteam.
- `git-upstream` — sync branch with upstream.
- `gz` — get gzipped file size
- `n` — runs given command using binary in `node_modules/.bin` of the current project.
- `nyan` — print [nyan cat](https://www.youtube.com/watch?v=QH2-TGUlwu4).
- `osx-shadow` — add macOS-like shadow to an image.
- `server` — start an HTTP server from a directory.

### Git

> **Note:** Add your git user data and custom settings to `~/.gitlocal`.

#### Configuration

- UI color is `auto`.
- Diff colors are:
  - `white bold` for meta information;
  - `cyan bold` for frag;
  - `red bold` for old lines;
  - `green bold` for new lines.
- Default editor is [Vim](http://www.vim.org/) instead of [Vi](http://www.tutorialspoint.com/unix/unix-vi-editor.htm).
- `push.default` set as `current`.
- Automatic replacement `git://github.com/`, `gh:`, `github:` addresses as `git@github.com:` for GitHub.
- Automatic replacement `git://gist.github.com/`, `gst:`, `gist:` addresses as `git@gist.github.com:` for Gists.
- User custom settings gets from a `~/.gitlocal` file.

#### Git Aliases

- **`git a`** → `git add` — patch mode for specified files.
- **`git ua`** → `git reset HEAD` — unstage files.
- **`git b`** → `git branch` — list, create, or delete branches.
- **`git c`** → `git commit` — record changes to the repository.
- **`git co`** → `git checkout` — checkout a branch or paths to the working tree.
- **`git ap`** → `git add -p` — add file contents to the index.
- **`git ca`** → `git commit -a` — commit with automatically stage files that have been modified and deleted.
- **`git cm`** → `git commit -m` — commit with commit message.
- **`git cam`** → `git commit -am` — add all files and commit with message.
- **`git s`** → `git status -sb` — short status with current branch.
- **`git master`** — go to `master` branch and pull from remote.
- **`git develop`** — go to `develop` branch and pull from remote.
- **`git git`** — do not complain about `git git`.
- **`git l`** — commits log with pretty single line format.
- **`git ll`** — log with list of changed files for each commit.
- **`git ignore`** — ignore files: append file to `.gitignore`.
- **`git this`** — initialize, add all files and commit.
- **`git amend`** — amend last commit.
- **`git redo`** — amend last commit with its original message.
- **`git undo`** → `reset --mixed HEAD^` — reset index changes, but not the working tree.
- **`git discard`** → `checkout --` — discard changes.
- **`git contrib`** — list of contributors and how many commits each person has.
- **`git today`** — see how many lines of code you have written today.
- **`git stat`** — how many lines of code in repo.
- **`git-changelog [-l,--list,-t,--tag] <FILE>`** — generate changelog based on commit history.
- **`git-cleanup [--force]`** — removes old Git branches.
- **`git-fork <original-author>`** — add remote upstream.
- **`git-upstream [branch]`** — sync branch with upstream (as default `master`).

## Bash

If you wanna stand on `bash` version of dotfiles, please execute following commands inside the `~/.dotfiles` folder:

```sh
git checkout bash
./sync.py
```

I do not support `bash` version anymore, so if you need fixes or new features, please send me a pull request into `bash` branch. Thank you!

## Resources

Resources that I used to make these dotfiles better:

- [GitHub ❤ ~/](http://dotfiles.github.com/)
- [Artem Sapegin’s dotfiles](https://github.com/sapegin/dotfiles)
- [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Yet another cool story about bash prompt](http://habrahabr.ru/company/mailru/blog/145008/)

## License

MIT © [Denys Dovhan](https://denysdovhan.com)
