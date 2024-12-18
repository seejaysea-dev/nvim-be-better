return {
  -- Flash, enhancing builtin search functions.
  -- config stolen from [LazyVim](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    --@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = { "o" },
        function()
          require("flash").remote()
        end,
        desc = "Flash Remote",
      },
      {
        "R",
        mode = { "x", "o" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
}
