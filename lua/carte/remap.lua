-- Global remaps
vim.g.mapleader = " "

-- Normal Mode Remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader><leader>", vim.cmd.so)
-- Let me save normally

vim.keymap.set("n", "<C-s>", vim.cmd.w)

-- Window movements
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

vim.keymap.set("n", "<leader>=", ":res +10<CR>")
vim.keymap.set("n", "<leader>-", ":res -10<CR>")
vim.keymap.set("n", "<leader>v=", ":vertical resize +10<CR>")
vim.keymap.set("n", "<leader>v-", ":vertical resize -10<CR>")

-- Visual Mode Remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remaps in after for specific plugins
-- fugitive.lua
-- lsp.lua
-- neotree.lua
-- telescope.lua
-- trouble.lua
