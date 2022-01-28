local nvim_lsp = require('lspconfig')
on_attach = function(client, bufnr)
  print("mounted LSP key bindings")
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        -- Jumps to the declaration of the symbol under the cursor.

  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        -- Jumps to the definition of the symbol under the cursor.

  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        -- Displays hover information about the symbol under the cursor
        -- in a floating window. Calling the function twice will jump
        -- into the floating window.

  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        -- Lists all the implementations for the symbol under the cursor
        -- in the quickfix window.

  buf_set_keymap('n', '<C-S-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        -- Displays signature information about the symbol under the
        -- cursor in a floating window.

  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        -- list workspace folders

  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        -- Jumps to the definition of the type of the symbol under the
        -- cursor.

  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        -- Renames all references to the symbol under the cursor.

  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        -- Lists all the references to the symbol under the cursor in the
        -- quickfix window.

  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        -- Open a floating window with the diagnostics from {line_nr}

  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        -- Move to the previous diagnostic

  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        -- Get the next diagnostic closest to the cursor_position

  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
        -- Sets the location list

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        -- Formats the current buffer.

  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
        -- See :help
  end
end
