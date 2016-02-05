# Denys Dovhan’s dotfiles

This is my dotfiles for Ubuntu or something else that supports Bash, like Mac, Elementary OS and etc.

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
* Custom Zsh theme [“Spaceship”](https://github.com/denysdovhan/spaceship-zsh-theme) with git status, nvm, venv and other.
* Cool Zsh [aliases](./docs/ZSH.md).
* Git config, global ignore file and aliases.
* Atom settings [syncronization](https://github.com/denysdovhan/dotfiles/tree/master/setup/atom.sh).
* Dotfiles syncronization (`sync.py`) with backup.
* Restoring old dotfiles (`restore.py`) from backup.
* A lot of [useful scripts](https://github.com/denysdovhan/dotfiles/tree/master/bin).
* Color conversion script: convert #HEX to RGB/RGBA and HSL/HSLA.
* Dotfiles, System, Gems and NPM update script.
* And to many [other](./docs/BASH.md).

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
