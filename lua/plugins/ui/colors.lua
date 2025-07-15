return {
  {
    "norcalli/nvim-colorizer.lua",
    opts = {},
    -- TODO: Setup keybindings
    keys = {},
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      transparent = true,
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = false },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark",   -- style for floating windows
      },
      dim_inactive = true,
      -- Setting custom highlight groups
      on_highlights = function(hl, c)
        hl.MiniDiffOverChange  = "DiffText"
        hl.MiniDiffOverContext = "DiffChange"
        hl.MiniDiffOverDelete  = "DiffDelete"
        hl.MiniDiffSignAdd     = { fg = c.green }
        hl.MiniDiffSignChange  = { fg = c.cyan }
        hl.MiniDiffSignDelete  = { fg = c.red }
      end,
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavor = "mocha",
      -- This is where to set custom colors
      custom_highlights = function(colors)
        return {
          Whitespace = { fg = colors.base },
          Comment = { fg = colors.rosewater },
          BufferLineBackground = { fg = colors.surface2 },
          BufferLineBufferSelected = { fg = colors.teal },
          -- TODO:
          -- IncSearch
          -- Search
          -- CurSearch
          -- Substitute
        }
      end,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },
}
