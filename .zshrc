# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/bsmithwick/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="minimal_improve"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker git fzf last-working-dir npm tmux z)

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
RPROMPT='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"

export TERM='xterm-256color'
export COLORTERM='gnome-terminal'
export EDITOR='vim'

alias vi='vim'
alias svim='vim -u ~/.SpaceVim/vimrc'
alias gitdiff='git difftool -d'
alias open='xdg-open'
alias dwaws='/usr/bin/php ~/src/snaap/scripts/dw-aws.php'

# dodge autocorrection
unsetopt correct_all
setopt correct

# added for promptline
#source ~/.promptline.sh

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# added for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/bsmithwick/.nvm/versions/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/bsmithwick/.nvm/versions/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/bsmithwick/.nvm/versions/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/bsmithwick/.nvm/versions/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/bsmithwick/.nvm/versions/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /home/bsmithwick/.nvm/versions/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
