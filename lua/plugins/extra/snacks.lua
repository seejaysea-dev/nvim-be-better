return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      animate = { enabled = false },
      -- TODO: Confirm bigfile settings
      bigfile = { enabled = true },
      dim = { enabled = false },
      notifier = { enabled = true },
      util = { enabled = false },
      indent = { enabled = true },
    },
    -- TODO: Setup keys
    keys = {
    },
  }
}
