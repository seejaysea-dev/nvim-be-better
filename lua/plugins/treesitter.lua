-- NOTE: Mason and Treesitter custom config
-- Base Treesitter config. Extra options in language specific files

return {
  -- LazyVim contains extra settings for typescript and omnisharp
  -- { import = "lazyvim.plugins.extras.lang.typescript" },
  -- { import = "lazyvim.plugins.extras.lang.omnisharp" },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      {
        "<leader>tsu",
        "<cmd>TSUpdate<cr>",
        desc = "Run TSUPdate",
      },
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
        "c_sharp",
        "html",
        "lua",
        "luadoc",
        "luap",
        "vim",
        "vimdoc",
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
