-- Base lazy setup
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  change_detection = { notify = true },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
    icons = {
      misc = {
        dots = "󰇘",
      },
    },
    dap = {
      Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint = " ",
      BreakpointCondition = " ",
      BreakpointRejected = { " ", "DiagnosticError" },
      LogPoint = ".>",
    },
    diagnostics = Carte.icons.diagnostics,
    git = Carte.icons.git,
    kinds = Carte.icons.kinds,
  },
})
