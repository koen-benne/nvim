local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap
local setKeymap = vim.keymap.set

-- Make space leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-e>", "<Nop>", opts)

-- Normal mode --
-- Window nav
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-[>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-]>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Switch between tab sizes 2 and 4
setKeymap("n", "<leader>t", function()
  if(vim.opt.shiftwidth:get() == 2) then
    vim.opt.shiftwidth = 4
    vim.opt.tabstop= 4
  else
    vim.opt.shiftwidth = 2
    vim.opt.tabstop= 2
  end
end)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Custom --
-- Telescope --
keymap("", "<Leader>pp", "<cmd>lua require'telescope.builtin'.builtin{}<CR>", opts)

-- most recently used files
keymap("", "<Leader>m", "<cmd>lua require'telescope.builtin'.oldfiles{}<CR>", opts)

-- find buffer
keymap("", ";", "<cmd>lua require'telescope.builtin'.buffers{}<CR>", opts)

-- find in current buffer
keymap("", "<Leader>/", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>", opts)

-- bookmarks
keymap("", "<Leader>'", "<cmd>lua require'telescope.builtin'.marks{}<CR>", opts)

-- git files
keymap("", "<Leader>g", "<cmd>lua require'telescope.builtin'.git_files{}<CR>", opts)

-- all files
keymap("", "<Leader>bfs", "<cmd>lua require'telescope.builtin'.find_files{}<CR>", opts)

-- ripgrep like grep through dir
keymap("", "<Leader>rg", "<cmd>lua require'telescope.builtin'.live_grep{}<CR>", opts)

-- pick color scheme
keymap("", "<Leader>cs", "<cmd>lua require'telescope.builtin'.colorscheme{}<CR>", opts)

-- NVIM Tree --
keymap("n", "<C-t>", "<cmd>lua require'user.nvim-tree'.toggle_tree()<CR>", opts)

