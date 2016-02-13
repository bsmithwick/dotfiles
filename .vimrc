"""""""""""""""""""""""""""""""
" Vundle - package management

" Required for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'             " Package management
Plugin 'tpope/vim-fugitive'               " Git awesomeness
Plugin 'ctrlpvim/ctrlp.vim'               " Sublime-style fuzzy file searching
Plugin 'bling/vim-airline'                " Status bar
Plugin 'bling/vim-bufferline'             " Visualization of open buffers
Plugin 'scrooloose/nerdtree'              " File explorer
Plugin 'scrooloose/syntastic'             " Syntax checker
Plugin 'ervandew/supertab'                " Tab-completion inside command mode
Plugin 'godlygeek/tabular'                " Required for vim-markdown
Plugin 'plasticboy/vim-markdown'          " Markdown support
Plugin 'pangloss/vim-javascript'          " Better JS support
Plugin 'groenewege/vim-less'              " LESS support
Plugin 'mustache/vim-mustache-handlebars' " Mustache/handlebars support
Plugin 'flazz/vim-colorschemes'           " Color schemes

" Not really hooked up yet...
"Plugin 'elzr/vim-json'                    " JSON support
"Plugin 'vim-scripts/YankRing.vim'         " Yank management
"Plugin 'ryanoasis/vim-devicons'           " Font icons - this would be fun one day
"Plugin 'diepm/vim-rest-console'           " REST console - I should try this sometime
"Plugin 'christoomey/vim-tmux-navigator'   " tmux friend

call vundle#end()

filetype on
filetype plugin indent on


"""""""""""""""""""""""""""""""
" Brian's personal stuff
colorscheme desert

set ts=3
set shiftwidth=3
set number                 " show line numbers
set hidden                 " Why is this not a default
set modelines=0            " Apparently this is good security
set lazyredraw             " Don't update the display while executing macros
set fo-=ro                 " Assuming the next line is also a comment hurts more than it helps
set noshowmode             " Powerline will show us what mode we're in
set nofoldenable           " Folding is aggravating
set autoread               " Set to auto read when a file is changed from the outside
set scrolloff=8            " Start scrolling when we're 8 lines away from margins
set t_Co=256               " Use 256 colors
syntax on                  " Turn on that syntax highlighting

let php_minlines=500       " Prevent vim from forgetting that we're in a php file

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Search stuff
set incsearch              " Find the next match as we type the search
set showmatch              " Show matches as we type
set hlsearch               " Hilight searches by default
set ignorecase             " Lowercase searches aren't case-sensitive
set smartcase              " Searches with capital letters are case-sensitive

" Enable enhanced command-line completion
set wildchar=<Tab> wildmenu wildmode=full

" Vim's default split positions are bizarre
set splitbelow
set splitright


"""""""""""""""""""""""""""""""
" Remappings

" %?  Really?
nnoremap <tab> %
vnoremap <tab> %

" why bother hitting shift all the time?
nnoremap ; :

" Switch between buffers easily
map :bs :b#

" stupid \ key is hard to hit
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" NERDtree - f for 'file'
nnoremap <leader>f :NERDTreeToggle<cr>

" Clear search with , + space
nnoremap <leader><space> :nohlsearch<cr>


"""""""""""""""""""""""""""""""
" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


"""""""""""""""""""""""""""""""
" Plugin-specific

" Fugitive
set statusline=%{fugitive#statusline()}

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"""""""""""""""""""""""""""""""
" File-specific

" Open Pentaho (PRPT) files with zip.vim
au BufReadCmd *.prpt call zip#Browse(expand("<amatch>"))


"""""""""""""""""""""""""""""""
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

