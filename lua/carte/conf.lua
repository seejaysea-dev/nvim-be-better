Carte = {
  colors = {
    plugin = "catppuccin/nvim",
    name = "catppuccin",
  },
  icons = {
    diagnostics = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " ",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
    },
    kinds = {
      Array = " ",
      Boolean = "󰨙 ",
      Class = " ",
      Codeium = "󰘦 ",
      Color = " ",
      Control = " ",
      Collapsed = " ",
      Constant = "󰏿 ",
      Constructor = " ",
      Copilot = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = "󰊕 ",
      Interface = " ",
      Key = " ",
      Keyword = " ",
      Method = "󰊕 ",
      Module = " ",
      Namespace = "󰦮 ",
      Null = " ",
      Number = "󰎠 ",
      Object = " ",
      Operator = " ",
      Package = " ",
      Property = " ",
      Reference = " ",
      Snippet = " ",
      String = " ",
      Struct = "󰆼 ",
      TabNine = "󰏚 ",
      Text = " ",
      TypeParameter = " ",
      Unit = " ",
      Value = " ",
      Variable = "󰀫 ",
    },
  },
}

HomeDirectory = os.getenv("HOME") or os.getenv("USERPROFILE")

assert((HomeDirectory ~= nil), "Unable to set HomeDirectory variable")

if string.find(HomeDirectory, "/") ~= nil then
  NvimDataDirectory = HomeDirectory .. "/.local/share/nvim"
  NvimDirectory = HomeDirectory .. "/.config/nvim"
else
  NvimDataDirectory = HomeDirectory .. "\\AppData\\Local\\nvim-data"
  NvimDirectory = HomeDirectory .. "\\AppData\\Local\\nvim"
end
