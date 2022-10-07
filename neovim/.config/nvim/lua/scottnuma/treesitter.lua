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
            ['9'] = 'textsubjects-smart',
            ['0'] = 'textsubjects-container-outer',
        },
    },
}

