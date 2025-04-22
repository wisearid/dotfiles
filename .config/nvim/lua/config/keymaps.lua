local map = vim.keymap.set
local set = vim.opt

vim.g.mapleader = " "


map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")
