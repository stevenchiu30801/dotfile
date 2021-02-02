#
# ~/.bashrc
#

BASH_WHITE="\[\e[0m\]"
BASH_RED="\[\e[31m\]"
BASH_LIGHT_RED="\[\e[1;31m\]"
BASH_GREEN="\[\e[32m\]"
BASH_LIGHT_GREEN="\[\e[1;32m\]"
BASH_YELLOW="\[\e[33m\]"
BASH_LIGHT_YELLOW="\[\e[1;33m\]"
BASH_BLUE="\[\e[34m\]"
BASH_LIGHT_BLUE="\[\e[1;34m\]"
BASH_MAGENTA="\[\e[35m\]"
BASH_LIGHT_MAGENTA="\[\e[1;35m\]"
BASH_CYAN="\[\e[36m\]"
BASH_LIGHT_CYAN="\[\e[1;36m\]"

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

function kube_namespace {
    # # Uncomment the following to enable showing Kubernetes namespace on shell prompt
    # ctx=$(kubectl config current-context) || return;
    # ns=$(kubectl config view -o jsonpath="{.contexts[?(@.name == \"$ctx\")].context.namespace}");
    # if [[ -z "$ns" ]]; then
    #     ns="default";
    # fi
    # echo "("$ns") ";
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));
    
    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

# prompt
PS1="${BASH_WHITE}[${BASH_LIGHT_CYAN}\D{%F %a %I:%M %P}${BASH_WHITE}] ${BASH_LIGHT_GREEN}\u ${BASH_WHITE}@ ${BASH_LIGHT_GREEN}\h ${BASH_WHITE}: ${BASH_LIGHT_BLUE}\w ${BASH_LIGHT_YELLOW}\$(git_branch)${BASH_LIGHT_RED}\$(git_since_last_commit)${BASH_LIGHT_MAGENTA}\$(kube_namespace)${BASH_WHITE}\n\$ "

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export BROWSER=elinks
export GPG_TTY=$(tty)

# # Add RVM to PATH for scripting
# [[ -d $HOME/.rvm/bin ]] && export PATH="$PATH:$HOME/.rvm/bin"
# # Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . $HOME/.rvm/scripts/rvm
# # Ruby gem user_dir
# export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

# history settings
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=1000
shopt -s histappend
LESSHISTFILE=/dev/null

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# colored less
# export LESS_TERMCAP_mb=$(tput bold; tput setaf 3)
# export LESS_TERMCAP_md=$(tput bold; tput setaf 34)
# export LESS_TERMCAP_me=$(tput sgr0)
# export LESS_TERMCAP_so=$(tput bold; tput setaf 0; tput setab 7)
# export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# export LESS_TERMCAP_us=$(tput smul; tput setaf 33)
# export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
# export LESS_TERMCAP_mr=$(tput rev)
# export LESS_TERMCAP_mh=$(tput dim)

# aliases
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias ls='ls --color -F'
alias l='ls --color -F'
alias la='ls --color -AF'
alias ll='ls --color -lAF'
alias gdb='gdb -q'
alias pacman='pacman --color always'	# arch package manager
alias watch='watch --color'
