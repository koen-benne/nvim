local colorscheme = "tokyonight"
-- local colorscheme = "everblush"

local status_ok, cs = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.lsp.buf.formatting() vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end

pcall(require, "user.plugins." .. colorscheme)

vim.cmd[[colorscheme tokyonight]]
