return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    -- TODO: convert to mini.icons
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    keys = {
      {
        "<leader>pf",
        "<cmd>FzfLua files<cr>",
        desc = "Find files"
      },
      {
        "<C-p>",
        "<cmd>FzfLua git_files<cr>",
        desc = "Git files"
      },
      {
        "<leader>ps",
        "<cmd>FzfLua grep<cr>",
        desc = "Grep search"
      }
    }
  }
}
