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

	"ctags
	Plugin 'craigemery/vim-autotag'

	" NERDTree
	Plugin 'scrooloose/nerdtree'
		map <C-n> :NERDTreeToggle<CR>

		" Close window if only window left is NERDTree
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

call vundle#end()

filetype plugin indent on

:imap jk <Esc>
:imap jj <Esc>

set relativenumber
set number
syntax enable

" Enable viusal mode for all modes
:set mouse=a

let mapleader = ";"

" Highlight all search matches
set hlsearch

" Set mapping for switching between buffers
map <leader>j :bp!<CR>
map <leader>k :bn!<CR>
map <leader>w :bd<CR>
map <leader>W :w<CR>:bd<CR>

" Set shortcut for vim spitting the screen
map <leader>h :sv<CR>
map <leader>v :vs<CR>

" Set the tab spacing for ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" When a single line wraps around, use j and k to navigate inside the lines
nnoremap j gj
nnoremap k gk

" make backspace work across lines
set backspace=2 
