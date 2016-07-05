# Git

My dotfiles already has beautiful Git configuration, powerful aliases and optimal global gitignore. You may put your custom settings into `~/.gitlocal`.

## Setup

You can tell it who you are using these commands:

```
git config -f ~/.gitlocal user.email "email@yoursite.com"
git config -f ~/.gitlocal user.name "Name Lastname"
```

## Configuration

Default configuration in `.gitconfig`:

* UI color is `auto`.
* Diff colors it is:
  * `white bold` for meta information;
  * `cyan bold` for frag;
  * `red bold` for old lines;
  * `green bold` for new lines.
* Default editor is [Vim](http://www.vim.org/) instead of [Vi](http://www.tutorialspoint.com/unix/unix-vi-editor.htm).
* `push.default` set as `current`.
* Automatic replacement `git://github.com/`, `gh:`, `github:` addresses as `git@github.com:` for GitHub.
* Automatic replacement `git://gist.github.com/`, `gst:`, `gist:` addresses as `git@gist.github.com:` for Gists.
* User custom settings gets from a `~/.gitlocal` file.

## Aliases

* **`git a`** → `git add` — Patch mode for specified files.
* **`git ua`** → `git reset HEAD` — Unstage files.
* **`git ap`** → `git add -p` — Add file contents to the index.
* **`git b`** → `git branch` — List, create, or delete branches.
* **`git c`** → `git commit` — Record changes to the repository.
* **`git co`** → `git checkout` — Checkout a branch or paths to the working tree.
* **`git ca`** → `git commit -a` — Commit with automatically stage files that have been modified and deleted.
* **`git cm`** → `git commit -m` — Commit with commit message.
* **`git cam`** → `git commit -am` — Add all files and commit with message.
* **`undo`** → `reset --mixed HEAD^` — Reset index changes, but not the working tree.
* **`git s`** → `git status -sb` — Short status with current branch. Status codes can be interpreted as follows:
  * `M` = modified
  * `A` = added
  * `D` = deleted
  * `R` = renamed
  * `C` = copied
  * `U` = updated but unmerged
  * `??` = untracked paths
* **`git master`** — Go to master branch and pull from remote.
* **`git l`** — Commits log with pretty single line format.
* **`git ll`** — Log with list of changed files for each commit.
* **`git ignore`** — Ignore files: append file to .gitignore.
* **`git this`** — Initialize, add all files and commit.
* **`git amend`** — Ammend last commit.
* **`git redo`** — Ammend last commit with its original message.
* **`git contrib`** — List of contributors and how many commits each person has.
* **`git today`** — See how many lines of code you have written today.
* **`git stat`** — How many lines of code in repo.
* **`gr`** — Jump to root folder of Git repo.
* **`git-fork <original-author>`** — Add remote upstream.
* **[`git-upstreamer`](http://git.io/github-upstreamer)** — Auto configure a remote for a fork.
* **`git-upstream [branch]`** — Sync branch with upstream (as default `master`).
