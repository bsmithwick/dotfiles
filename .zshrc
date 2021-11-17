# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/bsmithwick/.oh-my-zsh"

# Set name of the theme to load
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="minimal_improve"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

####
# PLUGIN SPECIFIC
###
# zsh-nvm
export NVM_LAZY_LOAD=true

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
#	zsh-autosuggestions - more annoying than helpful
	autojump
	catimg
	docker
	encode64
	extract
	fzf
	last-working-dir
	npm
	tmux
	zsh-nvm
	# git
	# vi-mode - use this instead of bindkey -v?
	z
)

source $ZSH/oh-my-zsh.sh

# Tweaks to zsh config
# vim mode!
bindkey -v
# Restore ctrl-r fzf history search after enabling vim mode
bindkey "^R" fzf-history-widget

# Git completion
zstyle ':completion:*:*:git:*' script ~/.git-completion.zsh

# PROMPT
#PROMPT="[%n %1~]» "
PROMPT="[%n %1~]%# "

# _git_branch_name() {
#     git branch 2>/dev/null | awk '/^\*/ { print $2 }'
# }
#RPROMPT='$(_git_branch_name)'
#RPROMPT='$(git_prompt_info)'
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"

export TERM='xterm-256color'
export COLORTERM='gnome-terminal'
export EDITOR='vim'

# use neovim instead of vim
#alias vi='vim'
alias vi='nvim'
alias vim='nvim'
alias svim='vim -u ~/.SpaceVim/vimrc'
alias spacevim='vim -u ~/.SpaceVim/vimrc'

alias gitdiff='git difftool -d'
alias open='xdg-open'
#alias docker='podman' #train thyself to use podman
alias dwaws='php /home/bsmithwick/src/snaap/scripts/dw-aws.php'

# use a global ignore file
alias ag='ag --path-to-ignore ~/.ignore'

# dodge autocorrection
unsetopt correct_all
setopt correct

# added for promptline
#source ~/.promptline.sh

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

path+=/home/bsmithwick/.local/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Custom Functions
# fg 1, not fg %1
fg() {
    if [[ $# -eq 1 && $1 = - ]]; then
        builtin fg %-
    else
        builtin fg %"$@"
    fi
}
