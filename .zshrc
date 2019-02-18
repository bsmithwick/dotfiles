# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bsmithwick/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Config
export TERM="xterm-256color"
export COLORTERM="gnome-terminal"
setopt prompt_subst

# PROMPT
PROMPT="[%n %1~]%# "
#PROMPT="[%n %1~]» "

_git_branch_name() {
    git branch 2>/dev/null | awk '/^\*/ { print $2 }'
}
RPROMPT='$(_git_branch_name)'

bindkey "^R" history-incremental-pattern-search-backward

# Aliases
alias gitdiff='git difftool -d'
alias open='xdg-open'

# Dev scripts
alias dwaws='/usr/bin/php ~/src/snaap/scripts/dw-aws.php'

# added by travis gem
[ -f /home/bsmithwick/.travis/travis.sh ] && source /home/bsmithwick/.travis/travis.sh

# added for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

