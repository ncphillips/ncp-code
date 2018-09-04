filetype on




"""""""""""
" PLUGINS "
"""""""""""
call plug#begin('~/.vim/plugged')

" Defaults
Plug 'tpope/vim-sensible'

" Status Bar
Plug 'vim-airline/vim-airline'

" Colors
Plug 'junegunn/seoul256.vim'

" Code Formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Javascript/Typescript
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ecomba/vim-ruby-refactoring'

" File Browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git
Plug 'airblade/vim-gitgutter'

" Search
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

call plug#end()

""""""""""
" Search "
""""""""""
let g:ackprg = 'ag --vimgrep'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

:nnoremap <C-P> :Files!<cr>
:nnoremap <C-F> :Ag!<cr>

set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


"""""""""""
" EDITING "
"""""""""""

" Enable mouse
set mouse=a

" Show Line Numbers
set nu

" Leader Key
:let mapleader = ","

" Tab Defaults
set noexpandtab
set ts=2
set sts=2
set sw=2

" ruby-vim suggestions
set nocompatible
syntax on 
filetype indent on
filetype plugin on






""""""""""
" COLORS "
""""""""""

" light blues
hi xmlTagName guifg=#59ACE5
hi xmlTag guifg=#59ACE5

" dark blues
hi xmlEndTag guifg=#2974a1



"""""""""""
" AIRLINE "
"""""""""""
let g:airline#extensions#tabline#enabled = 1


"""""""""""""""""""
" LAST CURSOR POS "
"""""""""""""""""""
"
" Jump to last cursor position unless it's invalid or in an event loop
"
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif



""""""""
" CODE "
""""""""

" Rename Symbol ,e
autocmd FileType ruby vnoremap <leader>e :RRenameLocalVariable<cr>
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript.jsx nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)

" Extract Variable ,v
autocmd FileType ruby vnoremap <leader>v :RExtractLocalVariable<cr>

" Extract Constant ,c
autocmd FileType ruby vnoremap <leader>c  :RExtractConstant<cr>

" Extract Method ,m
autocmd FileType ruby noremap <leader>m  :RExtractMethod<cr>

" Extract Function ,f

""""""""""""""
" TYPESCRIPT "
""""""""""""""

" Set .(j)sx filetypes as typescript.jsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

autocmd FileType typescript.jsx nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
map <C-t-d> :TsuTypeDefinition<CR>

""""""""
" RUBY "
""""""""

" Convert Condition ,cc
autocmd FileType ruby nnoremap <leader>cc :RConvertPostConditional<cr>


""""""""""""
" PRETTIER "
""""""""""""
"
" Run Prettier before saving
" ...when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0

" other options: TextChanged,InsertLeave 
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx, PrettierAsync






""""""""""""
" NERDTree "
""""""""""""
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif





"""""""""""""""""""
" Tab Preferences "
"""""""""""""""""""

" Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Customisations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType json setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType typescript.jsx setlocal ts=2 sts=2 sw=2 noexpandtab

autocmd FileType ruby setlocal ts=4 sts=4 sw=4 noexpandtab

autocmd FileType markdown setlocal ts=2 sts=2 sw=2 noexpandtab

autocmd FileType sh setlocal ts=4 sts=4 sw=4 noexpandtab

" Treat .rss files as XML
autocmd BufNewFile,BufRead *.rss setfiletype xml




"""""""""""""""""""
" TAB TO COMPLETE "
"""""""""""""""""""
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-x>\<c-o>"
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>





"""""""""""""""""""""""
" RENAME CURRENT FILE "
"""""""""""""""""""""""
function! RenameFile()
	let old_name = expand('%')
	let new_name = input('New file name: ', expand('%'))
	if new_name != '' && new_name != old_name
		exec ':saveas ' . new_name
		exec ':silent !rm ' .old_name
		exec redraw!
	endif
endfunction
map <Leader>n :call RenameFile()<cr>


""""""""""""""
" Quick Save "
""""""""""""""
map <Leader>w :w<cr>
map <Leader>q :q<cr>
map <Leader>wq :wq<cr>
