# Visual Studio Code Settings

To install VSCode extensions and setup settings synchronization run following command in terminal:

```
$DOTFILES/scripts/vscode.zsh
```

Or perform these steps manually:

## Enable synchronization

```
rm -rf ~/Library/Application\ Support/Code/User
ln -s ~/dotfiles/vscode/User ~/Library/Application\ Support/Code/User
```

## Install `code` in `PATH`

Run _Install `code` command in PATH_ from the command palette (**View** → **Command Palette**) to make Code available from the command line.
