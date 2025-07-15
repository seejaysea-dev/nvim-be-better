return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {},
      spec = {
        {
          mode = { "n", "v" },
          { "<leader><tab>", group = "tabs" },
          { "<leader>c", group = "code" },
          { "<leader>cr", group = "code references" },
          { "<leader>ch", group = "code help" },
          { "<leader>f", group = "file/find" },
          { "<leader>fb", group = "in current buffer" },
          { "<leader>g", group = "git" },
          { "<leader>gc", group = "commits" },
          { "<leader>gd", group = "diffs" },
          { "<leader>gr", group = "reset" },
          { "<leader>gs", group = "stage" },
          { "<leader>q", group = "quit/session" },
          { "<leader>p", group = "project" },
          { "<leader>s", group = "search" },
          { "<leader>sn", group = "noice" },
          { "<leader>t", group = "treesitter" },
          { "<leader>m", group = "Microsoft", icon = { icon = "󰨡", color = "green" } },
          { "<leader>mm", group = "migrations" },
          { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
          { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
          { "<leader>z", group = "experiments", icon = { icon = "󰙨 ", color = "red" } },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
          { "gs", group = "surround" },
          { "z", group = "fold" },
          {
            "<leader>b",
            group = "buffer",
            expand = function()
              return require("which-key.extras").expand.buf()
            end,
          },
          { "<leader>bi", group = "buffer info" },
          {
            "<leader>w",
            group = "windows",
            proxy = "<c-w>",
            expand = function()
              return require("which-key.extras").expand.win()
            end,
          },
          -- better descriptions
          { "gx",         desc = "Open with system app" },
        },
      },
    },
  },
}
