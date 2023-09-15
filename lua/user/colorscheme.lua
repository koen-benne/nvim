-- local colorscheme = "tokyonight"
local colorscheme = "kanagawa"

local status_ok, cs = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end

pcall(require, "user.plugins." .. colorscheme)
