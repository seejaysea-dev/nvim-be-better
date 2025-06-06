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
