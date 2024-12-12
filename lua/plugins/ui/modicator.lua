return {
  {
    -- Cursor coloring
    "mawkler/modicator.nvim",
    dependencies = Carte.colors.plugin,
    opts = { show_warnings = true },
    init = function()
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
  }
}
