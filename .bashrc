# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# vi mode
set -o vi

# User specific aliases and functions
alias vi='vim'
alias gitdiff='git difftool -d'

source ~/.git-completion.sh

export TERM="xterm-256color"
export COLORTERM="gnome-terminal"

# Dev scripts
alias dwaws='/usr/bin/php ~/src/snaap/scripts/dw-aws.php'

#export ANDROID_HOME=~/Android/Sdk

# added by travis gem
[ -f /home/bsmithwick/.travis/travis.sh ] && source /home/bsmithwick/.travis/travis.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
