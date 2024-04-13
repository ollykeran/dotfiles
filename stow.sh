#!/bin/bash

stow -D .

stow --ignore='.*\.sh$|^\.git|\.list$|.*\.md$|.*\.yml$' .