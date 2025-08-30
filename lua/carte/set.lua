vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.ignorecase = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "120"

vim.cmd.set("listchars=space:·,tab:󰄾_,trail:|,nbsp:+")
vim.cmd.set("list")

-- vim.cmd required to set splitright and splitbelow
vim.cmd.set("splitright")
vim.cmd.set("splitbelow")

-- Set powershell 7 as default on Windows
local os_name = os.getenv("OS")

if os_name == "Windows_NT" then
  vim.opt.shell = 'pwsh'
  vim.opt.encoding = 'utf-8'
  vim.opt.fileencoding = 'utf-8'
end

-- vim.cmd required to set splitright and splitbelow
vim.cmd.set("splitright")
vim.cmd.set("splitbelow")
