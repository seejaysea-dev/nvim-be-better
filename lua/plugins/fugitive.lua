return {
  {
    "tpope/vim-fugitive",
    keys = {
      {
        "<leader>gs",
        vim.cmd.Git,
        desc = "Open GitFugitive panel"
      }
    },
    config = function()
    end,
  },
}
