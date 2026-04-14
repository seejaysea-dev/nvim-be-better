return {
  {
    "folke/trouble.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    cmd = { "Trouble" },
    event = { "BufEnter" },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cS",
        "<cmd>Trouble lsp toggle<cr>",
        desc = "Lsp references/definitions/... (Trouble)",
      },
    },
    opts = {
      modes = {
        lsp = {
          position = "right",
        },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "folke/trouble.nvim" },
    },
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufEnter" },
    keys = {
      {
        "<leader>xT",
        "<cmd>Trouble todo toggle<cr>",
        desc = "Todo (Trouble)",
      },
      -- I will use this list more often.
      {
        "<leader>xt",
        "<cmd>Trouble todo toggle filter = { tag = { TODO, FIX, FIXME }}<cr>",
        desc = "Todo/Fix/FixMe (Trouble)",
      },
      {
        "<leader>st",
        "<cmd>TodoTelescope<cr>",
        desc = "TodoTelescope",
      },
    },
    opts = {
      highlight = {
        before = "bg",
        after = "bg",
      },
    },
  },
}
