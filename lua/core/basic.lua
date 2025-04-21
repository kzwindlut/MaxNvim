vim.opt.number = true
vim.opt.relativenumber = true


vim.opt.cursorline = true
vim.opt.colorcolumn = "80"

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0

vim.opt.autoread = true

vim.opt.splitbelow = true
vim.opt.splitright = true


vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

vim.opt.ignorecase = true
vim.opt.smartcase = true

map("n", "<leader>n", "<CMD>:nohlsearch<CR>", {silent = true})
