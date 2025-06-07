return {
  -- Twilight: Paired with ZenMode to focus on coding.
  {
    "folke/twilight.nvim",
    opts = {
      expand = {
        "function",
        "method",
        "table",
        "if_statement",
        "function_declaration",
        "method_declaration",
        "pair",
      },
    },
    keys = {
      {
        "<leader>chf",
        "<cmd>Twilight<cr>",
        desc = "Toggle twilight",
      },
    }
  },
  -- ZenMode: Get rid of distractions
  {
    "folke/zen-mode.nvim",
    event = { "BufEnter" },
    keys = {
      {
        "<leader>zz",
        function()
          require("zen-mode").setup({
            window = {
              width = 120,
              options = {},
            },
          })

          require("zen-mode").toggle()
          vim.wo.wrap = false
          vim.wo.number = true
          vim.wo.rnu = true
          ColorMyPencils(Carte.colors.name)
        end,
        desc = "Toggle ZenMode",
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  }

  -- TODO: Try [fzf-lua](https://github.com/ibhagwan/fzf-lua) compared to telescope.
}
