local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function() 
    builtin.find_files({no_ignore = true, follow = true})
end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({search = vim.fn.input("Grep > ")})
end)
vim.keymap.set('n', '<leader>pa', builtin.lsp_references, {})
local conf = require('telescope.config').values
conf.vimgrep_arguments = {
    'rg',
    '--no-config',
    '--no-ignore',
    '--color=never',
    '--with-filename',
    '--line-number',
    '--column',
    '--smart-case',
    '--hidden',
    '-g=!.git',
    '-g=!.ccls-cache',
}
