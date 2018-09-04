filetype on




"""""""""""
" PLUGINS "
"""""""""""
call plug#begin('~/.vim/plugged')

" ## Defaults
Plug 'tpope/vim-sensible'

" ## Colors
Plug 'junegunn/seoul256.vim'

" ## Code Formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" ## Javascript/Typescript
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" ## Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ecomba/vim-ruby-refactoring'

" ## File Browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" ## Git
Plug 'airblade/vim-gitgutter'

call plug#end()





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







""""""""""""""
" TYPESCRIPT "
""""""""""""""
"
" Set .(j)sx filetypes as typescript.jsx
"
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)

autocmd FileType typescript.jsx nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript.jsx nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
map <C-t-d> :TsuTypeDefinition<CR>




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
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'






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

autocmd FileType ruby setlocal ts=2 sts=2 sw=2 noexpandtab

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
