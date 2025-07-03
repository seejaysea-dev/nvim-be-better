return {
  {
    "echasnovski/mini.diff",
    event = "VeryLazy",
    keys = {
      {
        "<leader>go",
        function()
          require("mini.diff").toggle_overlay(0)
        end,
        desc = "Toggle mini.diff overlay",
      },
    },
    opts = {
      view = {
        style = "sign",
        signs = {
          add = "▎",
          change = "▎",
          delete = "",
        },
      },
      -- Disable mini.diff mappings. I am only using it for overlays
      mappings = {
        apply = '',
        reset = '',
        textobject = '',
        goto_first = '',
        goto_prev = '',
        goto_next = '',
        goto_last = '',
      },
    },
  },
}
