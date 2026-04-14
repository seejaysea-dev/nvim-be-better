return {
  {
    -- TODO: move to main branch of treesitter
    "nvim-treesitter/nvim-treesitter",
    version = false,
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
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
    },
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "lua"
      },
      -- TODO: Determine need for the following opts
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = false,
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
    config = function(_, opts)
      require("nvim-treesitter").install(opts.ensure_installed)
    end,
  },
}
