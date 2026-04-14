return {
  {
    "ibhagwan/fzf-lua",
    lazy = false,
    -- optional for icon support
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
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
        "<cmd>FzfLua files<cr>",
        desc = "Find files"
      },
      {
        "<leader>ps",
        "<cmd>FzfLua grep<cr>",
        desc = "Grep for string"
      },
    },
  }
}
