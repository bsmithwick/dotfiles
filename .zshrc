# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/Users/bsmithwick/.oh-my-zsh"

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
# make sure nvm is booted before vim
nvim () {
    unset -f nvim
    _zsh_nvm_load
    nvim "$@"
}

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
#	zsh-autosuggestions - more annoying than helpful
	autojump
	docker
	encode64
	extract
	fzf
	last-working-dir
	npm
	tmux
	zsh-nvm
	asdf
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
#  zsh codex - openai
bindkey '^X' create_completion


# don't show history from other tabs
unsetopt inc_append_history
unsetopt share_history

# Git completion
zstyle ':completion:*:*:git:*' script ~/.git-completion.zsh
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes


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

#export TERM='xterm-256color'
#export COLORTERM='gnome-terminal'
export EDITOR='vim'

# use neovim instead of vim
#alias vi='vim'
alias vi='nvim'
alias vim='nvim'
alias lazy='nvim -u ~/.config/nvim/lazy.lua'

#alias gitdiff='git difftool -d' # for meld
alias gitdiff='git difftool -d --no-symlinks' # for diffmerge
#alias open='xdg-open'

# DOCKER
export DOCKER_HOST="unix://$HOME/.colima/docker.sock" # colima
#alias docker='podman' #train thyself to use podman
#alias dwaws='php74 -d apc.enable_cli=1 /home/bsmithwick/src/snaap/scripts/dw-aws.php'
#alias dwaws='php -d apc.enable_cli=1 ~bsmithwick/src/snaap/scripts/dw-aws.php'
alias dwaws='echo "dwaws is deprecated. Use qa-aws.php instead."'

# use a global ignore file
alias ag='ag --path-to-ignore ~/.ignore'

# easy file backups
alias bf='function _backup_file() { cp "$1" "$1.bak.$(date +%Y%m%d%H%M)"; }; _backup_file'

# dodge autocorrection
unsetopt correct_all
setopt correct

# added for promptline
#source ~/.promptline.sh

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

path+=/home/bsmithwick/.local/bin

# Custom Functions
# fg 1, not fg %1
fg() {
    if [[ $# -eq 1 && $1 = - ]]; then
        builtin fg %-
    else
        builtin fg %"$@"
    fi
}

export NODE_PATH="$(npm config get prefix)/lib/node_modules:$NODE_PATH"

## Google Cloud stuff
export GOOGLE_APPLICATION_CREDENTIALS="~/.dbt/bs-gcp-key.json"
export DBT_PROFILES_DIR="/Users/bsmithwick/src/dbt/.dbt/"

export PATH="/Users/bsmithwick/bin:$PATH"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/bsmithwick/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export PATH="/Users/bsmithwick/fvm/default/bin:$PATH"

# Shell-GPT integration ZSH v0.2
_sgpt_zsh() {
if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd" --no-interaction)
    zle end-of-line
fi
}
zle -N _sgpt_zsh
bindkey ^l _sgpt_zsh
# Shell-GPT integration ZSH v0.2

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/bsmithwick/.dart-cli-completion/zsh-config.zsh ]] && . /Users/bsmithwick/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

