-- Base lazy setup

function ColorMePretty(color)
  color = color or "tokyonight"
  return color
end

return {
  -- Add color schemes as desired
  -- { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require(ColorMePretty()).load()
      end,
    },
  },
}
