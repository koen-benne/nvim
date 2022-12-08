local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "dstein64/vim-startuptime" -- For testing startup time
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "kyazdani42/nvim-web-devicons" -- Necessary for some plugins
  use "akinsho/toggleterm.nvim" -- Terminal
  use "folke/persistence.nvim"
  use "RRethy/vim-illuminate"

  -- File tree plugin
  use {"kyazdani42/nvim-tree.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.plugins.nvim-tree"
      end, 100)
    end,
  }

  use "stevearc/dressing.nvim"

  -- Harpoon
  use "ThePrimeagen/harpoon"

  -- Auto stuff
  use {
    "windwp/nvim-autopairs",
    after = { "nvim-cmp" },
    config = function()
      vim.defer_fn(function()
        require "user.plugins.autopairs"
      end, 100)
    end,
  } -- Autopairs, integrates with both cmp and treesitter
  use "windwp/nvim-ts-autotag"

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.plugins.telescope"
      end, 100)
    end,
  } -- One of the best plugins ever
  use {
    "nvim-telescope/telescope-media-files.nvim",
    after = { "telescope.nvim" }
  }
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    after = { "telescope.nvim" }
  }

  -- Epic bar
  --[[ use "romgrk/barbar.nvim" ]]
  use {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }

  -- Tab guide
  use "lukas-reineke/indent-blankline.nvim"

  -- Git stuff
  use {
  "lewis6991/gitsigns.nvim",
  -- tag = 'release' -- To use the latest release
  }

  -- LSP tingz
  use {
    "neovim/nvim-lspconfig",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.plugins.lsp"
      end, 100)
    end
  }
  -- Package manager
  use "williamboman/mason.nvim"
  use {"williamboman/mason-lspconfig.nvim",
    after = { "nvim-lspconfig" },
    config = function()
      vim.defer_fn(function()
        require "user.plugins.lsp.mason-lspconfig"
      end, 100)
    end
  }

  use "glepnir/lspsaga.nvim"
  use "b0o/SchemaStore.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  -- use "github/copilot.vim"
  use {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.plugins.copilot"
      end, 100)
    end
  }
  use "onsails/lspkind.nvim"

  -- Autocompletion
  use {
    "hrsh7th/nvim-cmp",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.plugins.cmp"
      end, 100)
    end,
  }
  use {"hrsh7th/cmp-nvim-lsp", after = { "nvim-cmp" }}
  use {"hrsh7th/cmp-buffer", after = { "nvim-cmp" }}
  use {"hrsh7th/cmp-path", after = { "nvim-cmp" }}
  use {"hrsh7th/cmp-cmdline", after = { "nvim-cmp" }}
  use {"saadparwaiz1/cmp_luasnip", after = { "nvim-cmp" }}
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    config = function ()
      require("copilot_cmp").setup()
    end
  }
  use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    after = { "nvim-cmp" },
    config = function()
      require('crates').setup()
    end,
  }

  -- Snippets
  use {"L3MON4D3/LuaSnip", after = { "nvim-cmp" }}
  -- use "rafamadriz/friendly-snippets"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "leoluz/nvim-dap-go"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "nvim-telescope/telescope-dap.nvim"

  -- Start screen
  use "goolord/alpha-nvim"
  use "ahmedkhalf/project.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate'
  }
  use "nvim-treesitter/nvim-treesitter-textobjects"

  -- Bottom bar
  use "nvim-lualine/lualine.nvim"

  -- Tags
  use "preservim/tagbar"
  use "universal-ctags/ctags"

  -- Rainbow brackets
  use "p00f/nvim-ts-rainbow"

  -- Handy stuff for changing brackets with cs
  use "tpope/vim-surround"

  -- So that I can see where whitespaces are
  use "ntpeters/vim-better-whitespace"

  -- Themes
  use "haishanh/night-owl.vim"
  use "folke/tokyonight.nvim"
  use "mangeshrex/everblush.vim"

  -- Should check these
  use "tpope/vim-ragtag"
  use "tpope/vim-unimpaired"

  use "tpope/vim-eunuch"
  use "tpope/vim-fugitive"

  use "norcalli/nvim-colorizer.lua"

  -- Commmenting
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Editorconfig
  use "gpanders/editorconfig.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

