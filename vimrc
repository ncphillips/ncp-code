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
Plug 'tpope/vim-commentary', {
  \ 'for': ['javascript', 'typescript', 'vue', 'ruby'] }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" Code
Plug 'tpope/vim-surround'
"Plug 'w0rp/ale'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Vue
Plug 'posva/vim-vue'

" Typescript
Plug 'Quramy/tsuquyomi', { 'for': ['typescript', 'typescript.jsx'] } 
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.jsx'] } 
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'typescript.jsx'] } 
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }

" File Browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Search
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

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
set expandtab
set ts=2
set sts=2
set sw=2

" ruby-vim suggestions
set nocompatible
syntax on 
filetype indent on
filetype plugin on

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59


" Copy/Past from System Clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p



"""""""""""
" BUFFERS "
"""""""""""
" These three functions are for tabbing between and closing buffers.
" If the current file has unsaved changes, those changes will be 
" saved before performing the action.

function! NextBuffer() 
  if &mod
    exec ':w'
  endif
  exec ':bn'
endfunction
nnoremap <tab> :call NextBuffer()<cr>

function! PrevBuffer() 
  if &mod
    exec ':w'
  endif
  exec ':bp'
endfunction
nnoremap <s-tab> :call PrevBuffer()<cr>

function! CloseBuffer() 
  if &mod
    exec ':w'
  endif

  exec ':bd'
endfunction
nnoremap <Leader>w :call CloseBuffer()<cr>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
  


""""""""""
" SEARCH "
""""""""""
let g:ackprg = 'ag --vimgrep'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

:nnoremap <leader>o :w \| Files<cr>
:nnoremap <leader>f :w \| Ag<cr>

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


""""""""""""""""""
" MISC KEYS MAPS "
""""""""""""""""""

imap <c-l> <space>=><space>


""""""""
" CODE "
""""""""

" Omnicomplete
let g:ale_completion_enabled = 1

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





""""""""
" RUST "
""""""""

" Run Binary
autocmd FileType rust nmap <Leader>run :w \| !cargo run<CR>

" Check Compilation
autocmd FileType rust nmap <Leader>check :w \| !cargo check<CR>

" Run Tests
autocmd FileType rust nmap <Leader>test :w \| !cargo test<CR>

" Racer – Autocomplete
let g:racer_cmd = "/Users/nolan/.cargo/bin/racer"
let g:racer_experimental_completer = 1





""""""""""""""
" TYPESCRIPT "
""""""""""""""

let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_completion_detail = 1

" Set .(j)sx filetypes as typescript.jsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

" Type Hint
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript.jsx nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" Type Definition
map <C-t-d> :TsuTypeDefinition<CR>







""""""""
" RUBY "
""""""""

" Convert Condition ,cc
autocmd FileType ruby nnoremap <leader>cc :RConvertPostConditional<cr>

" Autoclose
if !exists( "*CodeEndToken" )

  function CodeEndToken()
    let current_line = getline( '.' )
    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    let brackets_at_end = '[\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
      let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

      if match(current_line, brackets_at_end) >= 0
        return "\<CR>]\<C-O>O"
			elseif match(current_line, braces_at_end) >= 0
        return "\<CR>}\<C-O>O"
      elseif match(current_line, stuff_without_do) >= 0
        return "\<CR>end\<C-O>O"
      elseif match(current_line, with_do) >= 0
        return "\<CR>end\<C-O>O"
      else
        return "\<CR>"
      endif
    endfunction

endif

autocmd FileType ruby imap <buffer> <CR> <C-R>=CodeEndToken()<CR>



""""""""""""
" PRETTIER "
""""""""""""
"
" Run Prettier before saving
" ...when running at every change you may want to disable quickfix
let g:prettier#autoformat = 0



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

autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType typescript.jsx setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType sh setlocal ts=4 sts=4 sw=4 noexpandtab

" Treat .rss files as XML
autocmd BufNewFile,BufRead *.rss setfiletype xml




"""""""""""""""""""
" TAB TO COMPLETE "
"""""""""""""""""""
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '[a-zA-Z_:\.]'
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
	let new_name = input('New file name: ', expand('%'), 'file')
	if new_name != '' && new_name != old_name
		exec ':saveas ' . new_name
		exec ':silent !rm ' . old_name
    redraw!
	endif
endfunction
map <Leader>n :call RenameFile()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" CREATE NEW FILE                                   "
" Crates a new file relative to the current file.   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CreateFile() 
	let new_name = input('New file name: ', '', 'file')

	if new_name != '' 
    let path = getcwd()
    let new_file_path = path . "/" . new_name

    if filereadable(new_file_path)
      echo "File already exists"
    else
      exec ":e " . new_file_path
    endif
  endif

endfunction
nmap <Leader>cf :call CreateFile()<CR>
