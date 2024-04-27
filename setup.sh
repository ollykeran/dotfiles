#!/bin/bash

pip install ansible

$HOME/.local/bin/ansible-playbook setup.yml -K 

./stow.sh

/opt/nvim-linux64/bin/nvim -c PackerSync

