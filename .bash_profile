# for some reason .bash_profile is the entry point on debian
. ~/.bashrc
# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT="%d/%m/%y %T "

shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s checkwinsize


# set PATH so it includes user bin if it exists
if [ -d "/opt/nvim-linux64/bin" ]; then 
    PATH="/opt/nvim-linux64/bin:$PATH"
fi 
if [ -d "$HOME/.local/bin" ]; then 
    PATH="$HOME/.local/bin:$PATH"
fi 
if [ -d "$HOME/.local/share/luals/bin" ]; then 
    PATH="$HOME/.local/share/luals/bin:$PATH"
fi 

export EZA_CONFIG_DIR=~/.config/eza

PATH="$PATH:/usr/local/bin:/usr/local/go/bin:$HOME/go/bin"
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
. "$HOME/.cargo/env"
