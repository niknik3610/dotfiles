local mason = require 'mason'
local mason_lsp = require 'mason-lspconfig'

mason.setup()
mason_lsp.setup {
  automatic_installation = true,
}

local lspconfig = require('lspconfig')
lspconfig.wgsl_analyzer.setup({})

-- mason_lsp.setup_handlers { function(server_name)
--   if server_name == "jdtls" then
--     return
--   end
--
-- end }
