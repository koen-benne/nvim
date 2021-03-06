local colorscheme = "tokyonight"
-- local colorscheme = "everblush"

vim.g.tokyonight_style = "night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.lsp.buf.formatting() vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end
