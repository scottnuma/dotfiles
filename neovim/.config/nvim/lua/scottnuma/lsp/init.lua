require('scottnuma/lsp/lspkeybindings')

-- The following defines LSP configuration.
-- The LSP must still be installed to actually work.
require'lspconfig'.pyright.setup{
  on_attach = on_attach
}
require'lspconfig'.vimls.setup{
  on_attach = on_attach
}
require'lspconfig'.yamlls.setup{
  on_attach = on_attach
}
require'lspconfig'.jsonls.setup {
  on_attach = on_attach,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}
require'lspconfig'.bashls.setup{
  on_attach = on_attach
}
require'lspconfig'.tsserver.setup{
  on_attach = on_attach
}
require'lspconfig'.gopls.setup{
  on_attach = on_attach
}
