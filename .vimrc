"""""""""""""""""""""""""""""""
" SEARCH USAGE
" - Ctrl+P : search project files
" - Ctrl+T : search most recently used files
" - Ctrl+C : search tags
" - Ctrl+B : search buffers

" NEW STUFF TO LEARN
"  - :only to focus on one tab
"  - s<char><char> (vim-sneak) for search
"  - Ctrl+R for paste buffer list in insert mode
"  - Ctrl+N for terminal
"  - :! to execute shell command
"  - Ctrl-F in / search mode to see search history
"
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

" General stuff
Plug 'tpope/vim-sensible'                         " Sensible defaults
Plug 'justinmk/vim-dirvish'                       " Replace netrw + vim-vinegar
Plug 'tpope/vim-eunuch'                           " Shell command sugar
Plug 'tpope/vim-surround'                         " Surround text
Plug 'tpope/vim-repeat'                           " Repeat surrounds and stuff
Plug 'mhinz/vim-startify'                         " Fancy start screen
Plug 'junegunn/vim-peekaboo'                      " See what's in copy registers
Plug 'liuchengxu/vim-which-key'                   " Hint leader key commands
Plug 'junegunn/vim-slash'                         " Better searching
Plug 'justinmk/vim-sneak'                         " Search with s<char><char>
Plug 'preservim/tagbar'                           " Ctags
Plug 'github/copilot.vim'                         " Github copilot
Plug 'vim-scripts/bufkill.vim'						  " Kill buffers

" Code completion etc
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " Syntax checking, etc - replaces ALE
" Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
Plug 'ap/vim-css-color'                           " Preview css colors
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'                       " Type 'gc' to comment a line or block
Plug 'godlygeek/tabular'                          " Align with :Tab /<whatever>
Plug 'kevinoid/vim-jsonc'                         " JSON w/ comments syntax checking

" Colors and themes
Plug 'flazz/vim-colorschemes'                     " Color schemes

" Buffer/window management
Plug 't9md/vim-choosewin'                         " Choose window with '='

" FZF and friends
Plug 'junegunn/fzf.vim'                           " Better fuzzy finder
Plug 'pbogut/fzf-mru.vim'                         " Search MRUs with FZF

" Git stuff
Plug 'airblade/vim-gitgutter'                     " Git changes in gutter
Plug 'tpope/vim-fugitive'                         " Git awesomeness
" Plug 'rhysd/git-messenger.vim'                    " Git history in popup - o/O for forward/back
Plug 'airblade/vim-rooter'                        " Automagically update project root


" Airline stuff
Plug 'vim-airline/vim-airline'                    " Status bar
Plug 'vim-airline/vim-airline-themes'             " Status bar themes

" Tmux/shell stuff
Plug 'benmills/vimux'                             " Send tmux commands from vim
Plug 'edkolev/tmuxline.vim'                       " tmux status line generator
Plug 'christoomey/vim-tmux-navigator'             " vim + tmux split hotkeys
Plug 'tmux-plugins/vim-tmux-focus-events'         " restore broken focus events for vim inside tmux
"Plug 'edkolev/promptline.vim'                     " Bash shell prompt

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
set shell=/bin/zsh                                  " Set the shell

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

" Share copy/paste with OS
set clipboard+=unnamedplus

" Persistent undo
set undodir=~/.vim/undodir
set undofile

" Disable mouse
set mouse=

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" disable automatically continuing comments onto subsequent lines
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

"""""""""""""""""""""""""""""""
" Color Preferences
set background=dark

set termguicolors                                  " I don't think this is actually needed for nvim
"colorscheme afterglow
colorscheme jellyx
"colorscheme whitebox  " for white backgrounds

" Improve search highlighting
highlight IncSearch ctermbg=Black ctermfg=Yellow
highlight Search ctermbg=Yellow ctermfg=Black

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Highlight yanked text
au TextYankPost * silent! lua vim.highlight.on_yank()

"""""""""""""""""""""""""""""""
" Code folding
set nofoldenable                                    " off by default
set foldmethod=syntax
set foldcolumn=2
set foldnestmax=10
set foldlevelstart=99                               " start with all folds opened
highlight Folded ctermbg=8 ctermfg=16               " color names don't work here ?!?!?!?!
nnoremap <leader>z za<CR>                           " Space-z to toggle folding

