# for some reason .bash_profile is the entry point on debian
. ~/.bashrc
# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=10000000
HISTFILESIZE=2000000
HISTTIMEFORMAT="%d/%m/%y %T "

shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s checkwinsize


# set PATH so it includes user bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/support" ]; then 
    PATH="$HOME/support:$PATH"
fi 
if [ -d "$HOME/support/api" ]; then 
    PATH="$HOME/support/api:$PATH"
fi 
if [ -d "$HOME/support/sjr" ]; then 
    PATH="$HOME/support/sjr:$PATH"
fi 
if [ -d "/opt/nvim-linux64/bin" ]; then 
    PATH="/opt/nvim-linux64/bin:$PATH"
fi 
if [ -d "$HOME/.local/bin" ]; then 
    PATH="$HOME/.local/bin:$PATH"
fi 
if [ -d "$HOME/.local/share/luals/bin" ]; then 
    PATH="$HOME/.local/share/luals/bin:$PATH"
fi 

PATH="/opt/OpenWebStart:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/go/bin:$PATH"

export PATH

export EDITOR=nvim


# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
