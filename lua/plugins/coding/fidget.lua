return {
  {
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        ignore_done_already = false,
        ignore_empty_message = true,
      },
      notification = {
        filter = vim.log.levels.INFO,
      },
    }
  },
}
