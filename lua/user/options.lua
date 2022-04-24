local options = {
    backup = false,
    clipboard = "unnamedplus",
    completeopt = { "menu", "menuone", "noselect" },		-- cmp stuff
    mouse = "a",				                            -- allow mouse use
    smartcase = true,
    laststatus = 3,                                         -- Single statusline
    smartindent = true,
    number = true,
    pumheight = 10,                                         -- pop up menu height
    incsearch = true,
    visualbell = true,
    showtabline = 2,
    numberwidth = 2,                                        -- set number column width to 2 {default 4}
    signcolumn = "yes",                                     -- always show the sign column to prevent shifting text
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
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

