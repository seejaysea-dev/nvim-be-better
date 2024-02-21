-- Treesitter config

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
