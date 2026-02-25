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
    --themes
    -- 'joshdick/onedark.vim',
    -- 'catppuccin/nvim',
    'rose-pine/neovim',

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-context',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'ThePrimeagen/harpoon',
    'numToStr/Comment.nvim',
    'f-person/git-blame.nvim',
    'MunifTanjim/prettier.nvim',
    {
        --'zbirenbaum/copilot.lua',
    },
    {
        'folke/trouble.nvim',
        'nvim-lualine/lualine.nvim',
        dependencies = {
            {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
        }
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
        }
    },
})

-- Breaks some compilation of treesitter-langauges sometimes
-- require 'nvim-treesitter.install'.compilers = { "clang" }

