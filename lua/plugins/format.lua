local M = {}

---@param opts conform.setupOpts
function M.setup(_, opts)
  require("conform").setup(opts)
end

return {
  {
    -- TODO: Lookup conform configuration
    "stevearc/conform.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    event = {
      "BufWritePre",
    },
    cmd = {
      "ConformInfo",
    },
    keys = {
      {
        -- Trigger format manually
        "<leader>cf",
        function()
          require("conform").format({ async = true, timeout_ms = 3000 })
        end,
        desc = "Format current buffer",
      },
    },
    --@module "conform"
    --@type conform.setupOpts
    opts = {
      -- Define formatters by filetype
      formatters_by_ft = {
        lua = { "stylua" },
        cs = { "csharpier" },
      },
      formatters = {
      },
      -- Define default format options
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Setup format on save. For now manual format only
      format_on_save = false,
      -- format_on_save = {
      --   timeout_ms = 500,
      -- },
    },
    config = M.setup,
  },
}
