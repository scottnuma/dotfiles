set nocompatible
filetype off  
set rtp+=~/.vim/bundle/Vundle.vim

let mapleader = ";"

source ~/.config/nvim/plugs.vim

imap jk <Esc>
imap jj <Esc>

" Use the insert key to toggle paste mode in insert mode
set pastetoggle=<Insert>

set relativenumber
set number
syntax enable
"
" Always display the status line
set laststatus=2
 
set statusline=%f\      "filename
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

set statusline+=%=      "left/right separator

set statusline+=C%c\      "cursor column

" Set status line to light blue on gray
hi StatusLine ctermbg=black ctermfg=4

" Enable viusal mode for all modes
set mouse=a


" Highlight all search matches
set hlsearch

" Use ctrl-c and ctrl-v for interacting with the system clipboard
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

filetype plugin indent on

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype c setlocal ts=2 sts=2 sw=2
autocmd Filetype go setlocal ts=4 sts=4 sw=4
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

" Recognize Tiltfile
autocmd BufRead Tiltfile setf tiltfile
autocmd BufRead Tiltfile set syntax=python

" Spaces not tabs
" set expandtab
        
" make backspace work across lines
set backspace=2 

" Look in parent directories for the ctags tags file
set tags+=tags;~

" Set the working directory as the current directoy 
" set autochdir

if has("nvim")
        set termguicolors
endif

" Set color scheme
" colorscheme gotham
" colorscheme snow
"
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


colorscheme one
" dark mode enabled?
if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
   set background=dark
else
  set background=light
endif

" Default to case insensitive search 
set ignorecase
" Use case sensitivity if we use a capital letter
set smartcase

" treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=10

lua <<EOF
require('scottnuma/lsp')
require('scottnuma/treesitter')
require('scottnuma/treesittertextobjects')
EOF

