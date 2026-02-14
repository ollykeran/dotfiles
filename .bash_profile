# for some reason .bash_profile is the entry point on debian
#. ~/.bashrc
. ~/git/dotfiles/.bash_functions
. ~/git/dotfiles/.bash_alias

. "$HOME/.cargo/env"

case $- in
    *i*) ;;
      *) return;;
esac

export PS1="\w\[\e[91m\]:󰣚\$\[\e[0m\] "

fastfetch

# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT="%d/%m/%y %T "

shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s checkwinsize

# Add a list of directories to PATH if they exist (idempotent)
export EZA_CONFIG_DIR=~/.config/eza
export EGET_BIN=~/.local/bin/
export EDITOR=nvim

# Append directories from an array to PATH if they exist (avoid duplicates)
dirs=(
    /opt/nvim-linux64/bin
    "$HOME/.local/bin"
    "$HOME/.local/share/luals/bin"
    /usr/local/bin
    /usr/local/go/bin
    "$HOME/go/bin"
    "$HOME/.cargo/bin"
    "/opt/nvim-linux-x86_64/bin"
)

for d in "${dirs[@]}"; do
    [ -d "$d" ] || continue
    case ":$PATH:" in
        *":$d:") ;; # already present
        *) PATH="$PATH:$d";;
    esac
done

export PATH
