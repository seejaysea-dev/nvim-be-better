-- NeoTree setup
return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({
          action = "focus",
          position = "left",
          source = "filesystem",
          toggle = true,
          dir = Carte.RootDir,
        })
      end,
      desc = "Neotree Explorer (Root Dir)"
    },
    {
      "<leader>fE",
      function()
        require("neo-tree.command").execute({
          action = "focus",
          position = "left",
          source = "filesystem",
          toggle = true,
          dir = vim.uv.cwd()
        })
      end,
      desc = "Neotree Explorer (cwd)"
    },
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({
          action = "show",
          position = "left",
          source = "git_status",
          toggle = true
        })
      end,
      desc = "Git Explorer",
    },
    {
      "<leader>be",
      function()
        require("neo-tree.command").execute({
          action = "show",
          position = "left",
          source = "buffers",
          toggle = true
        })
      end,
      desc = "Buffer Explorer",
    },
    {
      "<leader>e",
      "<leader>fe",
      desc = "Toggle NeoTree (RootDir)",
      remap = true,
    },
    {
      "<leader>E",
      "<leader>fE",
      desc = "Toggle NeoTree (cwd)",
      remap = true,
    },
    {
      "<leader>pv",
      "<cmd>Ex<cr>",
      desc = "Reveal current file in netrw"
    },
  },
  opts = {
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = false },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = false,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          "thumbs.db",
        },
        never_show = {
          ".git",
          ".DS_Store",
        },
      },
    },
    sources = { "filesystem", "buffers", "git_status" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    window = {
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["<space>"] = "none",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
        ["P"] = { "toggle_preview", config = { use_float = true } },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      git_status = Carte.icons.git_status,
    },
  },
  deactivate = function() vim.cmd([[Neotree close]]) end,
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
      desc = "Start Neo-tree with directory",
      once = true,
      callback = function()
        if package.loaded["neo-tree"] then
          return
        else
          local stats = vim.uv.fs_stat(vim.fn.argv(0))
          if stats and stats.type == 'directory' then
            require("neo-tree")
          end
        end
      end,
    })
  end
}
