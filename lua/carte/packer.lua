return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Treesitter for AST
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  -- VIM Fugitive: GIT Wrapper
  use 'tpope/vim-fugitive'

  -- LSP Zero: No effort LSP setup
    use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }

  -- Trouble setup
  use {
  	  'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
  	  require("trouble").setup {
  	  }
    end
  }

  -- Neotree file explorer
  use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
      }
  }

  -- Comment utility (TODO)
  use {
      "folke/todo-comments.nvim"
  

  use {
      'nvim-lualine/lualine.nvim',
      as = "lualine",
      requires = { 'kyazdani42/nvim-web-devicons', opt = true, theme='nord' }
  }

  -- Setup color scheme
  use({
      'rose-pine/neovim',
      as = 'rose-pine',
  })

  -- gruvbox-material
  use {
      "sainnhe/gruvbox-material",
      config = function()
          vim.o.background = "dark"
          vim.g.gruvbox_material_background = "hard"
      end,
  }
end)
