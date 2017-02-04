set nocompatible
filetype off  
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'

	" Use colorful rainbow parentheses
	Plugin 'luochen1990/rainbow'
		let g:rainbow_active = 1

	" Treat window and tmux navigation the same
	Plugin 'christoomey/vim-tmux-navigator'

	" Allow powerful Python editing
	Plugin 'python-mode/python-mode'
		let g:pymode = 1
		let g:pymode_options_max_line_length = 120
		let g:pymode_python = 'python3'

	" Powerline
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
		set laststatus=2
		let g:airline_theme='solarized'

		" Show a line of open buffers at the top
		let g:airline#extensions#tabline#enabled = 1

		" Show just the names of the files
		let g:airline#extensions#tabline#fnamemod = ':t'

		" Use the fancy powerline fonts
		let g:airline_powerline_fonts=1
		

	" NERDTree
	Plugin 'scrooloose/nerdtree'
		map <C-n> :NERDTreeToggle<CR>

		" Close window if only window left is NERDTree
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

		" CtrlP - easy file finding
		Plugin 'kien/ctrlp.vim'

call vundle#end()

filetype plugin indent on

:imap jk <Esc>
set relativenumber
set number
syntax enable

" Enable viusal mode for all modes
:set mouse=a

let mapleader = ";"


" Set mapping for switching between buffers
map <leader>j :bp!<CR>
map <leader>k :bn!<CR>
map <leader>w :bd<CR>
map <leader>W :w<CR>:bd<CR>
map <leader>t :new<CR>

" Set the tab spacing for ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
