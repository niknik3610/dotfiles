vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)                                   -- highlighting
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
  end,
})
