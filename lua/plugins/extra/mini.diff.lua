return {
  {
    "echasnovski/mini.diff",
    event = "VeryLazy",
    dependencies = {
      { "echasnovski/mini-git" },
    },
    keys = {
      {
        "<leader>mdt",
        function()
          require("mini.diff").toggle_overlay(0)
        end,
        desc = "Toggle mini.diff overlay",
      },
      {
        "<leader>go",
        function()
          require("mini.diff").toggle_overlay(0)
        end,
        desc = "Toggle mini.diff overlay",
      },
      {
        "<leader>grl",
        "gH_",
        mode = { "n" },
        remap = true,
        desc = "Reset current line",
      },
      {
        "<leader>grh",
        "gHgh",
        mode = { "n" },
        remap = true,
        desc = "Reset current hunk",
      },
      {
        "<leader>gsl",
        "gh_",
        mode = { "n" },
        remap = true,
        desc = "Stage current line",
      },
      {
        "<leader>gsh",
        "ghgh",
        mode = { "n" },
        remap = true,
        desc = "Stage current hunk",
      },
    },
    opts = {
      view = {
        style = "sign",
        signs = {
          add = Carte.icons.git.added,
          change = Carte.icons.git.modified,
          delete = Carte.icons.git.removed,
        },
        priority = 199,
      },
      delay = {
        text_change = 500,
      },
    },
  },
}
