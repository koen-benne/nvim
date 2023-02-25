local cmd = vim.cmd

-- functions for setting highlights
local fg_bg = require("core.utils").fg_bg
local bg = require("core.utils").bg

-- Telescope
fg_bg("TelescopeBorder", "#16161e", "#16161e")
fg_bg("TelescopePromptBorder", "#b1a1b26", "#b1a1b26")

fg_bg("TelescopePromptNormal", "#fff", "#b1a1b26")
fg_bg("TelescopePromptPrefix", "#f7768e", "#b1a1b26")

bg("TelescopeNormal", "#16161e")

fg_bg("TelescopePreviewTitle", "#000000", "#c0caf5")
fg_bg("TelescopePromptTitle", "#000000", "#f7768e")
fg_bg("TelescopeResultsTitle", "#16161e","#16161e")

bg("TelescopeSelection", "b1a1b26")
