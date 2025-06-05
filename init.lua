function FileExists(file)
  local ok, err, _ = os.rename(file, file)
  if ok and (err ~= 13) then
    return true
  else
    return ok, err
  end
end

require("carte")
require("work")

local CarteAuGroup = vim.api.nvim_create_augroup("Carte", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
  group = CarteAuGroup,
  callback = function(e)
    local bfnmbr = e.buff
    vim.keymap.set("n", "<leader>chh", vim.lsp.buf.hover, { buffer = bfnmbr, desc = "LSP Hover" })
    vim.keymap.set("n", "<leader>chs", vim.lsp.buf.signature_help, { buffer = bfnmbr, desc = "Signature Help" })
    vim.keymap.set("n", "?", "<leader>chh", { remap = true, buffer = bfnmbr, desc = "Signature Help" })
    vim.keymap.set("n", "K", "<leader>chs", { remap = true, buffer = bfnmbr, desc = "LSP Hover" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bfnmbr, desc = "Goto Declaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bfnmbr, desc = "Goto Definition" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bfnmbr, desc = "Goto Implementation" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bfnmbr, desc = "Open Refs" })
    vim.keymap.set("n", "<leader>cf", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = bfnmbr, desc = "Format current file" })
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = bfnmbr, desc = "LSP Rename" })
  end,
})

ColorMyPencils()

local stats = vim.uv.fs_stat(vim.fn.argv(0))

if stats and stats.type == "directory" then
  Carte.RootDir = vim.uv.cwd()
end
