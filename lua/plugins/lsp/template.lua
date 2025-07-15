if true then return {} end

-- Template for setting new lsp configs
return {
  -- REQUIRED: treesitter and mason-lspconfig.
  --
  -- These setup the `"ensure_installed"` opts
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {}
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "omnisharp",
        "csharpier",
        "netcoredbg",
      },
    },
  },
  -- OPTIONAL: Other plugins
  -- conform sets up formatting
  {
    "stevearc/conform.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    optional = true,
    --@module "conform"
    --@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },
      formatters = {
        csharpier = {
          command = "dotnet-csharpier",
          args = { "--write-stdout" },
        },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.csharpier)
    end,
  },
}
