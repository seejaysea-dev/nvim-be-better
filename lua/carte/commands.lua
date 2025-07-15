-- vim.api.nvim_create_user_command('VimCommand', 'luaFunc', {})

---Disconnect buffer from LSP
DisconnectBufferFromLsp = function()
  local b = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.get_clients({ bufnr = b })
  for _, client in pairs(clients) do
    local logMessage = "Disconnecting buffer " .. b .. " from lsp client " .. client.name
    vim.notify(logMessage, "debug")
    vim.lsp.buf_detach_client(b, client.id)
  end
end

CheckCurrentClients = function()
  local b = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.get_clients({ bufnr = b })

  for _, client in pairs(clients) do
    local logMessage = "[" .. client.id .. "]: " .. client.name
    vim.notify(logMessage, "debug")
  end
end

vim.api.nvim_create_user_command("LspBufDetach", DisconnectBufferFromLsp, {})
vim.api.nvim_create_user_command("LspCheckAttached", CheckCurrentClients, {})
