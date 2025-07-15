return {
  {
    -- Cursor coloring
    "mawkler/modicator.nvim",
    dependencies = {
      "catppuccin/nvim",
    },
    opts = { show_warnings = true },
    init = function()
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
  }
}
