return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {
      "default-title",
      fzf_colors = true,
      fzf_opts = {
        ['--no-scrollbar'] = true,
      },
      defaults = {
        formatter = "path.filename_first"
      },
    },
    keys = {
      {
        "<c-p>",
        "<cmd>FzfLua git_files<cr>",
        desc = "Find files in git repo"
      },
      {
        "<leader>pf",
        "<cmd>FzfLua git_files<cr>",
        desc = "Find files in git repo"
      },
      {
        "<leader>pF",
        "<cmd>FzfLua files<cr>",
        desc = "Find files"
      },
    },
  }
}
