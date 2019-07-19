"""""""""""""""""""""""""""""""
" New Stuff
"  - Space as leader (with hinting)
"  - choose pane with =
"  - switch buffers with Tab / Shift+Tab
"  - :only to focus on one tab
"  - Ctrl+R for paste buffer list in insert mode
"
"""""""""""""""""""""""""""""""
" Vundle - package management
" To install: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Install new plugins:  vim +PluginInstall +qall (from shell) or :PluginInstall (inside vim)
" Update new plugins: :PluginUpdate (inside vim)
"
" Required for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                       " Package management
Plugin 'tpope/vim-sensible'                         " Sensible defaults
Plugin 'scrooloose/syntastic'                       " Syntax checker
" Plugin 'wookiehangover/jshint.vim'                " JS syntax checker - temporarily disabled because such stupidness was happening in JS files
Plugin 'tpope/vim-vinegar'                          " Make netrw better
"Plugin 'Raimondi/delimitMate'                       " Auto-completion of parens, brackets, etc - I want to love this but I...don't
Plugin 'ConradIrwin/vim-bracketed-paste'            " Make pasting not be horrible
Plugin 'https://github.com/mhinz/vim-startify.git'  " Fancy start screen
Plugin 'terryma/vim-multiple-cursors'               " Sublime-style multiple cursors (Ctrl+n)
Plugin 'benmills/vimux'                             " Send tmux commands from vim
Plugin 'ryanoasis/vim-devicons'                     " Fancy icons
Plugin 'JamshedVesuna/vim-markdown-preview'         " Preview markdown files
Plugin 'chrisbra/csv.vim'                           " Visualize CSVs
Plugin 'tpope/vim-eunuch'                           " Shell command sugar
Plugin 'francoiscabrol/ranger.vim'                  " Ranger file browser
Plugin 'easymotion/vim-easymotion'                  " Navigate words easily (leader-leader-w / leader-leader-b)
Plugin 'jeffkreeftmeijer/vim-numbertoggle'          " Relative numbers when needed
Plugin 'junegunn/vim-peekaboo'                      " See what's in copy registers
Plugin 'liuchengxu/vim-which-key'                   " Hint leader key commands

Plugin 'Shougo/deoplete.nvim'								 " Code completion
Plugin 'roxma/nvim-yarp'                            " required for deoplete + vim8
Plugin 'roxma/vim-hug-neovim-rpc'                   " required for deoplete + vim8

" Colors and themes
Plugin 'flazz/vim-colorschemes'                     " Color schemes

" Code stuff
Plugin 'ap/vim-css-color'                           " Preview css colors
"Plugin 'genoma/vim-less'
Plugin 'pangloss/vim-javascript'
"Plugin 'elzr/vim-json'
"Plugin 'stanangeloff/php.vim'
Plugin 'janko/vim-test'

" Buffer management
Plugin 'qpkorr/vim-bufkill'                         " Kill buffers without killing their containing windows
Plugin 't9md/vim-choosewin'

" FZF and friends
Plugin 'junegunn/fzf.vim'                           " Better fuzzy finder
Plugin 'pbogut/fzf-mru.vim'                         " Search MRUs with FZF

" Git stuff
Plugin 'airblade/vim-gitgutter'                     " Git changes in gutter
Plugin 'tpope/vim-fugitive'                         " Git awesomeness

" Airline stuff
Plugin 'vim-airline/vim-airline'                    " Status bar
Plugin 'vim-airline/vim-airline-themes'             " Status bar themes

" Tmux stuff
Plugin 'edkolev/tmuxline.vim'                       " tmux status line generator
Plugin 'christoomey/vim-tmux-navigator'             " vim + tmux split hotkeys
Plugin 'tmux-plugins/vim-tmux-focus-events'         " restore broken focus events for vim inside tmux

" I need to get better with these
Plugin 'tpope/vim-commentary'                       " Type 'gc' to comment a line or block

" TODO
"Plugin 'janko-m/vim-test'                          " Run tests
"Plugin 'vim-scripts/YankRing.vim'                  " Yank management
Plugin 'edkolev/promptline.vim'                     " Bash shell prompt
Plugin 'tpope/vim-surround'                        " Surround text
"Plugin 'tpope/vim-repeat'                          " Repeat plugin maps, useful with vim-surround
"Plugin 'tpope/vim-rsi'                             " Readline key bindings

call vundle#end()


