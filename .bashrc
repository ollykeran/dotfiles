#!/bin/bash

KEYPATH="$HOME/.ssh/ollyk27"
GITDIR=/mnt/c/Users/Olly/OneDrive/Documents/git

# shopts
shopt -s autocd
shopt -s histappend

#### PS1
DATE=$(date +%Y%m%d)
PS1="\u@\h:"

alias du='du -khc'  
alias df='df -kTh --type ext4 --type ext3 --type 9p'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
# for setting history 
HISTSIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

## update this PS1 section
# manually set PS1, we know we are logging in using xterm 

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

alias ls='ls -al --color -h --group-directories-first'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

#neofetch
eval "$(thefuck --alias)"
. "$HOME/.cargo/env"

pullall() {

    if [[ -z "$SSH_AUTH_SOCK" ]]; then 
        eval $(ssh-agent)
    else 
        echo -n "Agent PID: "
    fi

    if ssh-add -l; then 
        echo -n "Identity already added: "
        ssh-add -l 
    else   
        echo -n "Adding key: "
        ssh-add "$KEYPATH"
        ssh-add -l
    fi

    find "$GITDIR" -maxdepth 2 -type d -name ".git" -print | sed 's/.git$//g' | xargs -I {} git -C {} pull
}
