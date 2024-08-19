-- NOTE: TodoComments works together with Trouble: https://github.com/folke/trouble.nvim
-- Available Comment Types

-- FIX:  Example
-- TODO: Example
-- HACK: Example
-- WARN: Example
-- PERF: Example
-- NOTE: Example
-- TEST: Example
-- PASSED: Example
-- FAILED: Example

return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>xx",
        "<cmd>TroubleToggle workspace_diagnostics<cr>", -- If you don't pass workspace_diagnostics you get stuck in TodoTrouble
        desc = "Toggle Trouble"
      },
    },
    opts = {
      use_diagnostic_signs = true,
    },
    enabled = true,
    init = function()
        require("trouble").setup({})
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>xt",
        "<cmd>TodoTrouble<cr>",
      },
    },
    opts = {
      highlight = {
        before = "bg",
        after = "bg",
      },
    },
    init = function()
        require("todo-comments").setup({})
    end,
  },
}
