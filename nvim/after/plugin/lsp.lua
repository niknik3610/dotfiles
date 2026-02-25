local lsp = require('lsp-zero').preset("recommended")

lsp.ensure_installed({
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Enter>'] = cmp.mapping.confirm({select = true}),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = {  }
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

--binds that only work on files with lsp
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>br",  function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>vr", function () vim.lsp.buf.references() end, opts)
end)


vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
    prefix = '● ',
    spacing = 8,
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
})

vim.lsp.config["clangd"] = {
  on_attach = function(client, bufnr)
    -- Options for the keymap: 
    -- 'buffer = bufnr' ensures this ONLY works in C/C++ files
    local opts = { buffer = bufnr, silent = true, desc = "Switch Source/Header" }

    -- Clangd specifically provides a command called 'ClangdSwitchSourceHeader'
    vim.keymap.set('n', '<leader>h', '<cmd>ClangdSwitchSourceHeader<cr>', opts)
  end,
}

local installed = require('mason-lspconfig').get_installed_servers()

for _, name in ipairs(installed) do
  local server = require('lspconfig')[name]
  local ok = pcall(server.setup, {})
  if not ok then
    print('failed to setup' .. name)
  end
end

lsp.setup()

local util = require('lspconfig.util')
lsp.configure('wgsl-analyzer', {
    root_dir = util.root_pattern('.git')
});
