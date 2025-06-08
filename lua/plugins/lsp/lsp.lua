return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      {
        "<leader>tu",
        "<cmd>TSUpdate<cr>",
        desc = "Run TSUPdate",
      },
      -- AST exploration
      -- Now built into NeoVim
      {
        "<leader>tt",
        "<cmd>InspectTree<cr>",
        desc = "Show AST"
      },
      {
        "<leader>tg",
        "<cmd>Inspect<cr>",
        desc = "Show AST Group"
      },
      { "<c-space>", desc = "Increment Selection" },
      { "<bs>",      desc = "Decrement Selection", mode = "x" },
    },
    opts_extend = { "ensure_installed" },
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      ensure_installed = {},
      incremental_selection = {
        enable = false,
        -- TODO: Incremental selection?
        -- keymaps = {
        --   init_selection = "<C-space>",
        --   node_incremental = "<C-space>",
        --   scope_incremental = false,
        --   node_decremental = "<bs>",
        -- },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
      sync_install = false,
      auto_install = true,
    },
    init = function(plugins)
      require("nvim-treesitter.query_predicates")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  -- Mason, LSP manager
  {
    "mason-org/mason.nvim",
    lazy = false,
    cmd = "Mason",
    build = ":MasonUpdate",
    keys = {
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
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      { "j-hui/fidget.nvim", opts = {} },
    },
    opts_extend = { "ensure_installed" },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
        },
        inlay_hints = {
          enabled = true,
          exclude = {},
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
        codelens = { enabled = false },
        document_highlight = { enablded = true },
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
      },
      ensure_installed = {},
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

      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      vim.lsp.config("*", {
        capabilities = capabilities,
        root_markers = { '.git' },
      })

      -- Finally run mason-lspconfig
      require("mason-lspconfig").setup(opts)
    end,
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
        "hrsh7th/cmp-cmdline",
      },
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      return {
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
        window = {
          completion = {
            border = {
              { "󱐋", "WarningMsg" },
              { "─", "Comment" },
              { "╮", "Comment" },
              { "│", "Comment" },
              { "╯", "Comment" },
              { "─", "Comment" },
              { "╰", "Comment" },
              { "│", "Comment" },
            },
            scrollbar = false,
            winblend = 0,
          },
          documentation = {
            border = {
              { "󰙎", "DiagnosticHint" },
              { "─", "Comment" },
              { "╮", "Comment" },
              { "│", "Comment" },
              { "╯", "Comment" },
              { "─", "Comment" },
              { "╰", "Comment" },
              { "│", "Comment" },
            },
            scrollbar = false,
            winblend = 0,
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<cr>"] = cmp.mapping.confirm({ select = true }),
          -- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
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
}
