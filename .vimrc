"""""""""""""""""""""""""""""""
" What I use
"
" Fugitive for package loading
" vim-airline for status bar
" vim-bufferline for visualization of open buffers
" ctrl-p for sublime-style fuzzy file searching
" NERDtree for file listing
" YankRing for yank management -- not really hooked up yet
" Supertab for tab-completion inside command mode
"
"
"""""""""""""""""""""""""""""""

" Brian's personal stuff
set ts=3
set shiftwidth=3
set number "show line numbers

" Forget being compatible with good ol' vi
set nocompatible

" Apparently this is good security
set modelines=0

" Fire up pathogen
call pathogen#infect()

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" Powerline will show us what mode we're in
set noshowmode

" Enable enhanced command-line completion.
set wildmenu

" Vim's default split positions are bizarre
set splitbelow
set splitright

" Folding is aggravating
" set nofoldenable

" Search strings with capitals are case-sensitive; lower-case searches aren't
set ignorecase
set smartcase

"Find the next match as we type the search
set incsearch

"Show matches as we type
set showmatch

"Hilight searches by default
set hlsearch

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Set to auto read when a file is changed from the outside
set autoread

" %?  Really?
nnoremap <tab> %
vnoremap <tab> %

" why bother hitting shift all the time?
nnoremap ; :

" Fire up CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'

" Switch between buffers easily
" TODO I want something like :bswitch or :bs

" LEADER KEY STUFF
" stupid \ key is hard to hit
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" NERDtree stuff
nnoremap <leader>nt :NERDTreeToggle<cr>
"autocmd VimEnter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd VimEnter * wincmd p

" Unite - disabled for now because I don't understand it
" let g:unite_source_history_yank_enable = 1
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <C-p> :Unite file_rec/async<cr>
" nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
" nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
" nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
" 
" " Custom mappings for the unite buffer
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
" " Play nice with supertab
" 	let b:SuperTabDisabled=1
" 	" Enable navigation with control-j and control-k in insert mode
" 	imap <buffer> <C-j>   <Plug>(unite_select_next_line)
" 	imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
" endfunction

"Clear search with , + space
nnoremap <leader><space> :nohlsearch<cr>

"Start scrolling when we're 8 lines away from margins
set scrolloff=8

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"Fugitive statusline
set statusline=%{fugitive#statusline()}

" Airline
let g:airline_powerline_fonts = 1
" Powerline
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" HARDCORE -- disable arrow keys in insert mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

