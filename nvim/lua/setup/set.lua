vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50 

vim.opt.colorcolumn = ""

vim.g.mapleader = " "
vim.g.netrw_banner = 0;
vim.opt.swapfile = false

vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


--opens explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--closes tab
vim.keymap.set("n", "<leader>bd", vim.cmd.bd)

--forward and backward tab
vim.keymap.set("n", "<leader>k", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>j", vim.cmd.bnext)

--save
vim.keymap.set("n", "<leader>s", vim.cmd.w)
vim.keymap.set("n", "<leader>cf", ":!npx prettier . --write<CR>")

--up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--paste without copying
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<F8>", ":!./build.sh<CR>")

vim.opt.guifont = { "Droid Sans Mono for Powerline", "h12" }
