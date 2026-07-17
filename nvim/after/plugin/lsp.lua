local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<S-Tab>']   = cmp.mapping.select_prev_item(cmp_select),
        ['<Tab>']     = cmp.mapping.select_next_item(cmp_select),
        ['<CR>']      = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = {
        { name = 'nvim_lsp' },
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf, remap = false }
        vim.keymap.set('n', 'gd',         vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K',          vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>br', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>vr', vim.lsp.buf.references, opts)
    end,
})

vim.diagnostic.config({
    virtual_text = {
        source = 'if_many',
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
    signs = false,  
})

vim.lsp.config('*', {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.config('clangd', {
    on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true, desc = 'Switch Source/Header' }
        vim.keymap.set('n', '<leader>h', '<cmd>ClangdSwitchSourceHeader<cr>', opts)
    end,
})

vim.lsp.config('wgsl_analyzer', {
    root_markers = { '.git' },
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
    },
})
