vim.g.mapleader = " "

vim.keymap.set("n", "<leader>qv", vim.cmd.Ex, { desc = "Open NetRW explorer" })
vim.keymap.set("n", "<leader><leader>", vim.cmd.so, { desc = "Source current file" })
vim.keymap.set("n", "<leader>fw", "<cmd>w<cr>", { desc = "Write File" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit NeoVim" })

-- Normal Mode Remaps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n" }, "<leader>Y", '"+yy', { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without overwriting yank buffer" })

-- Because I am a windows user, Ctrl+v is fundamentally broken, I have to deal with this now
vim.keymap.set("n", "<A-v>", "<C-v>")

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==")
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv")

-- Window movements
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Window Resize with Ctrl + arrows
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<cr>")

-- Buffer movements
vim.keymap.set("n", "<S-h>", vim.cmd.bprevious)
vim.keymap.set("n", "<S-l>", vim.cmd.bnext)

-- Clear search with <esc>
vim.keymap.set({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear highlighting" })

vim.keymap.set({ "n" }, "<C-f>", "/<c-r>0<cr>N", { desc = "Search for word under cursor" })
vim.keymap.set({ "v" }, "<C-f>", "y/<c-r>0<cr>N", { desc = "Search for word under cursor" })
