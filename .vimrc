"""""""""""""""""""""""""""""""
" Vundle - package management
" To install: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Install new plugins:  vim +PluginInstall +qall (from shell) or :PluginInstall (inside vim)
"
" Required for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                " Package management
Plugin 'tpope/vim-sensible'                  " Sensible defaults
Plugin 'tpope/vim-fugitive'                  " Git awesomeness
Plugin 'airblade/vim-gitgutter'              " Git changes in gutter
Plugin 'scrooloose/syntastic'                " Syntax checker
Plugin 'ctrlpvim/ctrlp.vim'                  " Sublime-style fuzzy file searching
Plugin 'tpope/vim-vinegar'                   " Make netrw better
Plugin 'Raimondi/delimitMate'                " Auto-completion of quotes, parens, etc
Plugin 'ConradIrwin/vim-bracketed-paste'     " Make pasting not be horrible
Plugin 'qpkorr/vim-bufkill'                  " Kill buffers without killing their containing windows
Plugin 'christoomey/vim-tmux-navigator'      " vim + tmux split hotkeys
Plugin 'tmux-plugins/vim-tmux-focus-events'  " restore broken focus events for vim inside tmux

" I need to get better with these
Plugin 'scrooloose/nerdcommenter'         " Comment insertion
Plugin 'rking/ag.vim'                     " Silver searcher inside vim
Plugin 'tpope/vim-surround'               " Surround text
Plugin 'tpope/vim-repeat'                 " Repeat plugin maps, useful with vim-surround

" Syntax highlighting
Plugin 'JulesWang/css.vim'                " CSS syntax file
Plugin 'genoma/vim-less' 						" Less syntax highlighting

" Airline stuff
Plugin 'vim-airline/vim-airline'          " Status bar
Plugin 'vim-airline/vim-airline-themes'   " Status bar themes
Plugin 'edkolev/tmuxline.vim'             " tmux status line generator
Plugin 'bling/vim-bufferline'             " Visualization of open buffers

" TODO
"Plugin 'vim-scripts/YankRing.vim'         " Yank management
"Plugin 'scrooloose/nerdtree'              " File explorer

call vundle#end()


"""""""""""""""""""""""""""""""
" Brian's personal stuff
set ts=3
set shiftwidth=3
set t_Co=256
set encoding=utf8
set number                 " show line numbers
set hidden                 " Allow multiple buffers to be edited at once
set noshowmode             " Hide status on the status line
syntax on                  " Turn on syntax highlighting
let php_minlines=1000       " Prevent vim from forgetting that we're in a php file

" Color preferences - use this with Gnome terminal color scheme 'Tango'
colorscheme default
highlight IncSearch ctermbg=Black ctermfg=Yellow
highlight Search ctermbg=Yellow ctermfg=Black

let php_minlines=500       " Prevent vim from forgetting that we're in a php file

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Search stuff
set ignorecase             " Lowercase searches aren't case-sensitive
set smartcase              " Searches with capital letters are case-sensitive

" Enable enhanced command-line completion
set wildchar=<Tab> wildmenu wildmode=full

" Vim's default split positions are bizarre
set splitbelow
set splitright


"""""""""""""""""""""""""""""""
" Remappings

" Switch between buffers easily
map :bs :b#

" Buffer list
nnoremap <leader>l :ls<cr>

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

" Sensible.vim
runtime! plugin/sensible.vim
set scrolloff=8            " Start scrolling when we're 8 lines away from margins

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
let g:syntastic_enable_highlighting = 0

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
set laststatus=1
set showtabline=0

" Airline + Bufferline
let g:bufferline_echo = 0
autocmd VimEnter *
 \ let &statusline='%{bufferline#refresh_status()}'
	\ .bufferline#get_status_string()
let g:airline#extensions#tabline#fnamecollapse = 0

" Airline + Tmuxline
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = 'powerline'

"""""""""""""""""""""""""""""""
" File-specific

" Open Pentaho (PRPT) files with zip.vim
autocmd BufReadCmd *.prpt call zip#Browse(expand("<amatch>"))


"""""""""""""""""""""""""""""""
" HARDCORE -- disable arrow keys in insert mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


"""""""""""""""""""""""""""""""
" NOTES/TODO:
" - Ctrl+L to clear search (sensible.vim)
" - :vsplit #2 to split with buffer 2 in the new pane
" - Visual select, then <leader>c<space> to do comment toggling (nerdcommenter)
" - :Ag to search
" - * to search for the word containing the cursor
" - TODO: figure out how to use CtrlP for buffer searching

" Old configs, replaced by sensible.vim -- revisit these?
" set nofoldenable           " Folding is aggravating
