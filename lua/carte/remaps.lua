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
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = ""})
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = ""})
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = ""})
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = ""})
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = ""})
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = ""})

-- Window movements
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = ""})
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = ""})
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = ""})
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = ""})

-- Window Resize with Ctrl + arrows
vim.keymap.set("n", "<C-A-k>", "<cmd>resize +2<cr>", { desc = ""})
vim.keymap.set("n", "<C-A-j>", "<cmd>resize -2<cr>", { desc = ""})
vim.keymap.set("n", "<C-A-h>", "<cmd>vertical resize +2<cr>", { desc = ""})
vim.keymap.set("n", "<C-A-l>", "<cmd>vertical resize -2<cr>", { desc = ""})

-- Buffer movements
vim.keymap.set("n", "<S-h>", vim.cmd.bprevious, { desc = ""})
vim.keymap.set("n", "<S-l>", vim.cmd.bnext, { desc = ""})

-- Clear search with <esc>
vim.keymap.set({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear highlighting" })

vim.keymap.set({ "n" }, "<C-f>", "/<c-r>0<cr>N", { desc = "Search for word under cursor" })
vim.keymap.set({ "v" }, "<C-f>", "y/<c-r>0<cr>N", { desc = "Search for word under cursor" })


vim.keymap.set(
  "n",
  "<leader>fn",
  function()
    local filename = BufferFileName()

    print("Setting clipboard: "..filename)
    vim.fn.setreg("+", filename)
  end,
  { desc = "Show current file name" })
