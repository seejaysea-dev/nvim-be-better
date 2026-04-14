function ColorMyPencils(color)
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)
end

require("carte.autocmds")
require("carte.conf")
require("carte.remaps")
require("carte.set")
require("carte.autocmds")
require("carte.commands")

-- bootstrap lazy.nvim, LazyVim and your plugins
require("carte.lazy")
