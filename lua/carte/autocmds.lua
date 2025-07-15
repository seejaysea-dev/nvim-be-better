local function augroup(name)
  return vim.api.nvim_create_augroup("carte_" .. name, { clear = true })
end
local autocmd = vim.api.nvim_create_autocmd

-- Trim all trailing whitespace on save
autocmd({ "BufWritePre" }, {
  group = augroup("trim_whitespace"),
  pattern = { "*.lua" },
  callback = function(_)
    local save_cursor = vim.fn.getpos(".")
    pcall(function()
      vim.cmd([[%s/\s\+$//e]])
    end)
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Run conform on specific files
autocmd({ "BufWritePre" }, {
  group = augroup("run_formatter"),
  pattern = { "*.lua" }, -- Start with just Lua files
  callback = function(ev)
    require("conform").format()
  end,
})

-- Stolen from ThePrimeagen [init.lua](https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/init.lua)
autocmd("LspAttach", {
  group = augroup("lsp"),
  callback = function(e)
    local bfnmbr = e.buff
    vim.keymap.set("n", "<leader>chh", vim.lsp.buf.hover, { buffer = bfnmbr, desc = "LSP Hover" })
    vim.keymap.set("n", "<leader>chs", vim.lsp.buf.signature_help, { buffer = bfnmbr, desc = "Signature Help" })
    vim.keymap.set("n", "?", "<leader>chs", { remap = true, buffer = bfnmbr, desc = "Signature Help" })
    vim.keymap.set("n", "K", "<leader>chh", { remap = true, buffer = bfnmbr, desc = "LSP Hover" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bfnmbr, desc = "Goto Declaration" })
    vim.keymap.set("n", "D", vim.lsp.buf.type_definition, { buffer = bfnmbr, desc = "Goto Type Definition" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bfnmbr, desc = "Goto Definition" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bfnmbr, desc = "Goto Implementation" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bfnmbr, desc = "Open Refs" })
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = bfnmbr, desc = "LSP Rename" })
    vim.keymap.set(
      "n",
      "<leader>cf",
      function() vim.lsp.buf.format({ async = true }) end,
      { buffer = bfnmbr, desc = "Format current file" }
    )
  end,
})

-- Stolen from lazyvim [autocmds](https://www.lazyvim.org/configuration/general#auto-commands)
-- Check if file needs to be reloaded
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- Close some buffers with 'q'
autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "fugitive",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})
