vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP Stuff
  -- -- LSP Configs
  use 'neovim/nvim-lspconfig'
  -- -- Helps installing LSP Servers
  use { 'williamboman/mason.nvim' }
  use { "williamboman/mason-lspconfig.nvim" }
  -- -- Helps solve code trouble
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- Custom configs go here
      }
    end
  }
  -- -- Helps with coc style renaming and other good stuff
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    })
  -- -- Shows function params
  use {
    "ray-x/lsp_signature.nvim",
  }

  -- AutoCompletions
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  -- -- Custom Snippets
  use 'L3MON4D3/LuaSnip'
 
  -- Navigation/Finders 
  -- -- Best scope, telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim', 'nvim-telescope/telescope-ui-select.nvim'} },
    config = function() require('telescope').load_extension "file_browser" end
  }
  -- -- I like knowing where i am in the directory
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }
  -- -- The OG parser/finder/previewer
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Utilities
  -- -- as the name states, bracket pairing
  use 'jiangmiao/auto-pairs'
  -- -- cool compiler stuff
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  -- -- shows similar characters in the buffer
  use {'andymass/vim-matchup', event = 'VimEnter'}
  -- -- Really cool notifications
  use 'rcarriga/nvim-notify'
  -- -- The status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- -- Content tracker, aka GIT
  use 'tpope/vim-fugitive'
  -- -- GIT Signs
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signcolumn = true, 
      })
    end
  }
  -- -- Commentry
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  -- -- ToggleTerm
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end
  }

  -- Themes
  use 'ayu-theme/ayu-vim'
  use { "catppuccin/nvim", as = "catppuccin" }
  -- -- Colorful stuff
  use 'folke/lsp-colors.nvim'


end)