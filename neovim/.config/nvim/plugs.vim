let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
	" Use colorful rainbow parentheses
	Plug 'luochen1990/rainbow'
		let g:rainbow_active = 1

	" Treat window and tmux navigation the same
	Plug 'christoomey/vim-tmux-navigator'

        " Vim-one color scheme https://github.com/rakr/vim-one
        Plug 'rakr/vim-one'

        " fzf
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'

                " Define a new command that searches from the project root as defined
                " by git
                function! s:find_git_root()
                        return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
                endfunction
                command! ProjectFiles execute 'Files' s:find_git_root()


                let g:fzf_action = {
                  \ 'ctrl-t': 'tab split',
                  \ 'ctrl-h': 'split',
                  \ 'ctrl-v': 'vsplit' }

                let g:fzf_layout = { 'up': '~40%' }

        
        " vim-go
       
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        set autowrite                           " Save on GoBuild etc
        let g:go_fmt_command = "goimports"      " Use goimports over gofmt
        let g:go_highlight_types = 1            " Use better syntax highlighting
        let g:go_highlight_fields = 1
        let g:go_highlight_functions = 1
        let g:go_highlight_function_calls = 1
        let g:go_doc_keywordprg_enabled = 0


	" Since we're in neovim, run jobs in a new terminal
	let g:go_term_enabled = 1
	let g:go_term_mode = "split"	" Default to horizontal splits
	let g:go_term_close_on_exit = 1	" Don't close terminal after failure


        " disable vim-go :GoDef short cut (gd)
        " this is handled by LanguageClient [LC]
        let g:go_def_mapping_enabled = 0
        
	" Chadtree file explorer
	Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
		nnoremap <leader>n <cmd>CHADopen<cr>
		let g:chadtree_settings = {'keymap.v_split': ['v'], 'keymap.h_split': ['h']}



        " Render buffers as tabs: https://github.com/zefei/vim-wintabs
        Plug 'zefei/vim-wintabs'
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
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

        " sublime style ctrl shift f
        " https://github.com/dyng/ctrlsf.vim
        Plug 'dyng/ctrlsf.vim'

        " neovim lsp config
        Plug 'neovim/nvim-lspconfig'
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

	" Autocomplete 
	Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
	" Snippets suggested by auto-completion 
	Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
	let g:coq_settings = { 'auto_start': 'shut-up', 'keymap':{'jump_to_mark':'<c-t>'}}

	Plug 'f-person/git-blame.nvim'
	let g:gitblame_enabled = 0
	nmap	<leader>gb :GitBlameToggle<CR>
	

	" Telescope
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

		" Disable auto-completion in telescope
		autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)

		" Search the project for text
		nnoremap <leader>F <cmd>Telescope live_grep<cr>

		" Search the buffer for text
		nnoremap <leader>f <cmd>Telescope current_buffer_fuzzy_find<cr>

                " set ctrl-p to FZF fuzzy searching from the git root
                " nnoremap <silent> <C-p> :ProjectFiles<CR>
		nnoremap <silent><C-p> <cmd>Telescope find_files<cr>

		" set leader p to bring up a list of commands
		nnoremap <leader>p <cmd>Telescope commands<cr>
	" See the current function
	Plug 'romgrk/nvim-treesitter-context'

	" Text objects
	Plug 'nvim-treesitter/nvim-treesitter-textobjects'

	" Commenting  command - `gcc`
	Plug 'tpope/vim-commentary'
		" Map ctrl-/ to comment
		nnoremap <C-_> <cmd>Commentary<cr>

	" Smart text object selection
	Plug 'RRethy/nvim-treesitter-textsubjects'

	" Fix Python indentation
	Plug 'Vimjas/vim-python-pep8-indent'

	" Git Changes
	Plug 'airblade/vim-gitgutter'
	let g:gitgutter_map_keys = 0

	Plug 'ryanoasis/vim-devicons'

	Plug 'wsdjeg/vim-fetch'

call plug#end()
