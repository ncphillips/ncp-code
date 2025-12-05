# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a dotfiles repository for zsh and git configuration.

## Installation

```bash
cd ~
git clone git@github.com:ncphillips/ncp-code.git
~/ncp-code/bin/install
```

The install script checks for dependencies (fd, ag, fzf) and sets up ~/.zshrc and ~/.gitconfig.

## Repository Structure

- `bin/install` - Installation script
- `zshrc` - Shell aliases and functions (sourced by ~/.zshrc)
- `gitconfig` - Git aliases (included by ~/.gitconfig)
- `githelpers` - Helper scripts for pretty git log/branch formatting

## Key Components

### Shell Functions (zshrc)
- `o` - Fuzzy find and open file
- `f` - Full-text search and open result
- `note` - Quick note-taking workflow (saves to ~/notes with git)

### Git Aliases (gitconfig)
- `git l` / `git la` - Pretty formatted log
- `git b` - Pretty formatted branch list
- `git shred` - Delete all local branches except master
- `git shove` - Push current branch and set upstream
