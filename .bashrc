#!/bin/bash

dotdir="$HOME/dotfiles"

[ -z "$PS1" ] && return

. "$dotdir"/.bash_alias
. "$dotdir"/.bash_profile
. "$dotdir"/.bash_functions

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# ## change prompt 
# live="\[\e[0;35m\]\u\[\e[0m\]-\[\e[0;1;92m\]LIVE\[\e[0m\]:\[\e[0;96m\]\w\[\e[0;97m\]\$\[\e[0m\] "
# standby="\[\e[0;35m\]\u\[\e[0m\]-\[\e[0;38;5;214m\]STANDBY\[\e[0m\]:\[\e[0;96m\]\w\[\e[0;97m\]\$\[\e[0m\] "

# ##else load PS1
# PS1="\[\e[0;35m\]\u\[\e[0m\]-\[\e[0;38;5;214m\]STANDBY\[\e[0m\]:\[\e[0;96m\]\w\[\e[0;97m\]\$\[\e[0m\]"
PS1='\[\e[96m\]\u\[\e[37m\]@\[\e[95m\]\h\[\e[37m\]:\[\e[96m\]\w\\$\[\e[0m\] '

gid=$(id -g)
if [[ -f /tmp/primary_system_$gid ]]; then
    PS1=$live
fi
if [[ -f /tmp/standby_system_$gid ]]; then
    PS1=$standby
fi
eval $(ssh-agent) && ssh-add ~/.ssh/*.priv
