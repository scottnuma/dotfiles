require('scottnuma/lsp/lspkeybindings')

-- The following defines LSP configuration.
-- The LSP must still be installed to actually work.
--
-- Learning about the setup{} https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.gopls.setup{
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      -- -- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
      -- analyses = {
      --   unusedparams = true,
      -- },
      -- staticcheck = true,
    },
  },
  capabilities = capabilities,
  on_attach = on_attach
}

require'lspconfig'.solargraph.setup{
  on_attach = on_attach
}
