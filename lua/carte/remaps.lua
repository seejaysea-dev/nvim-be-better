vim.g.mapleader = " "
vim.g.localleader = "\\"

local km = vim.keymap
km.set("n", "<leader>qv", vim.cmd.Ex, { desc = "Open NetRW explorer" })
km.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open NetRW" })
km.set("n", "<leader><leader>", vim.cmd.so, { desc = "Source current file" })
km.set("n", "<leader>fw", "<cmd>w<cr>", { desc = "Write File" })
km.set("n", "<C-s>", "<cmd>wa<cr>", { desc = "Write File" })
km.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit NeoVim" })

-- Normal Mode Remaps
km.set("n", "J", "mzJ`z", { desc = "" })
km.set("n", "<C-d>", "<C-d>zz", { desc = "" })
km.set("n", "<C-u>", "<C-u>zz", { desc = "" })
km.set("n", "n", "nzzzv", { desc = "" })
km.set("n", "N", "Nzzzv", { desc = "" })
km.set("n", "<A-h>", "^", { desc = "" })
km.set("n", "<A-l>", "$", { desc = "" })

km.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
km.set({ "n" }, "<leader>Y", '"+yy', { desc = "Yank line to system clipboard" })
km.set({ "n" }, "<leader>P", 'V"0p', { desc = "Replace line with last yank" })
km.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without overwriting yank buffer" })
km.set({ "n" }, '<leader>"', '"+yi"', { desc = 'Yank text between " to system clipboard' })
km.set({ "n" }, "<leader>'", "\"+yi'", { desc = "Yank text between ' to system clipboard" })
km.set(
  { "n" },
  "<C-q>",
  function()
    vim.cmd('bprevious')
    vim.cmd('vsplit')
    vim.cmd('bnext')
    vim.cmd('bdelete')
  end,
  { desc = "Close current buffer" }
)

-- Because I am a windows user, Ctrl+v is fundamentally broken, I have to deal with this now
km.set("n", "<A-v>", "<C-v>")

-- Move Lines
km.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "" })
km.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "" })
km.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "" })
km.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "" })
km.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "" })
km.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "" })

-- Window movements
km.set("n", "<C-h>", "<C-w>h", { desc = "" })
km.set("n", "<C-j>", "<C-w>j", { desc = "" })
km.set("n", "<C-k>", "<C-w>k", { desc = "" })
km.set("n", "<C-l>", "<C-w>l", { desc = "" })
km.set("n", "<leader>-", "<C-w>s", { desc = "Split window" })
km.set("n", "<leader>|", "<C-w>v", { desc = "VSplit window" })

-- Window Resize with Ctrl + arrows
km.set("n", "<C-A-k>", "<cmd>resize +2<cr>", { desc = "" })
km.set("n", "<C-A-j>", "<cmd>resize -2<cr>", { desc = "" })
km.set("n", "<C-A-h>", "<cmd>vertical resize +2<cr>", { desc = "" })
km.set("n", "<C-A-l>", "<cmd>vertical resize -2<cr>", { desc = "" })

-- Buffer movements
km.set("n", "<S-h>", vim.cmd.bprevious, { desc = "Previous Buffer" })
km.set("n", "<S-l>", vim.cmd.bnext, { desc = "Next Buffer" })
km.set("n", "<C-[>", vim.cmd.tabprev, { desc = "Previous tab" })
km.set("n", "<C-]>", vim.cmd.tabnext, { desc = "Next tab" })

km.set({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear highlighting" })

km.set(
  { "n" },
  "<C-f>",
  function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('viwy/<C-r>0<CR>N', true, false, true), 'v', false)
  end,
  { desc = "Search for word under cursor" }
)

km.set(
  { "v" },
  "<C-f>",
  function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("y/<C-r>0<CR>N", true, false, true), 'v', false)
  end,
  { desc = "Search for word under cursor" }
)

km.set(
  { "v" },
  "<C-c>",
  function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('"+y', true, false, true), 'v', false)
  end,
  { desc = "Copy text to system clipboard" }
)

km.set(
  "n",
  "<leader>fn",
  function()
    vim.fn.setreg("+", vim.fn.expand("%"))
  end,
  { desc = "Copy filepath to system clipboard" })

km.set({ "n" }, "<leader>ct", "<cmd>20split | terminal<CR>", { desc = "Open terminal emulator" })

-- Confirm this works
km.set({ "t" }, "<C-c>", "<C-\\><C-n>", { desc = "Exit terminal insert" })
