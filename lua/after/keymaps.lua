-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move lines after selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Telescope keymaps
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", telescope_builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
  telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Todo-Comments keymaps
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>")
vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<CR>")
