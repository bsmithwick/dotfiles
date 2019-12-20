"""""""""""""""""""""""""""""""
" New Stuff To Learn
"  - Space as leader (with hinting)
"  - choose pane with =
"  - :only to focus on one tab
"  - Ctrl+R for paste buffer list in insert mode
"  - :! to execute shell command
"
"""""""""""""""""""""""""""""""
" vim-plug - package management
" To install: https://github.com/junegunn/vim-plug
" Install new plugins:  vim +PlugInstall (from shell) or :PlugInstall (inside vim)
" Update new plugins: :PlugUpdate
" Clean removed plugins: :PlugClean
"
" Required for plugin mgmt
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'                         " Sensible defaults
Plug 'tpope/vim-vinegar'                          " Make netrw better
Plug 'tpope/vim-eunuch'                           " Shell command sugar
Plug 'tpope/vim-surround'                         " Surround text
Plug 'tpope/vim-repeat'                           " Repeat surrounds and stuff
Plug 'ConradIrwin/vim-bracketed-paste'            " Make pasting not be horrible
Plug 'mhinz/vim-startify'                         " Fancy start screen
Plug 'jeffkreeftmeijer/vim-numbertoggle'          " Relative numbers when needed
"Plug 'Raimondi/delimitMate'                      " Auto-completion of parens, brackets, etc - I want to love this but I...don't
Plug 'junegunn/vim-peekaboo'                      " See what's in copy registers
Plug 'liuchengxu/vim-which-key'                   " Hint leader key commands
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " Code completion

" Colors and themes
Plug 'flazz/vim-colorschemes'                     " Color schemes

" Code stuff
Plug 'w0rp/ale'                                   " Syntax checking, etc
Plug 'ap/vim-css-color'                           " Preview css colors
Plug 'pangloss/vim-javascript'
Plug 'chrisbra/csv.vim'                           " Visualize CSVs
Plug 'tpope/vim-commentary'                       " Type 'gc' to comment a line or block

" Buffer management
Plug 'qpkorr/vim-bufkill'                         " Kill buffers without killing their containing windows (:BD)
Plug 't9md/vim-choosewin'

" FZF and friends
Plug 'junegunn/fzf.vim'                           " Better fuzzy finder
Plug 'pbogut/fzf-mru.vim'                         " Search MRUs with FZF

" Git stuff
Plug 'airblade/vim-gitgutter'                     " Git changes in gutter
Plug 'tpope/vim-fugitive'                         " Git awesomeness

" Airline stuff
Plug 'vim-airline/vim-airline'                    " Status bar
Plug 'vim-airline/vim-airline-themes'             " Status bar themes

" Tmux/shell stuff
Plug 'benmills/vimux'                             " Send tmux commands from vim
Plug 'edkolev/tmuxline.vim'                       " tmux status line generator
Plug 'christoomey/vim-tmux-navigator'             " vim + tmux split hotkeys
Plug 'tmux-plugins/vim-tmux-focus-events'         " restore broken focus events for vim inside tmux
"Plug 'edkolev/promptline.vim'                     " Bash shell prompt

" TODO
"Plug 'vim-scripts/YankRing.vim'                  " Yank management
"Plug 'tpope/vim-repeat'                          " Repeat plugin maps, useful with vim-surround
"Plug 'tpope/vim-rsi'                             " Readline key bindings

" always load last!
Plug 'ryanoasis/vim-devicons'                     " Fancy icons

call plug#end()


"""""""""""""""""""""""""""""""
" Brian's personal stuff
set ts=3
set shiftwidth=3
set encoding=utf8
set number                                          " show line numbers
set hidden                                          " Allow multiple buffers to be edited at once
set noshowmode                                      " Hide status on the status line
syntax on                                           " Turn on syntax highlighting
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
"colorscheme afterglow
colorscheme jellyx
highlight IncSearch ctermbg=Black ctermfg=Yellow
highlight Search ctermbg=Yellow ctermfg=Black

" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Share copy/paste with OS
set clipboard+=unnamedplus

"""""""""""""""""""""""""""""""
" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"""""""""""""""""""""""""""""""
" Remappings

" Buffer navigation
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Clear search term with Space+Enter
nnoremap <leader><CR> :nohlsearch<CR>

" Yank list
nnoremap <leader>r :reg<CR>

" Show linting details

" source vim config
nnoremap <leader>s :so ~/.vimrc<cr>

"""""""""""""""""""""""""""""""
" Plugin-specific

" Which-key (leader hints)
set timeoutlen=400
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
let g:which_key_map = {}
" customize example - see https://github.com/liuchengxu/vim-which-key#example
let g:which_key_map.a = 'ALE linting details'
let g:which_key_map.r = 'Registers'
let g:which_key_map.s = 'Source .vimrc'
let g:which_key_map['<CR>'] = 'Clear search'

" Sensible.vim
runtime! plugin/sensible.vim
set scrolloff=8                                     " Start scrolling when we're 8 lines away from margins

" Vinegar
let g:netrw_fastbrowse = 0                          " Don't leave directory buffers hanging around

" ALE
nnoremap <leader>a :ALEDetail<CR>
" fix files on save
let g:ale_fix_on_save = 1

" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000

" use nice symbols for errors and warnings
let g:ale_sign_error = '✗\ '
let g:ale_sign_warning = '⚠\ '

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" Fugitive
set statusline=%{fugitive#statusline()}

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Choosewin
" invoke with '='
nmap = <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

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

"""""""""""""""""""""""""""""""
" FILE-SPECIFIC

" Open Pentaho (PRPT) files with zip.vim
autocmd BufReadCmd *.prpt call zip#Browse(expand("<amatch>"))

" Prevent vim from forgetting that we're in a php file
let php_minlines=5000

"""""""""""""""""""""""""""""""
" HARDCORE -- disable arrow keys in insert mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
