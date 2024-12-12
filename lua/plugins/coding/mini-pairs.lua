return {
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>cp",
        function()
          vim.g.minipairs_disable = not vim.g.minipairs_disable
        end,
        desc = "Toggle Auto Pairs",
      },
    },
  },
}
