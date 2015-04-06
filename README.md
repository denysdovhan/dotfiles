# Denys Dovhan’s dotfiles

This is my dotfiles for Ubuntu or something else that supports Bash, like Mac, Elementary OS, Linux Mint and etc.

# Installation

If you want to install my dotfiles on your machine, just copy this command and execute in the terminal:

```bash
git clone git@github.com:denysdovhan/dotfiles.git ~/Dotfiles && cd ~/Dotfiles && ./sync.py
```

# Updating

For updating dotfiles, just execute command bellow:

```
cd ~/Dotfiles && git pull && ./sync.py
```

# Notes

* You can use any file extensions in `tilde/` to invoke proper syntax highlighting in code editor.
* Add your Bash profile customization to `~/.bash_extra`
* Add your git user data and custom settings to `~/.gitlocal`
* Fort this repo and make it better!

# Features

* Colorful and clever Bash prompt, useful aliases, etc
* Git config, global ignore file and aliases
* Dotfiles syncronization (`sync.py`)
* Useful helpers (`helpers/`)

# Resources

Resources that I used in my dotfiles:

* [Artem Sapegin’s dotfiles](https://github.com/sapegin/dotfiles)
* [Yet another cool story about bash prompt](http://habrahabr.ru/company/mailru/blog/145008/)

---

Be kitten :smiley_cat: .
