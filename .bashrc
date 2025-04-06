#!/bin/bash

[ -z "$PS1" ] && return

if [ -f ~/.bash_alias ]; then
    . $HOME/.bash_alias
fi
if [ -f ~/.bash_functions ]; then
    . $HOME/.bash_functions
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -S $SSH_AUTH_SOCK ]; then
    eval $(ssh-agent) &> /dev/null && ssh-add ~/.ssh/*.priv &> /dev/null && ssh-add -l
fi

. "$HOME/.cargo/env"

eval "$(starship init bash)"
eval "$(zoxide init bash)"

neofetch
auto_uppies
