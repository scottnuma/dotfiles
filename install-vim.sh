#!/bin/bash
cp vim.vimrc ~/.vimrc
cp ctags.ctags ~/.ctags
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
