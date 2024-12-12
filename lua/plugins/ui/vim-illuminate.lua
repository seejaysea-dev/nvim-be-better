return {
  {
    "RRethy/vim-illuminate",
    event = { "BufEnter" },
    keys = {
      {
        "<leader>crn",
        function()
          require("illuminate").goto_next_reference(false)
        end,
        desc = "Next reference",
      },
      {
        "<leader>crp",
        function()
          require("illuminate").goto_prev_reference(false)
        end,
        desc = "Prev reference",
      },
      {
        "]]",
        "<leader>crn",
        remap = true,
        desc = "Next reference",
      },
      {
        "[[",
        "<leader>crp",
        remap = true,
        desc = "Prev reference",
      },
      {
        "<leader>ui",
        function()
          require("illuminate").toggle_buf()
        end,
        desc = "Toggle vim-illiminate in current buffer",
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
}
