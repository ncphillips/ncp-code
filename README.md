# ncp-code 

This repo contains everything I need for editing code. It is currently 
made to make working with `ruby` and `typescript` quite pleasant. 

It consists of:

* zsh commands 
* vim configuration
* git config


## Getting Started

### Install

```ssh
cd ~

git clone git@github.com:ncphillips/ncp-code.git

sh ~/ncp-code/install
```

To use the Git Config, add the following to your `~/.git-config`:

```
[include]
  path = ~/ncp-code/gitconfig
```

### Update

```
cd ~/ncp-code
git pull
```

If changes were made to zshrc:

```zsh
$ source ~/.zshrc
```

If changes were made to the vimrc:

```vim
:source ~/.vimrc
```

## Zsh

* `o`: Search for a file to open in Vim.

## Vim

**Legend**

* `C` : The `Ctrl` key
* `Leader` : The `,` key.

### Buffers

<!-- TODO: Write about buffers and how they can be used. -->

* **Reload:** `:e` 
* **List:** `:ls`
* **Go To:** `:b <number>`
* **Next :** `<tab>`
* **Previous:** `<s-tab>`
* **Delete:** `<C-w>`

### Files

* **Rename File:** `,n`

### Navigating within Files

* **Page Forward:** `<C-f>`
* **Page Backward:** `<C-b>`
* **Half-Page Down:** `<C-d>`
* **Half-Page Up:** `<C-u>`

### File Browsing

* **Toggle NERDTree:** `<C-n>`
* **Help:** `?`
* **Open:** `<CR>`
* **Open in Tab:** `t`

<!-- NERDTree ScreenShot  -->

### Search

Quick Options

* **Search File:** `,o`
* **Fulltext Search:** `,f`

Commands

* Search by Filename: `:Ag`
* Fulltext Search Files: `:Files`
* Search Commmits: `:Commits`

<!-- Fulltext Search Gif -->
<!-- Filename Search Gif -->

### Code

* **Autocomplete:** `<C-x C-o>`
* **Rename Symbol:** `,e`
<!-- Autocomplete Gif for Ruby & Typescript  -->

#### Typescript

* **Go to def:** `<C-]>`
* **Go to use:** `<C-t>`
* **References:** `<C-^>`
* **Hint:** `,t`

<!-- Got to def/use gif -->

### Ruby

* **Add Parameter:** `,rap`
* **Convert Post Conditional:** `,rcpc`
* **Extract Method:** `,rem`
* **Extract Local Variable:** `,relv`
* **Convert Conditional:** `,cc`

#### Rails

* **Go to Model:** `:Emodel site`
* **Go to Controller:** `:Econtroller sites`
* **Go to Code/Tests:** `:A`

### Vim Plugin System

* **Install Plugin:** `PlugInstall [name ...]`
* **Update Plugin:** `PlugUpdate [name ...]`
* **Upgrade vim-plug:** `PlugUpgrade`

### Misc.

* **Show Invisible Characters (e.g. Tabs, EOL):** `,l`

## Plugins

* [vim-plug](https://github.com/junegunn/vim-plug): Plugin management
* [vim-sensible](https://github.com/tpope/vim-sensible): ???
* [vim-surround](https://github.com/tpope/vim-surround)
* [seoul256.vim](https://github.com/junegunn/seoul256.vim): A color scheme.
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter): Adds git diff (+/-) into the vim gutter.

* [nerdtree](https://github.com/scrooloose/nerdtree)
* [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin): Add git status to NERDTree browser.

* [vim-prettier](https://github.com/prettier/vim-prettier)

* [vim-ruby](https://github.com/vim-ruby/vim-ruby): Ruby dev support.  
* [vim-ruby-refactoring](https://github.com/ecomba/vim-ruby-refactoring): Ruby refactoring tools
* [vim-rails](https://github.com/tpope/vim-rails): Ruby on Rails power tools.

* [tsuquyomi](https://github.com/Quramy/tsuquyomi): Typescript development support.
* [vim-javascript](https://github.com/Quramy/vim-javascript): Javascript syntax highlighting
* [typescript-vim](https://github.com/leafgarland/typescript-vim): Typescript syntax highlighting
* [vim-styled-components](https://vimawesome.com/plugin/vim-styled-components-hard-things)

* [fzf](https://github.com/junegunn/fzf)
* [fzf-vim](https://github.com/junegunn/fzf-vim)
* [ack.vim](https://github.com/mileszs/ack.vim')


## Potential Plugins 

I don't want to overload myself with too much information
so this is a list of plugins that I might add later.

* [fugitive-vim](https://vimawesome.com/plugin/fugitive-vim)
* [commentary.vim](https://vimawesome.com/plugin/commentary-vim)
* [vim-graphql](https://vimawesome.com/plugin/vim-graphql)
* [dispatch.vim](https://vimawesome.com/plugin/vim-dispatch)
