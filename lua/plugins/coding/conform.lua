return {
  {
    "stevearc/conform.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "folke/noice.nvim",
    },
    event = { "BufWritePre", "VeryLazy" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Trigger format manually
        "<localleader>f",
        function()
          require("conform").format({ async = true, timeout_ms = 3000 })
        end,
        desc = "Format current buffer",
      },
    },
    opts_extend = { "formatters_by_ft", "formatters" },
    --@module "conform"
    --@type conform.setupOpts
    opts = {
      -- Define default format options
      default_format_opts = {
        async = false,
        quiet = false,
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
      -- Define formatters by filetype
      formatters_by_ft = {
        lua = { "stylua" },
      },
      formatters = {},
      -- Setup format on save. For now manual format only
      format_on_save = function(bufnr)
        -- Ignore file extensions
        local ignore_filetypes = {
          "cs",
          "ps1",
          "psm1",
          "json",
        }

        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return false
        end

        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return false
        end

        -- Don't format certain directories
        local ignored_directories = function(bufName)
          if bufName:match("/node_modules/") then
            return true
          end

          return false
        end

        if ignored_directories(vim.api.nvim_buf_get_name(bufnr)) then
          return false
        end

        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end,
    },
    config = function(_, opts)
      local mr = require("mason-registry")
      for lang, formatters in pairs(opts.formatters_by_ft) do
        vim.notify("Installing formatters for " .. lang, vim.log.levels.DEBUG, { title = "Conform" })
        for _, formatter in ipairs(formatters) do
          vim.notify("Checking install status of " .. formatter, vim.log.levels.DEBUG, { title = "Conform" })
          local installed = mr.is_installed(formatter)
          if not installed then
            vim.notify(
              "Attempting to install " .. formatter .. " with Mason",
              vim.log.levels.INFO,
              { title = "Conform" }
            )
            vim.cmd.MasonInstall(formatter)
          else
            vim.notify(formatter .. " is already installed", vim.log.levels.DEBUG, { title = "Conform" })
          end
        end
      end

      print("Running conform setup")
      require("conform").setup(opts)
    end,
  },
}
