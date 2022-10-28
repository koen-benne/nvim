local options = {
    backup = false,
    clipboard = "unnamedplus",
    completeopt = { "menu", "menuone", "noselect" },	-- cmp stuff
    mouse = "a",				                              -- allow mouse use
    smartcase = true,
    smartindent = true,
    number = true,
    pumheight = 10,                                   -- pop up menu height
    incsearch = true,
    visualbell = true,
    showtabline = 2,
    numberwidth = 2,                                  -- set number column width to 2 {default 4}
    signcolumn = "yes",                               -- always show the sign column to prevent shifting text
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    wrap = false,
    autoindent = true,
    ruler = true,
    hlsearch = true,
    relativenumber = false,
    scrolloff = 8,
    sidescrolloff = 8,
    swapfile = false,
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    laststatus = 2,                                   -- Single statusline when set to 3
    guifont = "JetBrainsMonoNL Nerd Font Mono:h15",   -- font used in GUI neovim
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Neovide opts
if vim.g.neovide then
  vim.g.neovide_transparency = 0.95
  vim.g.neovide_floating_blur_amount_x = 7.0
  vim.g.neovide_floating_blur_amount_y = 7.0
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animation_length = 0.01
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_scroll_animation_length = 0.6
  vim.g.neovide_floating_opacity = 0.6
  function ChangeScaleFactor(delta)
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
end

-- Autocommands
--[[ vim.cmd [[ ]]
--[[ augroup kitty_mp ]]
--[[   autocmd! ]]
--[[   au VimLeave * :silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=4 ]]
--[[   au VimLeave * :silent !kitty @ --to=$KITTY_LISTEN_ON set-background-opacity 0.7 ]]
--[[   au VimLeave * :silent !kitty @ --to=$KITTY_LISTEN_ON set-colors background=\#0F1410 ]]
--[[   au VimEnter * :silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=0 ]]
--[[   au VimEnter * :silent !kitty @ --to=$KITTY_LISTEN_ON set-background-opacity 1 ]]
--[[   au VimEnter * :silent !kitty @ --to=$KITTY_LISTEN_ON set-colors background=\#1a1b26 ]]
-- ]]
