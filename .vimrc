" Brian's personal stuff
set ts=3
set shiftwidth=3
set number "show line numbers

" Forget being compatible with good ol' vi
set nocompatible

" Apparently this is good security
set modelines=0

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

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion.
set wildmenu

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

" %?  Really?
nnoremap <tab> %
vnoremap <tab> %

" why bother hitting shift all the time?
nnoremap ; :

" LEADER KEY STUFF
" stupid \ key is hard to hit
let mapleader = ","

"Clear search with , + space
nnoremap <leader><space> :nohlsearch<cr> 

"Start scrolling when we're 8 lines away from margins
set scrolloff=8

"Fugitive statusline
set statusline=%{fugitive#statusline()}

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
