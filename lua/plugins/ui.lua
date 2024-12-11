return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "echasnovski/mini.bufremove",
    },
    event = "VeryLazy",
    keys = {
      { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",     desc = "Prev Buffer" },
      { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",     desc = "Next Buffer" },
      { "<C-q>",      "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>", desc = "Close Current Buffer" }, -- https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
      { "<leader>qp", "<C-q>",                            desc = "Close current buffer", remap = true },
    },
    opts = {
      options = {
        close_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        right_mouse_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 250,
      render = "compact",
      stages = "slide",
      fps = 60,
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {},
      },
      cmdline = {
        view = "cmdline",
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    keys = {
      {
        "<leader>snl",
        function()
          require("noice").cmd("last")
        end,
        desc = "Noice: Last Message",
      },
      {
        "<leader>snh",
        function()
          require("noice").cmd("history")
        end,
        desc = "Noice: Message History"
      },
      {
        "<leader>sna",
        function()
          require("noice").cmd("all")
        end,
        desc = "Noice: All Messages"
      },
      {
        "<leader>snd",
        function()
          require("noice").cmd("dismiss")
        end,
        desc = "Noice: Dismiss All"
      },
    },
    config = function(_, opts)
      if vim.o.filetype == "lazy" then
        vim.cmd([[messages clear]])
      end

      require("noice").setup(opts)
    end,
  },
}
