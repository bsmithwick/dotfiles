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
Plugin 'Raimondi/delimitMate'                       " Auto-completion of parens, brackets, etc
Plugin 'ConradIrwin/vim-bracketed-paste'            " Make pasting not be horrible
Plugin 'majutsushi/tagbar'                          " Explore file with ctags
Plugin 'ludovicchabant/vim-gutentags'               " Generate ctags files
Plugin 'https://github.com/mhinz/vim-startify.git'  " Fancy start screen
Plugin 'terryma/vim-multiple-cursors'               " Sublime-style multiple cursors (Ctrl+n)
Plugin 'benmills/vimux'                             " Send tmux commands from vim
Plugin 'ryanoasis/vim-devicons'                     " Fancy icons
Plugin 'JamshedVesuna/vim-markdown-preview'         " Preview markdown files
Plugin 'chrisbra/csv.vim'                           " Visualize CSVs
Plugin 'tpope/vim-eunuch'                           " Shell command sugar
Plugin 'francoiscabrol/ranger.vim'                  " Ranger file browser
Plugin 'Valloric/YouCompleteMe'                     " Code completion

" Colors and themes
Plugin 'flazz/vim-colorschemes'                     " Color schemes
Plugin 'Jonathanfilip/vim-lucius'

" Syntax highlighting
Plugin 'ap/vim-css-color'                           " Preview css colors
"Plugin 'genoma/vim-less'
"Plugin 'mxw/vim-jsx'                               " for React
"Plugin 'pangloss/vim-javascript'
"Plugin 'elzr/vim-json'
"Plugin 'stanangeloff/php.vim'

" Buffer management
Plugin 'qpkorr/vim-bufkill'                         " Kill buffers without killing their containing windows
Plugin 'https://github.com/vim-scripts/ZoomWin.git' " Zoom buffer to full screen with <C-w>o

" FZF and friends
Plugin 'junegunn/fzf.vim'                           " Better fuzzy finder
Plugin 'pbogut/fzf-mru.vim'                         " Search MRUs with FZF

" Git stuff
Plugin 'airblade/vim-gitgutter'                     " Git changes in gutter
Plugin 'tpope/vim-fugitive'                         " Git awesomeness

" Airline stuff
Plugin 'vim-airline/vim-airline'                    " Status bar
Plugin 'vim-airline/vim-airline-themes'             " Status bar themes
Plugin 'edkolev/promptline.vim'                     " Bash shell prompt

" Tmux stuff
Plugin 'edkolev/tmuxline.vim'                       " tmux status line generator
Plugin 'christoomey/vim-tmux-navigator'             " vim + tmux split hotkeys
Plugin 'tmux-plugins/vim-tmux-focus-events'         " restore broken focus events for vim inside tmux

" I need to get better with these
Plugin 'tpope/vim-commentary'                       " Type 'gc' to comment a line or block

" TODO
"Plugin 'scrooloose/nerdtree'                       " File explorer
"Plugin 'vim-scripts/YankRing.vim'                  " Yank management
"Plugin 'tpope/vim-surround'                        " Surround text
"Plugin 'tpope/vim-repeat'                          " Repeat plugin maps, useful with vim-surround
"Plugin 'tpope/vim-rsi'                              " Readline key bindings

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
colorscheme jellyx
highlight IncSearch ctermbg=Black ctermfg=Yellow
highlight Search ctermbg=Yellow ctermfg=Black

"""""""""""""""""""""""""""""""
" Remappings

" Switch between buffers easily
map :bs :b#

" Buffer list (s like tmux session list)
nnoremap <leader>s :ls<cr>

" Clear search with carriage return
nnoremap <CR> :noh<CR><CR>

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

" Fugitive
set statusline=%{fugitive#statusline()}

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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_section_y = ''                        " Don't show fileencoding/fileformat
let g:airline#extensions#gutentags#enabled = 1
let g:airline_theme='jellybeans'
" let g:airline_theme='powerlineish'
" let g:airline_theme = 'serene'
"let g:airline_theme = 'simple'

" Airline + Tmuxline
let g:tmuxline_preset = 'powerline'
let g:tmuxline_theme = 'airline'

" Promptline
let g:promptline_preset = {
        \'a' : [ promptline#slices#host() ],
        \'b' : [ promptline#slices#cwd() ],
        \'z' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#battery() ]}
let g:promptline_theme = 'airline'

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Vimux
map <leader>x :VimuxPromptCommand<CR>
map <leader>X :VimuxRunLastCommand<CR>

" Devicons
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete

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
nnoremap <C-m> :FZFMru<Cr>
nnoremap <C-b> :Buffers<Cr>
nnoremap <C-g> :BCommits<Cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'               " Use AG by default, so we respect .gitignore etc
let g:fzf_layout = { 'down': '~40%' }               " Bigger search results list

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
