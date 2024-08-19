local M = {}

---@param opts conform.setupOpts
function M.setup(_, opts)
  require("conform").setup(opts)
end

return {
  {
    -- TODO: Lookup conform configuration
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Trigger format manually
        "<leader>ff",
        function()
          require("conform").format({ async = true })
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
        ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
      },
      formatters = {
        csharpier = {
          command = "dotnet-csharpier",
          args = { "--write-stdout" },
        },
        ["markdown=tock"] = {
          condition = function(_, ctx)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
              if line:find("<!%-%- toc %-%->") then
                return true
              end
            end
          end,
        },
        ["markdownlint-cli2"] = {
          condition = function(_, ctx)
            local diag = vim.tbl_filter(function(d)
              return d.source == "markdownlint"
            end, vim.diagnostic.get(ctx.buf))
            return #diag > 0
          end,
        },
      },
      -- Define default format options
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Setup format on save. For now manual format only
      -- format_on_save = {
      --     timeout_ms = 500,
      -- },
    },
  },
}
