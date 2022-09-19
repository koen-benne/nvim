local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
  options = {
    theme = 'tokyonight',
    disabled_filetypes = { 'NvimTree' },
    path = 1
  }
}

