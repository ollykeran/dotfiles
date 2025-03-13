#!/bin/bash

[ -z "$PS1" ] && return

. ~/.bash_alias
#. "$dotdir"/.bash_profile
. ~/.bash_functions

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

PS1='\[\e[96m\]\u\[\e[37m\]@\[\e[95m\]\h\[\e[37m\]:\[\e[96m\]\w\\$\[\e[0m\] '

echo "Windows Keys:"
# should already be running from keepass
ssh-add.exe -l

if [[ $(pgrep -c ssh-agent) -lt 2 ]]; then 
    # start wsl agent if less than 2, as windows one is already running
    echo "Weasel Keys:"
    /usr/bin/ssh-agent &> /dev/null && /usr/bin/ssh-add ~/.ssh/*.priv &> /dev/null && /usr/bin/ssh-add -l -E md5
else
    echo "Weasel Keys:"
    /usr/bin/ssh-add -l -E md5
fi
eval "$(starship init bash)"
