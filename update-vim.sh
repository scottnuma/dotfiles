#!/bin/bash
cp vim.vimrc ~/.vimrc
cp ctags.ctags ~/.ctags
vim +PluginInstall +qall