"""""""""""""""""""""""""""""""
" Brian's personal stuff
set ts=3
set shiftwidth=3
set t_Co=256
set encoding=utf8
set number                                          " show line numbers
set hidden                                          " Allow multiple buffers to be edited at once
set noshowmode                                      " Hide status on the status line
syntax on                                           " Turn on syntax highlighting
let php_minlines=5000                               " Prevent vim from forgetting that we're in a php file
set wildchar=<Tab> wildmenu wildmode=full           " Enable enhanced command-line completion

let mapleader="\<Space>"                            " leader is spacebar

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Search stuff
set ignorecase                                      " Lowercase searches aren't case-sensitive
set smartcase                                       " Searches with capital letters are case-sensitive

" Vim's default split positions are bizarre
set splitbelow
set splitright

" Color preferences
set termguicolors
"colorscheme jellybeans
"colorscheme srcery
"colorscheme hybrid
colorscheme jellyx
highlight IncSearch ctermbg=Black ctermfg=Yellow
highlight Search ctermbg=Yellow ctermfg=Black

" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

"""""""""""""""""""""""""""""""
" Remappings

" Switch between buffers easily
map :bs :b#

" Buffer list (s like tmux session list)
nnoremap <leader>s :ls<cr>

" Yank list
nnoremap <leader>r :reg<cr>

" Clear search with space + carriage return
nnoremap <cr> :noh<cr><cr>

" Don't put pasted-over text into our copy buffer
xnoremap <silent> p p:let @"=@0<CR>

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
set scrolloff=8                                     " Start scrolling when we're 8 lines away from margins

" Vinegar
let g:netrw_fastbrowse = 0                          " Don't leave directory buffers hanging around

" Fugitive
set statusline=%{fugitive#statusline()}

" Which-key (leader hints)
set timeoutlen=500
let g:which_key_map = {}
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
" customize example @TODO see https://github.com/liuchengxu/vim-which-key#example
"let g:which_key_map.w = {
"      \ 'name' : '+windows' ,
"      \ 'w' : ['<C-W>w'     , 'other-window']          ,
"      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
"      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
"      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
"      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
"      \ 'h' : ['<C-W>h'     , 'window-left']           ,
"      \ 'j' : ['<C-W>j'     , 'window-below']          ,
"      \ 'l' : ['<C-W>l'     , 'window-right']          ,
"      \ 'k' : ['<C-W>k'     , 'window-up']             ,
"      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
"      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
"      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
"      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
"      \ '=' : ['<C-W>='     , 'balance-window']        ,
"      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
"      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
"      \ '?' : ['Windows'    , 'fzf-window']            ,
"      \ }
"let g:which_key_map.f = { 'name' : '+file' }
"let g:which_key_map.f.s = ['update', 'save-file']

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Choosewin
" invoke with '='
nmap = <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" vim-test
nnoremap <leader>t :TestFile<cr>


" GitGutter
set updatetime=250
" Clean up git gutter column background color
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" DelimitMate
let delimitMate_matchpairs = "(:),[:],{:},<:>"

" vim-startify
let g:startify_custom_header = ''                   " Disable fortune-teller cow

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_javascript_checkers = ['eslint']

" Airline
set laststatus=1
set showtabline=0                                   " Disable native vim tabline in favor of airline's tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline_skip_empty_sections = 1
let g:airline_section_y = ''                        " Don't show fileencoding/fileformat
let g:airline_theme='jellybeans'
"let g:airline_theme='powerlineish'
"let g:airline_theme = 'serene'
"let g:airline_theme = 'simple'

" Airline + Tmuxline
let g:airline#extensions#tabline#enabled = 1        " Inherit from airline theme
let g:tmuxline_preset = 'powerline'

" Vimux
map <leader>x :VimuxPromptCommand<CR>
map <leader>X :VimuxRunLastCommand<CR>

" Devicons
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete

" vim-numbertoggle
set number relativenumber

" Markdown preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" FZF
" Custom function to search from git root
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
" Replace Ctrl-P with FZF - use 'ProjectFiles' instead of 'Files' to use our custom function above
nnoremap <C-p> :ProjectFiles<Cr>
nnoremap <C-t> :FZFMru<Cr>
nnoremap <C-b> :Buffers<Cr>
nnoremap <C-g> :BCommits<Cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'               " Use AG by default, so we respect .gitignore etc
let g:fzf_layout = { 'down': '~40%' }               " Bigger search results list

" Buffer navigation
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" NERDTree
"map <C-o> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""
" FILE-SPECIFIC

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
" - * to search for the word containing the cursor
