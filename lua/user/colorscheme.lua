local colorscheme = "tokyonight"

vim.g.tokyonight_style = "night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end
