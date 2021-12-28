call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'

	" Use colorful rainbow parentheses
	Plugin 'luochen1990/rainbow'
		let g:rainbow_active = 1

	" Treat window and tmux navigation the same
	Plugin 'christoomey/vim-tmux-navigator'

        " Gotham color scheme
	" Plugin 'whatyouhide/vim-gotham'

        " Vim-one color scheme https://github.com/rakr/vim-one
        Plugin 'rakr/vim-one'

        " fzf
        Plugin 'junegunn/fzf'
        Plugin 'junegunn/fzf.vim'

                " Define a new command that searches from the project root as defined
                " by git
                function! s:find_git_root()
                        return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
                endfunction
                command! ProjectFiles execute 'Files' s:find_git_root()

                " set ctrl-p to FZF fuzzy searching from the git root
                " nnoremap <silent> <C-p> :ProjectFiles<CR>
		nnoremap <silent><C-p> <cmd>Telescope find_files<cr>

                let g:fzf_action = {
                  \ 'ctrl-t': 'tab split',
                  \ 'ctrl-h': 'split',
                  \ 'ctrl-v': 'vsplit' }

                let g:fzf_layout = { 'up': '~40%' }

        
        " vim-go
       
        Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        set autowrite                           " Save on GoBuild etc
        let g:go_fmt_command = "goimports"      " Use goimports over gofmt
        let g:go_highlight_types = 1            " Use better syntax highlighting
        let g:go_highlight_fields = 1
        let g:go_highlight_functions = 1
        let g:go_highlight_function_calls = 1
        let g:go_doc_keywordprg_enabled = 0


        " disable vim-go :GoDef short cut (gd)
        " this is handled by LanguageClient [LC]
        let g:go_def_mapping_enabled = 0
        
	" NERDTree
	Plugin 'scrooloose/nerdtree'
		map <C-n> :NERDTreeToggle<CR>
		map <leader>n :NERDTreeFind<CR>

		" Close window if only window left is NERDTree
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

		" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
		autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
		\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


        " Render buffers as tabs: https://github.com/zefei/vim-wintabs
        Plugin 'zefei/vim-wintabs'
        let g:wintabs_display = "statusline"
        let g:wintabs_autoclose = 2
        let g:wintabs_autoclose_vim = 1
        let g:wintabs_autoclose_vimtab = 1
	let g:wintabs_ui_active_higroup = 'TabLineSel'

	" Set mapping for switching between buffers
	map <leader>l :WintabsNext<CR>
	map <leader>h :WintabsPrevious<CR>
	map <leader>w :WintabsClose<CR>
	map <leader>W :WintabsCloseWindow<CR>

        " treesitter
        Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

        " sublime style ctrl shift f
        " https://github.com/dyng/ctrlsf.vim
        Plugin 'dyng/ctrlsf.vim'

        " neovim lsp config
        Plugin 'neovim/nvim-lspconfig'
		" dyng/ctrlsf.vim 
		let g:ctrlsf_default_root = 'project'
		let g:ctrlsf_backend = 'rg'

		" prompt for the search word
		nmap     <leader>ff <Plug>CtrlSFPrompt

		" prompt, filled with  the word under the cursor
		nmap     <leader>fn <Plug>CtrlSFCwordPath
		vmap     <leader>ff <Plug>CtrlSFVwordPath

		" search for the word under the cursor
		nmap     <leader>fp <Plug>CtrlSFPwordPath
		vmap     <leader>fF <Plug>CtrlSFVwordExec

		" Toggle the preview window open and shut
		nnoremap <leader>ft :CtrlSFToggle<CR>
		inoremap <leader>ft <Esc>:CtrlSFToggle<CR>

	Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	let g:deoplete#enable_at_startup = 1

	Plugin 'f-person/git-blame.nvim'
	let g:gitblame_enabled = 0
	nmap	<leader>gb :GitBlameToggle<CR>

	" Telescope
	Plugin 'nvim-lua/popup.nvim'
	Plugin 'nvim-lua/plenary.nvim'
	Plugin 'nvim-telescope/telescope.nvim'

		" Disable auto-completion in telescope
		autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)

call vundle#end()


