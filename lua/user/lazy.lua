local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

local function get_config(name)
  return function()
    local ok = pcall(require, "user.plugins." .. name)
    if not ok then
      print("Error loading config at user.plugins." .. name)
    end
  end
end

-- Install your plugins here
lazy.setup({
  -- Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Start screen
  {
    "goolord/alpha-nvim",
    lazy = false,
    priority = 1000,
    config = get_config("alpha"),
  },
  {
    "ahmedkhalf/project.nvim",
    config = get_config("project"),
  },

  -- File tree plugin
  --[[ { ]]
  --[[   "kyazdani42/nvim-tree.lua", ]]
  --[[   keys = { ]]
  --[[     { "<C-t>", ":NvimTreeToggle<CR>", desc = "NvimTree" } ]]
  --[[   }, ]]
  --[[   config = get_config("nvim-tree"), ]]
  --[[   enabled = false, ]]
  --[[ }, ]]

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<C-t>", ":NvimTreeToggle<CR>", desc = "NeoTree" }
    },
    config = get_config("neo-tree"),
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },

  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  }, -- For testing startup time

  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  {
    "kyazdani42/nvim-web-devicons",
    config = get_config("nvim-web-devicons"),
  }, -- Necessary for some plugins
  {
    "akinsho/toggleterm.nvim",
    config = get_config("toggleterm")
  }, -- Terminal
  {
    "folke/persistence.nvim",
    config = get_config("persistence"),
  }, -- Session management
  {
    "RRethy/vim-illuminate",
    config = get_config("illuminate"),
  }, -- Highlight current word and other occurences
  "kevinhwang91/promise-async", -- Some plugins need this

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- Harpoon
  "ThePrimeagen/harpoon",

  -- Auto stuff
  {
    "windwp/nvim-autopairs",
    config = get_config("autopairs"),
  }, -- Autopairs, integrates with both cmp and treesitter
  "windwp/nvim-ts-autotag",

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    config = get_config("telescope"),
  }, -- One of the best plugins ever
  "nvim-telescope/telescope-media-files.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = get_config("bufferline"),
  },

  -- Tab guide
  {
    "lukas-reineke/indent-blankline.nvim",
    config = get_config("indent-blankline"),
  },

  -- Git stuff
  {
  {
    "lewis6991/gitsigns.nvim",
    config = get_config("gitsigns"),
  },
  -- tag = 'release' -- To the latest release
  },

  -- LSP tingz
  -- Package manager
  {
    "williamboman/mason.nvim",
    config = get_config("mason"),
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = get_config("lsp.mason-lspconfig"),
  },
  {
    "neovim/nvim-lspconfig",
    config = get_config("lsp"),
  },
  "simrat39/rust-tools.nvim",

  "glepnir/lspsaga.nvim",
  "b0o/SchemaStore.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  {
    "zbirenbaum/copilot.lua",
    config = get_config("copilot"),
  },
  "onsails/lspkind.nvim",

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "saecki/crates.nvim",
    },
    config = get_config("cmp"),
  },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    config = get_config("nvim-dap"),
  },
  "leoluz/nvim-dap-go",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "nvim-telescope/telescope-dap.nvim",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
    config = get_config("treesitter"),
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = get_config("ufo"),
  },

  "nvim-treesitter/nvim-treesitter-textobjects",

  -- Bottom bar
  {"nvim-lualine/lualine.nvim", config = get_config("lualine")},

  -- Tags
  "preservim/tagbar",
  "universal-ctags/ctags",

  -- Rainbow brackets
  "p00f/nvim-ts-rainbow",

  -- Handy stuff for changing brackets with cs
  "tpope/vim-surround",

  -- So that I can see where whitespaces are
  "ntpeters/vim-better-whitespace",

  -- Should check these
  "tpope/vim-ragtag",
  "tpope/vim-unimpaired",

  "tpope/vim-eunuch",
  "tpope/vim-fugitive",

  {
    "norcalli/nvim-colorizer.lua",
    config = get_config("nvim-colorizer"),
  },

  -- Commmenting
  {
    "numToStr/Comment.nvim",
    config = get_config("comment")
  },
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Editorconfig
  "gpanders/editorconfig.nvim",
})

