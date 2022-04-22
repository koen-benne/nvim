local status_ok, null_ls = pcall(require, "null_ls")
if not status_ok then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint, -- eslint or eslint_d
    null_ls.builtins.code_actions.eslint, -- eslint or eslint_d
    null_ls.builtins.formatting.prettier -- prettier, eslint, eslint_d, or prettierd
  }
})
