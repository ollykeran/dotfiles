local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- snap/dnf bash-language-server
require'lspconfig'.bashls.setup({})

-- pip install pylyzer
require'lspconfig'.pylyzer.setup{}

-- wget tar .local/share/luals/bin 
require'lspconfig'.lua_ls.setup{}
