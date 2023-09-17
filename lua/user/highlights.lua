-- functions for setting highlights
local function fg_bg(group, guifg, guibg)
  vim.cmd('hi ' .. group .. ' guibg=' .. guibg .. ' guifg=' .. guifg)
end
local function bg(group, guibg)
  vim.cmd('hi ' .. group .. ' guibg=' .. guibg)
end

-- Telescope
fg_bg("TelescopeBorder", "#15151e", "#15151e")
fg_bg("TelescopePromptBorder", "#1a1b26", "#1a1b26")

fg_bg("TelescopePromptNormal", "#fff", "#1a1b26")
fg_bg("TelescopePromptPrefix", "#957fb8", "#b1a1b26")

bg("TelescopeNormal", "#15151e")
bg("TelescopeMatching", "#b1a1b26")
bg("TelescopeSelectionCaret", "#957fb8")
bg("TelescopeSelection", "#b1a1b26")
bg("TelescopeMultiSelection", "#b1a1b26")

fg_bg("TelescopePreviewTitle", "#000000", "#7e9cd8")
fg_bg("TelescopePromptTitle", "#000000", "#957fb8")
fg_bg("TelescopeResultsTitle", "#15151e","#15151e")

bg("TelescopeSelection", "b1a1b26")

-- Neo tree
bg("NeoTreeNormal", "#15151e")
bg("NeoTreeFloatBorder", "#15151e")
fg_bg("NeoTreeFloatTitle", "#000000", "#957fb8")
bg("NeoTreeCursorLine", "#3b323e")

vim.api.nvim_set_hl(0, "FloatBorder", { ctermbg = "None" } )
vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg = "None" } )

