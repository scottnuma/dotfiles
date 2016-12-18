set nocompatible
filetype off   
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'

	Plugin 'luochen1990/rainbow'
		let g:rainbow_active = 1

	Plugin 'christoomey/vim-tmux-navigator'

	Plugin 'python-mode/python-mode'
		let g:pymode = 1
		let g:pymode_options_max_line_length = 120
		let g:pymode_python = 'python3'
call vundle#end()

filetype plugin indent on

:imap jk <Esc>
set relativenumber
set number
syntax enable
