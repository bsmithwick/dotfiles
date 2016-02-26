"""""""""""""""""""""""""""""""
" Vundle - package management
" To install:  vim +PluginInstall +qall (from shell) or :PluginInstall (inside vim)

" Required for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'             " Package management
Plugin 'tpope/vim-fugitive'               " Git awesomeness
Plugin 'airblade/vim-gitgutter'           " Git changes in gutter
Plugin 'ctrlpvim/ctrlp.vim'               " Sublime-style fuzzy file searching
Plugin 'vim-ctrlspace/vim-ctrlspace'      " Buffer manager, sort of like CtrlP
Plugin 'jlanzarotta/bufexplorer'          " Buffer explorer
Plugin 'scrooloose/nerdtree'              " File explorer
Plugin 'scrooloose/nerdcommenter'         " Comment insertion
Plugin 'Xuyuanp/nerdtree-git-plugin'      " Nerdtree git status flagging
Plugin 'scrooloose/syntastic'             " Syntax checker
Plugin 'ervandew/supertab'                " Tab-completion inside command mode
Plugin 'godlygeek/tabular'                " Required for vim-markdown
Plugin 'ryanoasis/vim-devicons'           " Fun icons!!
Plugin 'plasticboy/vim-markdown'          " Markdown support
Plugin 'pangloss/vim-javascript'          " Better JS support
Plugin 'groenewege/vim-less'              " LESS support
Plugin 'mustache/vim-mustache-handlebars' " Mustache/handlebars support

" Not really hooked up yet...
"Plugin 'vim-scripts/YankRing.vim'         " Yank management
"Plugin 'elzr/vim-json'                    " JSON support
"Plugin 'diepm/vim-rest-console'           " REST console - I should try this sometime

" Airline stuff
Plugin 'vim-airline/vim-airline'          " Status bar
Plugin 'vim-airline/vim-airline-themes'   " Status bar themes
Plugin 'bling/vim-bufferline'             " Visualization of open buffers
Plugin 'edkolev/tmuxline.vim'             " tmux status line generator

call vundle#end()

filetype on
filetype plugin indent on


"""""""""""""""""""""""""""""""
" Brian's personal stuff

set ts=3
set shiftwidth=3
set number                 " show line numbers
set hidden                 " Why is this not a default
set modelines=0            " Apparently this is good security
set lazyredraw             " Don't update the display while executing macros
set noshowmode
set fo-=ro                 " Assuming the next line is also a comment hurts more than it helps
set nofoldenable           " Folding is aggravating
set autoread               " Set to auto read when a file is changed from the outside
set scrolloff=8            " Start scrolling when we're 8 lines away from margins
set t_Co=256               " Use 256 colors
set encoding=utf8          " UTF-8
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
" let mapleader = ","

" Fast saving
nmap <leaded>w :w!<cr>

" NERDtree - 'f' for 'file'
nnoremap <leader>f :NERDTreeToggle<cr>
" and 'nt' in case I forget...
nnoremap <leader>nt :NERDTreeToggle<cr>

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
"
" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
set laststatus=2
set showtabline=2

" Airline + Bufferline
let g:bufferline_echo = 0
autocmd VimEnter *
 \ let &statusline='%{bufferline#refresh_status()}'
	\ .bufferline#get_status_string()

" Powerline - too complicated and so we stopped using it :(
" see: https://fedoramagazine.org/add-power-terminal-powerline/
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
" set showtabline=2
" set laststatus=2

" Fugitive
set statusline=%{fugitive#statusline()}

" GitGutter
set updatetime=250

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

