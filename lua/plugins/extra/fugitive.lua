return {
  {
    "tpope/vim-fugitive",
    event = "BufEnter",
    keys = {
      {
        "<leader>gf",
        vim.cmd.Git,
        mode = { "n" },
        desc = "Vim Fugitive",
      },
      {
        "<leader>gdv",
        "<cmd>Gvdiffsplit HEAD~1<cr>",
        mode = { "n" },
        desc = "Open diff split with previous version",
      },
      {
        "<leader>ga",
        "<cmd>Gwrite<cr>",
        mode = { "n" },
        desc = "Stage file in current buffer",
      },
      {
        "<leader>gA",
        "<cmd>Gwrite<cr><cmd>bp<bar>sp<bar>bn<bar>bd<cr>", -- Close command ref ../ui/bufferline.lua:11
        mode = { "n" },
        desc = "Stage and close file in current buffer",
      },
      {
        "<leader>gQ",
        "<cmd>Gwrite<cr><cmd>qa<cr>",
        mode = { "n" },
        desc = "Stage file and close nvim"
      },
    },
  },
}
