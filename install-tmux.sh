#!/bin/bash
cp tmux.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
echo 'source ~/.vimrc' > ~/.ideavimrc
