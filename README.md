# Denys Dovhan’s dotfiles

This is my dotfiles for anything that supports Zsh.

![Terminal App](./preview.png)

# Installation

If you want to install my dotfiles on your machine, just copy this command and execute in the terminal:

```sh
wget -O - https://raw.githubusercontent.com/denysdovhan/dotfiles/master/installer.sh | sh
```

You can tell Git who you are using these commands:

```
git config -f ~/.gitlocal user.email "email@yoursite.com"
git config -f ~/.gitlocal user.name "Name Lastname"
```

# Features

* [“Oh My ZSH!”](http://ohmyz.sh/) is already built–in.
* Colorful and clever Zsh prompt, useful aliases, [etc](./docs/ZSH.md).
* [Fish](https://fishshell.com/)-like autosuggestions.
* Syntax highlighting of commands while they are typed.
* Automatically closing and deleting of quotes and brackets when you type them.
* Autocompletion for your gulp, npm scripts.
* Custom Zsh theme [“Spaceship”](https://github.com/denysdovhan/spaceship-zsh-theme) with git status, nvm, rvm venv and other.
* Cool Zsh [aliases](./docs/ZSH.md).
* Managing dependencies through fast [zgen](https://github.com/tarjoilija/zgen#automatically-check-for-filechanges-and-regenerate-zinit). You don't need to type `zgen reset` every time after changing `zshrc.zsh` or `zshlocal.zsh` — dotfiles will do it for you, automatically.
* Git config, global ignore file and aliases.
* Atom settings [syncronization](https://github.com/denysdovhan/dotfiles/tree/master/setup/atom.sh).
* Dotfiles synchronization (`sync.py`) with backup.
* Restoring old dotfiles (`restore.py`) from backup.
* A lot of [useful scripts](https://github.com/denysdovhan/dotfiles/tree/master/bin).
* Color conversion script: convert #HEX to RGB/RGBA and HSL/HSLA.
* Dotfiles, System, Gems and NPM update script.
* And to many [other](./docs/ZSH.md).

# Notes

* You can use any file extensions in `tilde/` to invoke proper syntax highlighting in code editor.
* Add your zsh customization to `~/.zshlocal`.
* Add your git user data and custom settings to `~/.gitlocal`.
* Fork this repo and make it better!

# Docs

For more informations see [docs](./docs):

* [ZSH docs](./docs/ZSH.md).
* [GIT docs](./docs/GIT.md).

# Bash

If you wanna stand on bash version of dotfiles, please execute following commands inside the `~/Dotfiles` folder:

```sh
git checkout bash
./sync.py
```

I do not support `bash` version anymore, so if you need fixes or new features, please send me a pull request into `bash` branch. Thank you!

# Resources

Resources that I used in my dotfiles:

* [GitHub ❤ ~/](http://dotfiles.github.com/)
* [Artem Sapegin’s dotfiles](https://github.com/sapegin/dotfiles)
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Yet another cool story about bash prompt](http://habrahabr.ru/company/mailru/blog/145008/)

---

Be kitten :smiley_cat: .
