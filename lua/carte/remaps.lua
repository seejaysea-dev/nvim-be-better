vim.g.mapleader = " "
-- TODO: I still don't know when to use local leader
vim.g.localleader = "\\"

vim.keymap.set("n", "<leader>qv", vim.cmd.Ex, { desc = "Open NetRW explorer" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open NetRW" })
vim.keymap.set("n", "<leader><leader>", vim.cmd.so, { desc = "Source current file" })
vim.keymap.set("n", "<leader>fw", "<cmd>w<cr>", { desc = "Write File" })
vim.keymap.set("n", "<c-s>", "<cmd>w<cr>", { desc = "Write File" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit NeoVim" })

-- Normal Mode Remaps
vim.keymap.set("n", "J", "mzJ`z", { desc = "" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "" })
vim.keymap.set("n", "n", "nzzzv", { desc = "" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "" })
vim.keymap.set("n", "<A-h>", "^", { desc = "" })
vim.keymap.set("n", "<A-l>", "$", { desc = "" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n" }, "<leader>Y", '"+yy', { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n" }, "<leader>P", 'V"0p', { desc = "Replace line with last yank" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without overwriting yank buffer" })
vim.keymap.set({ "n" }, '<leader>"', '"+yi"', { desc = 'Yank text between " to system clipboard' })
vim.keymap.set({ "n" }, "<leader>'", "\"+yi'", { desc = "Yank text between ' to system clipboard" })

-- Because I am a windows user, Ctrl+v is fundamentally broken, I have to deal with this now
vim.keymap.set("n", "<A-v>", "<C-v>")

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "" })

-- Window movements
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "" })
vim.keymap.set("n", "<leader>-", "<C-w>s", { desc = "Split window" })
vim.keymap.set("n", "<leader>|", "<C-w>v", { desc = "VSplit window" })

-- Window Resize with Ctrl + arrows
vim.keymap.set("n", "<C-A-k>", "<cmd>resize +2<cr>", { desc = "" })
vim.keymap.set("n", "<C-A-j>", "<cmd>resize -2<cr>", { desc = "" })
vim.keymap.set("n", "<C-A-h>", "<cmd>vertical resize +2<cr>", { desc = "" })
vim.keymap.set("n", "<C-A-l>", "<cmd>vertical resize -2<cr>", { desc = "" })

-- Buffer movements
vim.keymap.set("n", "<S-h>", vim.cmd.bprevious, { desc = "Previous Buffer" })
vim.keymap.set("n", "<S-l>", vim.cmd.bnext, { desc = "Next Buffer" })
vim.keymap.set("n", "<C-q>", "<cmd>bn<bar>sp<bar>bp<bar>bd<cr>", { desc = "Close buffer" })

-- Clear search with <esc>
vim.keymap.set({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear highlighting" })

vim.keymap.set(
  { "n" },
  "<C-f>",
  function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('yiw/<C-r>0<CR>N', true, false, true), 'v', false)
  end,
  { desc = "Search for word under cursor" }
)

vim.keymap.set(
  { "v" },
  "<C-f>",
  function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("y/<C-r>0<CR>N", true, false, true), 'v', false)
  end,
  { desc = "Search for word under cursor" }
)

vim.keymap.set(
  { "v" },
  "<C-c>",
  function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('"+y', true, false, true), 'v', false)
  end,
  { desc = "Copy text to system clipboard" }
)

vim.keymap.set(
  "n",
  "<leader>fn",
  function()
    vim.fn.setreg("+", vim.fn.expand("%"))
  end,
  { desc = "Copy filepath to system clipboard" })

vim.keymap.set({ "n" }, "<leader>ct", "<cmd>20split | terminal<CR>", { desc = "Open terminal emulator" })

-- Confirm this works
vim.keymap.set({ "t" }, "<localleader><localleader><localleader>", "<C-\\><C-n>", { desc = "Exit terminal insert" })
