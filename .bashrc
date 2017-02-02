ulimit -n 1024
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '

export NVM_DIR="/Users/asmi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ "`hostname`"="MacBook-Pro-Max" ]; then
    alias vim='/usr/local/bin/vim'
    export PATH="$PATH:$HOME/.rvm/bin:/usr/local/mysql/bin/" 
    export MOBILE_CORE=~/mcs_core
    export MOBILE_ROOT=~/mobile
fi
