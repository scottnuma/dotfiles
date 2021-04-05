require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "go",
    "python", 
    "yaml", 
    "json", 
    "html", 
    "ruby",
    "bash",
    "javascript",
    "typescript",
    "lua",
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

