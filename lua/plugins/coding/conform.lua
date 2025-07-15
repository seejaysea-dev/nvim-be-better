return {
  {
    "stevearc/conform.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    event = { "BufWritePre" },
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
    opts_extend = { "formatters_by_ft", "formatters" },
    --@module "conform"
    --@type conform.setupOpts
    ---@module "conform"
    ---@type conform.setupOpts
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
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        cs = { "csharpier" },
      },
      formatters = {
        csharpier = {
          command = "dotnet csharpier",
          args = { "--write-stdout" },
        },
      },
      -- Setup format on save. For now manual format only
      format_on_save = function(bufnr)
        -- Ignore file extensions
        local ignore_filetypes = {
          "cs",
          "ps1",
          "psm1",
        }

        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return false
        end

        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return false
        end

        -- Don't format certain directories
        local ignored_directories = function(bufName)
          if bufName:match('/node_modules/') then
            return true
          end

          return false
        end

        if ignored_directories(vim.api.nvim_buf_get_name(bufnr)) then
          return false
        end

        return {
          timeout_ms = 500,
          lsp_format = "fallback"
        }
      end,
    },
  },
}
