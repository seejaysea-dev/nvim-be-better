return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    lazy = true,
    config = false,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = "Mason",
    build = ":MasonUpdate",
    keys = {
      {
        "<leader>cm",
        "<cmd>Mason<cr>",
        desc = "Mason",
      },
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "omnisharp",
        "clangd",
        "powershell_es",
        "ruff",
        "jsonls",
      },
      automatic_installation = true,
      handlers = {
        lua_ls = function()
          require("lspconfig").lua_ls.setup({
            capabilities = lsp_capabilities,
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  },
                },
              },
            },
          })
        end, -- End Lua settings
        omnisharp = function()
          require("lspconfig").omnisharp.setup({
            capabilities = lsp_capabilities,
            settings = {
              FormattingOptions = {
                EnableEditorConfigSupport = true,
                OrganizeImports = false,
              },
              RoslynExtensionsOptions = {
                EnableAnalyzersSupport = true,
              },
              Sdk = {
                IncludePrereleases = false,
              },
            },
          })
        end, -- End omnisharp settings
        powershell_es = function()
          local lsp_on_attach = function()
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "<leader>ff", function()
              vim.lsp.buf.format({ async = true })
            end, bufopts)
          end
          local bundle_path = NvimDataDirectory .. "/mason/packages/powershell-editor-services"

          require("lspconfig").powershell_es.setup({
            bundle_path = bundle_path,
            on_attach = lsp_on_attach,
            settings = {
              powershell = {
                codeFormatting = {
                  Preset = 'OTBS',
                },
              },
            },
          })
        end, -- End powershell_es settings
        function(server_name)
          require("lspconfig")[server_name].setup({ capabilities = lsp_capabilities })
        end,
      },
    },
  },
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      local cmp = require("cmp")

      return {
        sources = {
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "luasnip", keyword_length = 2 },
          { name = "buffer", keyword_length = 3 },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<Enter>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      }
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      -- lsp_attach is where you enable features that only work
      -- if there is a language server active in the file
      local lsp_attach = function(client, bufnr)
        local opts = { buffer = bufnr }

        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        float_border = "rounded",
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      lsp_zero.set_sign_icons({
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
      })

      require("mason-lspconfig").setup()
    end,
  },
}
