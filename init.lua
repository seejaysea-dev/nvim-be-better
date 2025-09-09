require("carte")

local ok, _ = pcall(require, 'work')

if not ok then
  vim.notify("Enable to load work modules", "warn")
end

-- Set colors
ColorMyPencils("catppuccin")
