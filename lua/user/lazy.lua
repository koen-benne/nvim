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
  -- Libraries
  "kevinhwang91/promise-async", -- Some plugins need this
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  {
    "kyazdani42/nvim-web-devicons",
    config = get_config("nvim-web-devicons"),
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- Theme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  -- },

  -- Start screen
  {
    "goolord/alpha-nvim",
    lazy = false,
    priority = 999,
    config = get_config("alpha"),
  },
  {
    "ahmedkhalf/project.nvim",
    config = get_config("project"),
  },

  -- Moving throug files with s
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  -- File tree
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

  -- For time tracking
  {
    "wakatime/vim-wakatime",
  },

  -- For testing startup time
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    config = get_config("toggleterm")
  },

  -- Session management
  {
    "folke/persistence.nvim",
    config = get_config("persistence"),
  },

  -- Highlight currnet word and other occurences
  {
    "RRethy/vim-illuminate",
    config = get_config("illuminate"),
  },

  -- Key hints
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end
  },

  -- Harpoon
  "ThePrimeagen/harpoon",

  -- Neorg notes
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.summary"] = {},
          ["core.journal"] = {},
          ["core.ui.calendar"] = {},
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp"
            },
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                personal = "~/notes/personal",
                work = "~/notes/work",
                stage = '~/notes/stage'
              },
              default_workspace = "stage",
            },
          },
        },
      }
    end,
  },

  {
    "3rd/image.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = get_config("image"),
  },

  -- Auto stuff
  {
    "windwp/nvim-autopairs",
    config = get_config("autopairs"),
  }, -- Autopairs, integrates with both cmp and treesitter
  "windwp/nvim-ts-autotag",

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = get_config("telescope"),
  }, -- One of the best plugins ever

  -- {
  --   "akinsho/bufferline.nvim",
  --   dependencies = "kyazdani42/nvim-web-devicons",
  --   config = get_config("bufferline"),
  -- },

  -- Tab guide
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = get_config("indent-blankline"),
  },

  -- Git stuff
  {
    "lewis6991/gitsigns.nvim",
    config = get_config("gitsigns"),
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
  {
    "simrat39/rust-tools.nvim",
  },
  "glepnir/lspsaga.nvim",
  "onsails/lspkind.nvim",
  "b0o/SchemaStore.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  {
    "zbirenbaum/copilot.lua",
    config = get_config("copilot"),
  },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   config = function()
  --     require("chatgpt").setup({
  --       api_key_cmd = "pass show api/tokens/openai",
  --     })
  --   end,
  -- },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
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
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },

  -- Better folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = get_config("ufo"),
  },

  -- Sytnax aware text-objects
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- Statusline
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

  -- Dont know if i need this
  "tpope/vim-ragtag",
  "tpope/vim-eunuch",

  -- Shows Colors of hex codes etc.
  {
    "norcalli/nvim-colorizer.lua",
    config = get_config("nvim-colorizer"),
  },

  -- Commmenting
  {
    "numToStr/Comment.nvim",
    config = get_config("comment")
  },

  -- Editorconfig
  "gpanders/editorconfig.nvim",
})

