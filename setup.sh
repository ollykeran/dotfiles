#!/bin/bash

sudo apt install ansible

ansible-playbook setup.yml -K 

./stow.sh

## dont know why this fails... its the full path
/opt/nvim-linux64/bin/nvim -c PackerSync

if [[ $(cat /etc/*release | grep -iq ubuntu) ]]; then
    sudo snap install bash-language-server --classic
fi
