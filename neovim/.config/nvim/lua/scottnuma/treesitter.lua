require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "dockerfile",
    "go",
    "html", 
    "javascript",
    "json", 
    "lua",
    "markdown",
    "python", 
    "ruby",
    "sql",
    "typescript",
    "vim",
    "yaml", 
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  textsubjects = {
    enable = true,
    prev_selection = '8', -- (Optional) keymap to select the previous selection
    keymaps = {
            ['<cr>'] = 'textsubjects-smart',
            ['co'] = 'textsubjects-container-outer',
	    ['ci'] = 'textsubjects-container-inner',
        },
    },
  incremental_selection = {
    enable = true,
    keymaps = {
      -- init_selection = "<cr>",
      -- scope_incremental = "<cr>",
      node_incremental = "<tab>",
      node_decremental = "<s-tab>",
    },
  },
}

