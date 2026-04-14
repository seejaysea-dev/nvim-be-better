return {
  -- Mason, LSP manager
  {
    "mason-org/mason.nvim",
    lazy = false,
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        ignore_done_already = false,
        ignore_empty_message = false,
      },
      notification = {
        filter = vim.log.levels.DEBUG,
      },
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = "BufEnter",
    dependencies = {
      {
        -- Mason, LSP manager
        "mason-org/mason.nvim",
        lazy = false,
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        }
      },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/nvim-cmp" },
      { "j-hui/fidget.nvim" },
      { "neovim/nvim-lspconfig" },
      { "j-hui/fidget.nvim" },
    },
    keys = {
      {
        "<leader>cli",
        "<cmd>LspInfo<cr>",
        desc = "LSP Info",
      },
      {
        "<leader>cls",
        "<cmd>LspStop<cr>",
        desc = "Stop LSP",
      },
      {
        "<leader>clS",
        "<cmd>LspStart<cr>",
        desc = "Start LSP",
      },
      {
        "<leader>cm",
        "<cmd>Mason<cr>",
        desc = "Mason",
      },
      {
        "<leader>cl",
        "<cmd>LspInfo<cr>",
        desc = "LSP Info",
      }
    },
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "lua_ls",
      },
      ---@type vim.diagnostic.Opts
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
        },
        inlay_hints = {
          enabled = true,
          exclude = { "vue" },
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = Carte.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = Carte.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = Carte.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = Carte.icons.diagnostics.Info,
          },
        },
        codelens = { enabled = true },
        document_highlight = { enabled = true },
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
      },
      automatic_installation = true,
      automatic_enable = true,
    },
    config = function(_, opts)
      opts.diagnostics.virtual_text.prefix = function(diagnostic)
        local icons = Carte.icons.diagnostics
        for d, icon in pairs(icons) do
          if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
            return icon
          end
        end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      -- NOTE: Testing blink.cmp
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      -- Finally run mason-lspconfig
      require("mason-lspconfig").setup(opts)
    end
  },
}
