#!/bin/bash

case $- in
    *i*) ;;
      *) return;;
esac

# shopts
shopt -s autocd
shopt -s histappend

DATE=$(date +%Y%m%d)
export PS1="\w\[\e[91m\]󰣚\$\[\e[0m\]"

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -S $SSH_AUTH_SOCK ]; then
    eval $(ssh-agent) &> /dev/null && ssh-add ~/.ssh/*.priv &> /dev/null && ssh-add -l
fi
