require("setup")

--Downloads Lazy at startup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

--All Plugins added here:
require('lazy').setup({
    'rose-pine/neovim',

    {
        'nvim-telescope/telescope.nvim', 
        --tag = '0.1.5',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-tree/nvim-web-devicons',
    -- Treesitter was archived, commit is latest on main
    {
        'nvim-treesitter/nvim-treesitter',
        commit = "4916d6592ede8c07973490d9322f187e07dfefac",
        main = "nvim-treesitter",
    },
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'ThePrimeagen/harpoon',
    'f-person/git-blame.nvim',
    'MunifTanjim/prettier.nvim',
    {
        'folke/trouble.nvim',
        'nvim-lualine/lualine.nvim',
        dependencies = {
            {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
        }
    },

    'neovim/nvim-lspconfig',             
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim', 
    'hrsh7th/nvim-cmp',     
    'hrsh7th/cmp-nvim-lsp', 
})

-- Breaks some compilation of treesitter-langauges sometimes
-- require 'nvim-treesitter.install'.compilers = { "clang" }

