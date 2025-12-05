# ncp-code

Dotfiles for zsh and git configuration.

It consists of:

* zsh commands
* git config


## Getting Started

### Install

```bash
cd ~
git clone git@github.com:ncphillips/ncp-code.git
~/ncp-code/bin/install
```

The install script will:
- Check for and optionally install dependencies (fd, ag, fzf)
- Set up ~/.zshrc and ~/.gitconfig

### Update

```
cd ~/ncp-code
git pull
```

If changes were made to zshrc:

```zsh
source ~/.zshrc
```

## Zsh

* `o`: Fuzzy find and open file
* `f`: Full-text search and open result
* `note`: Quick note-taking (saves to ~/notes with git)

## Git Aliases

* `git l` / `git la`: Pretty formatted log
* `git b`: Pretty formatted branch list
* `git shred`: Delete all local branches except master
* `git shove`: Push current branch and set upstream
