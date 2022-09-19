local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap
local setKeymap = vim.keymap.set

-- Make space leader key
setKeymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

setKeymap("n", "<C-e>", "<Nop>")

-- Normal mode --
-- Window nav
setKeymap("n", "<C-h>", "<C-w>h")
setKeymap("n", "<C-j>", "<C-w>j")
setKeymap("n", "<C-k>", "<C-w>k")
setKeymap("n", "<C-l>", "<C-w>l")
setKeymap("n", "a", "A")
setKeymap("n", "A", "a")

-- Resize with arrows
setKeymap("n", "<C-[>", ":vertical resize -2<CR>")
setKeymap("n", "<C-]>", ":vertical resize +2<CR>")

-- Naviagate buffers
setKeymap("n", "<S-l>", ":bnext<CR>")
setKeymap("n", "<S-h>", ":bprevious<CR>")

-- Move text up and down
setKeymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
setKeymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

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
setKeymap("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
setKeymap("v", "<", "<gv")
setKeymap("v", ">", ">gv")

-- Move text up and down
setKeymap("v", "<A-j>", ":m .+1<CR>==")
setKeymap("v", "<A-k>", ":m .-2<CR>==")
setKeymap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
setKeymap("x", "J", ":move '>+1<CR>gv-gv")
setKeymap("x", "K", ":move '<-2<CR>gv-gv")
setKeymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
setKeymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Custom --
-- Telescope --
setKeymap("", "<Leader>pp", "<cmd>lua require'telescope.builtin'.builtin{}<CR>")
-- most recently used files
setKeymap("", "<Leader>m", "<cmd>lua require'telescope.builtin'.oldfiles{}<CR>")
-- find buffer
setKeymap("", ";", "<cmd>lua require'telescope.builtin'.buffers{}<CR>")
-- find in current buffer
setKeymap("", "<Leader>/", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>")
-- bookmarks
setKeymap("", "<Leader>'", "<cmd>lua require'telescope.builtin'.marks{}<CR>")
-- git files
setKeymap("", "<Leader>g", "<cmd>lua require'telescope.builtin'.git_files{}<CR>")
-- all files
setKeymap("", "<Leader>bfs", "<cmd>lua require'telescope.builtin'.find_files{}<CR>")
-- ripgrep like grep through dir
setKeymap("", "<Leader>rg", "<cmd>lua require'telescope.builtin'.live_grep{}<CR>")
-- pick color scheme
setKeymap("", "<Leader>cs", "<cmd>lua require'telescope.builtin'.colorscheme{}<CR>")

-- NVIM Tree --
--[[ setKeymap("n", "<C-t>", "<cmd>lua require'user.plugins.nvim-tree'.toggle_tree()<CR>") ]]
setKeymap("n", "<C-t>", "<cmd>NvimTreeToggle<CR>")

-- Debugging --
setKeymap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>")
setKeymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>")
setKeymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>")
setKeymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>")
setKeymap("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
setKeymap("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.input('Breakpoint condition: '))<CR>")
setKeymap("n", "<leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
setKeymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>")

-- Gitsigns --
setKeymap("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")

-- Lazygit --
-- TODO: change exit insert mode keymap when in this window (also nice for terminal)
setKeymap("n", "<leader>lg", ":LazyGit<CR>")

