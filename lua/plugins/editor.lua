return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {},
      spec = {
        {
          mode = { "n", "v" },
          -- TODO: Redefined keyMaps to fit structure.
          { "<leader><tab>", group = "tabs" },
          { "<leader>c", group = "code" },
          { "<leader>cr", group = "code references" },
          { "<leader>ch", group = "code help" },
          { "<leader>f", group = "file/find" },
          { "<leader>g", group = "git" },
          { "<leader>gh", group = "hunks" },
          { "<leader>q", group = "quit/session" },
          { "<leader>s", group = "search" },
          { "<leader>sn", group = "noice" },
          { "<leader>t", group = "treesitter" },
          { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
          { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
          { "<leader>z", group = "experiments", icon = { icon = "󰙨 ", color = "red" } },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
          { "gs", group = "surround" },
          { "z", group = "fold" },
          {
            "<leader>b",
            group = "buffer",
            expand = function()
              return require("which-key.extras").expand.buf()
            end,
          },
          { "<leader>bi", group = "buffer info" },
          {
            "<leader>w",
            group = "windows",
            proxy = "<c-w>",
            expand = function()
              return require("which-key.extras").expand.win()
            end,
          },
          -- better descriptions
          { "gx", desc = "Open with system app" },
        },
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
    -- TODO: Redefined keyMaps to fit structure.
    keys = {
      {
        "<leader>cp",
        function()
          vim.g.minipairs_disable = not vim.g.minipairs_disable
        end,
        desc = "Toggle Auto Pairs",
      },
    },
  },
  {
    "echasnovski/mini.diff",
    event = "VeryLazy",
    keys = {
      {
        "<leader>go",
        function()
          require("mini.diff").toggle_overlay(0)
        end,
        desc = "Toggle mini.diff overlay"
      },
    },
    opts = {
      view = {
        style = "sign",
        signs = {
          add = "▎",
          change = "▎",
          delete = "",
        },
      },
    }
  },
  -- gitsigns vs minidiff?
  -- git signs highlights text that has changed since the last git commit
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")
        map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
        map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
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
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "LspAttach" },
    ---@module 'ibl'
    ---@type ibl.config
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        show_start = false,
        show_end = false,
      },
    },
    main = "ibl",
  },
}
