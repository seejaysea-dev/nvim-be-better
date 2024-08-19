return {
  -- ZenMode: Get rid of distractions
  {
    "folke/zen-mode.nvim",
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
          ColorMyPencils()
        end,
        desc = "Toggle ZenMode",
      },
    },
    config = function()
      vim.keymap.set("n", "<leader>zz", function()
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
        ColorMyPencils()
      end)

      vim.keymap.set("n", "<leader>zZ", function()
        require("zen-mode").setup({
          window = {
            width = 120,
            options = {},
          },
        })

        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = false
        vim.wo.rnu = true
        vim.opt.colorcolumn = "0"
        ColorMyPencils()
      end)
    end,
  },
  -- UndoTree
  {
    "mbbill/undotree",

    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  -- Flash, enhancing builtin search functions.
  -- config stolen from [LazyVim](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
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
  -- TODO: Try [fzf-lua](https://github.com/ibhagwan/fzf-lua) compared to telescope.
}
