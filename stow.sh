#!/bin/bash

stow -D .

stow --ignore='.*\.sh$|^\.git|\.list$|.*\.md$' .

#use stow -D . to unlink
