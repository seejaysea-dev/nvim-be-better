-- NOTE: Mason and Treesitter custom config
return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    -- TODO: Redefined keyMaps to fit structure.
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
        "<cmd>InspectTree",
        desc = "Show AST"
      },
      {
        "<leader>tg",
        "<cmd>Inspect<cr>",
        desc = "Show AST Group"
      }
    },
    opts = {
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "html",
        "lua",
        "luadoc",
        "luap",
        "vim",
        "vimdoc",
        "javascript",
        "jsdoc",
        "tsx",
        "typescript",
        "json5",
      },
    },
    init = function(plugins)
      require("nvim-treesitter.query_predicates")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
