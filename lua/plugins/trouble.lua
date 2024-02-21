-- NOTE: Setup trouble and todo-comments
-- Since both are from folke
return {
  {
    "folke/trouble.nvim",
    opts = {
      -- use_diagnostic_signs = true,
    },
    enabled = true,
  },
  {
    "folke/todo-comments.nvim",
    opts = {
      highlight = {
        before = "bg",
        after = "bg",
      },
    },
  },
}
