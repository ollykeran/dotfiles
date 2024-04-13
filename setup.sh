#!/bin/bash

sudo ./install_packages.sh

stow --ignore='.*\.sh$|^\.git|\.list$' .

#use stow -D . to unlink
