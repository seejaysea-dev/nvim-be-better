return {
  -- Twilight: Paired with ZenMode to focus on coding.
  {
    "folke/twilight.nvim",
    opts = {
      expand = {
        "function",
        "method",
        "table",
        "if_statement",
        "function_declaration",
        "method_declaration",
        "pair",
      },
    },
    keys = {
      {
        "<leader>chf",
        "<cmd>Twilight<cr>",
        desc = "Toggle twilight",
      },
    }
  },
  -- ZenMode: Get rid of distractions
  {
    "folke/zen-mode.nvim",
    event = { "BufEnter" },
    keys = {
      {
        "<leader>zz",
        function()
          require("zen-mode").setup({
            window = {
              width = 120,
              options = {},
            },
          })

          require("zen-mode").toggle()
          vim.wo.wrap = false
          vim.wo.number = true
          vim.wo.rnu = true
          ColorMyPencils(Carte.colors.name)
        end,
        desc = "Toggle ZenMode",
      },
    },
  },
  -- Flash, enhancing builtin search functions.
  -- config stolen from [LazyVim](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    enabled = false,
    --@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = { "o" },
        function()
          require("flash").remote()
        end,
        desc = "Flash Remote",
      },
      {
        "R",
        mode = { "x", "o" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  -- TODO: Try [fzf-lua](https://github.com/ibhagwan/fzf-lua) compared to telescope.
}
