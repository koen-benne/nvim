local status_ok, null_ls = pcall(require, "null_ls")
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

-- The executables need to be installed separately
null_ls.setup({
  sources = {
    diagnostics.eslint, -- eslint or eslint_d
    code_actions.eslint, -- eslint or eslint_d
    formatting.prettier, -- prettier, eslint, eslint_d, or prettierd
          formatting.stylua,
  }
})
