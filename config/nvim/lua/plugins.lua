return require('packer').startup(function()

  use 'wbthomason/packer.nvim'
  use '9mm/vim-closer'
  use 'karb94/neoscroll.nvim'
  use 'neovim/nvim-lspconfig'

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use 'nvim-treesitter/completion-treesitter'
  use 'nvim-lua/completion-nvim'
  use 'steelsojka/completion-buffers'
  use 'Shougo/neosnippet.vim'
  use 'Shougo/neosnippet-snippets'
  use 'romgrk/barbar.nvim'

  use 'wfxr/minimap.vim'

  use 'sbdchd/neoformat'

  use 'marko-cerovac/material.nvim'
  use 'sainnhe/edge'
  use {'olimorris/onedark.nvim',
	requires = 'rktjmp/lush.nvim'
      }
  
  use 'Yggdroot/indentLine'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- You can specify rocks in isolation
  use_rocks 'penlight'
  use_rocks {'lua-resty-http', 'lpeg'}

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

end)

