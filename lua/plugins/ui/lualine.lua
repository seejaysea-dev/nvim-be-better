local recordingStatus = function()
  local rec_register = vim.fn.reg_recording()

  if rec_register == "" then
    return ""
  else
    return "Recording @" .. rec_register
  end
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {},
  event = "VeryLazy",
  opts = function()
    local icons = Carte.icons

    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
      },
      sections = {
        lualine_a = {
          { "mode" },
        },
        lualine_b = {
          { "filetype", icon_only = true, separator = " ", padding = { left = 1, right = 0 } },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_c = {
        },
        lualine_x = {
          { "filename" },
          { recordingStatus, padding = { left = 1, right = 1 }, separator = " " },
        },
        lualine_y = {
          {
            "diff",
            colored = true,
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local signs = vim.b.minidiff_summary

              if signs then
                return {
                  added = signs.add,
                  modified = signs.change,
                  removed = signs.delete
                }
              end

              return {}
            end,
          },
        },
        lualine_z = {
          -- { "progress", padding = { left = 1, right = 0 }, separator = " " },
          { "location", padding = { left = 0, right = 1 } },
          { "branch" },
        },
      },
      extensions = { "neo-tree", "lazy" },
    }

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
      hl_group = "lualine_c_normal",
    })
    table.insert(opts.sections.lualine_c, {
      symbols and symbols.get,
      cond = function()
        return vim.b.trouble_lualine ~= false and symbols.has()
      end,
    })

    return opts
  end,
}
