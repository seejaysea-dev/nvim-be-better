vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
          path ~= vim.fn.stdpath('config')
          and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end
  end,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  }
})

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
    init = function(_)
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
    "williamboman/mason-lspconfig.nvim",
    event = "BufEnter",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lsp", },
      { "hrsh7th/cmp-buffer", },
      { "hrsh7th/cmp-path", },
      { "hrsh7th/cmp-cmdline", },
      { "hrsh7th/nvim-cmp", },
      { "L3MON4D3/LuaSnip", },
      { "j-hui/fidget.nvim", },
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
      -- "saghen/blink.cmp",
      "hrsh7th/nvim-cmp",
      { "j-hui/fidget.nvim", opts = {} },
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
        codelens = { enabled = false },
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

      -- Finally run mason-lspconfig
      require("mason-lspconfig").setup(opts)
    end
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
        "petertriho/cmp-git"
      },
    },
    opts = function(_, _)
      local cmp = require("cmp")

      return {
        sources = cmp.config.sources({
          { name = "nvim_lsp", keyword_length = 2 },
          { name = "luasnip",  keyword_length = 4 },
        }, {
          { name = "buffer", keyword_length = 3 },
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
        formatting = {
          fields = { "menu", "abbr", "kind" },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = "λ",
              luasnip = "⋗",
              buffer = "󰈙",
            }

            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        }),
        snippet = {
          expand = function(args)
            -- luasnip? What's the benefit?
            require('luasnip').lsp_expand(args.body)
            -- vim.snippet.expand(args.body)
          end,
        },
      }
    end,
    config = function(_, opts)
      local cmp = require("cmp")

      -- initial setup
      cmp.setup(opts)

      -- git commit setup
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
        }, {
          { name = 'buffer' }
        })
      })

      -- / and ? setup
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- : setup
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        })
      })
    end,
  },
  -- Autocompletion testing blink.cmp
  {
    'saghen/blink.cmp',
    enabled = false,
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        -- NOTE: Default contains standard keymaps
        preset = 'default',
        -- C-y: accept
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation', 'show_signature', 'hide_signature' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        -- Disable this keymap. Conflicts with window nav
        ['<C-k>'] = {},
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        keyword = { range = 'prefix' },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 1000,
        },
        menu = {
          -- nvim-cmp style menu
          draw = {
            columns = {
              { "label",     "label_description", gap = 1 },
              { "kind_icon", "kind" }
            },
          }
        },
        ghost_text = { enabled = false },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      -- TODO: setup mini.snippets snippets = { preset = 'mini_snippets' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
}