"""""""""""""""""""""""""""""""
" Remappings

" Buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Clear search term with Space+Enter
nnoremap <leader><CR> :nohlsearch<CR>

" Yank list
nnoremap <leader>r :reg<CR>

nnoremap <leader>w :w<CR>

" source vim config
nnoremap <leader>S :so ~/.vimrc<CR>

" Fire up Ag
nnoremap <leader>s :Ag<Space>
" Use Ag to search to word under cursor
nnoremap <silent> <Leader>* :Ag <C-R><C-W><CR>

" Toggle ctags
nnoremap <leader>c :TagbarToggle<CR>

" Open terminal
nnoremap <leader>t :call OpenTerminal()<CR>

" Pretty-format JSON
nnoremap <leader>j :%!jq .<CR>

"""""""""""""""""""""""""""""""
" Plugin-specific

" Which-key (leader hints)
set timeoutlen=300
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
" customize example - see https://github.com/liuchengxu/vim-which-key#example
let g:which_key_map = {}

let g:which_key_map.p = {'name': '+Plugins'}
let g:which_key_map.p.i = ['PlugInstall', 'Install']
let g:which_key_map.p.u = ['PlugUpdate', 'Update']
let g:which_key_map.p.c = ['PlugClean', 'Clean']

let g:which_key_map.c = 'Show Ctags'
let g:which_key_map.j = 'Prettify JSON'
let g:which_key_map.r = 'List registers'
let g:which_key_map.s = 'Search files with ag'
let g:which_key_map['*'] = 'Search for word under cursor with ag'
let g:which_key_map.S = 'Source .vimrc'
let g:which_key_map.t = 'Open terminal'
" let g:which_key_map.w = 'Save file'
let g:which_key_map.z = 'Toggle folding'
let g:which_key_map.Z = 'Disable/enable folding'
let g:which_key_map['<CR>'] = 'Clear search'

" Sensible.vim
runtime! plugin/sensible.vim
set scrolloff=8                                     " Start scrolling when we're 8 lines away from margins

" Vinegar
let g:netrw_fastbrowse = 0                          " Don't leave directory buffers hanging around

" Fugitive
set statusline=%{fugitive#statusline()}

" Git Messenger
let g:git_messenger_always_into_popup = v:true

" Coc.nvim
" let g:coc_node_path = trim(system('which node'))
" see also ~/.config/nvim/coc-settings.json

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Accept first result with tab
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"


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
set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular

" FZF
" Custom function to search from git root
set rtp+=/opt/homebrew/opt/fzf
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
" Replace Ctrl-P with FZF - use 'ProjectFiles' instead of 'Files' to use our custom function above
nnoremap <C-p> :ProjectFiles<Cr>
nnoremap <C-t> :FZFMru<Cr>
nnoremap <C-c> :BTags<Cr>
nnoremap <C-b> :Buffers<Cr>
nnoremap <C-g> :BCommits<Cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'               " Use AG by default, so we respect .gitignore etc
"let g:fzf_layout = { 'down': '~40%' }               " Bigger search results list

""" FZF in floating window
""" https://kassio.github.io/2019/04/10/neovim-fzf-with-a-floating-window.html
	" Reverse the layout to make the FZF list top-down
	let $FZF_DEFAULT_OPTS='--layout=reverse'

	" Using the custom window creation function
	let g:fzf_layout = { 'window': 'call FloatingFZF()' }

	" Function to create the custom floating window
	function! FloatingFZF()
	  " creates a scratch, unlisted, new, empty, unnamed buffer
	  " to be used in the floating window
	  let buf = nvim_create_buf(v:false, v:true)

	  " 90% of the height
	  let height = float2nr(&lines * 0.9)
	  " 60% of the height
	  let width = float2nr(&columns * 0.6)
	  " horizontal position (centralized)
	  let horizontal = float2nr((&columns - width) / 2)
	  " vertical position (one line down of the top)
	  let vertical = 1

	  let opts = {
			  \ 'relative': 'editor',
			  \ 'row': vertical,
			  \ 'col': horizontal,
			  \ 'width': width,
			  \ 'height': height
			  \ }

	  " open the new window, floating, and enter to it
	  call nvim_open_win(buf, v:true, opts)
	endfunction
"""

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
