local status_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_lsp then
  return
end

mason_lspconfig.setup {
  ensure_installed = {
    "lua_ls",
    "jsonls",
    "rust_analyzer",
    "cssmodules_ls",
    "cssls",
    "html",
    "clangd",
    "tsserver",
  },
}

local opts = {
    on_attach = require("user.plugins.lsp.handlers").on_attach,
    capabilities = require("user.plugins.lsp.handlers").capabilities,
  }

mason_lspconfig.setup_handlers {
    function (server_name) -- default handler
        require("lspconfig")[server_name].setup(opts)
    end,

    ["rust_analyzer"] = function ()
      local rust_opts = require "user.plugins.lsp.settings.rust"
      require("rust-tools").setup(rust_opts)
    end,

    ["clangd"] = function ()
      local clangd_opts = require "user.plugins.lsp.settings.clangd"
      require("lspconfig").clangd.setup(vim.tbl_deep_extend("force", clangd_opts, opts))
    end,

    ["lua_ls"] = function ()
      local lua_ls_opts = require "user.plugins.lsp.settings.lua_ls"
      require("lspconfig").lua_ls.setup(vim.tbl_deep_extend("force", lua_ls_opts, opts))
    end,

    ["jsonls"] = function ()
      local jsonls_opts = require "user.plugins.lsp.settings.jsonls"
      require("lspconfig").jsonls.setup(vim.tbl_deep_extend("force", jsonls_opts, opts))
    end,

    ["pyright"] = function ()
      local pyright_opts = require "user.plugins.lsp.settings.pyright"
      require("lspconfig").pyright.setup(vim.tbl_deep_extend("force", pyright_opts, opts))
    end,

    ["emmet_ls"] = function ()
      local emmet_opts = require "user.plugins.lsp.settings.emmet_ls"
      require("lspconfig").emmet_ls.setup(vim.tbl_deep_extend("force", emmet_opts, opts))
    end,

    ["cssmodules_ls"] = function ()
      local cssmodules_opts = require "user.plugins.lsp.settings.cssmodules_ls"
      require("lspconfig").cssmodules_ls.setup(vim.tbl_deep_extend("force", cssmodules_opts, opts))
    end,
}

