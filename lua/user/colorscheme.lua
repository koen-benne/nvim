-- TODO: This shit needs a rewrite what the fuck is this. We need night not this storm shit
local colorscheme = "tokyonight"
-- local colorscheme = "everblush"

-- TODO: aint no way we using vim.g bruh look at the README
vim.g.tokyonight_style = "night"

-- TODO: Just create a tokyonight config file and load it in if it exists or something nice and neat
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.lsp.buf.formatting() vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end
