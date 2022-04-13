" >> load plugins
call plug#begin(stdpath('data') . 'vimplug')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'dominikduda/vim_current_word'
    Plug 'jiangmiao/auto-pairs'

    Plug 'kyazdani42/nvim-web-devicons'  " So many plugins need this it's crazy

     " requires
    Plug 'kyazdani42/nvim-tree.lua'

    " Cool and also sick icons
    Plug 'ryanoasis/vim-devicons'

    Plug 'nvim-lua/popup.nvim'

    " Fuzzy finder
    Plug 'nvim-telescope/telescope.nvim'
    
    " LSP Tingz
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'glepnir/lspsaga.nvim'

    " Autocompletion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/nvim-cmp'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

    " Bottom bar, it's called a line apparently
    Plug 'nvim-lualine/lualine.nvim'

    " Tagz
    Plug 'preservim/tagbar'
    Plug 'universal-ctags/ctags'

    " Bunch of themes including ones i don't use
    Plug 'haishanh/night-owl.vim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'nikvdp/neomux'

    Plug 'justinmk/vim-dirvish'
    Plug 'kristijanhusak/vim-dirvish-git'
    
    Plug 'tpope/vim-ragtag'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'

    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'

    Plug 'tomtom/tcomment_vim'

    Plug 'xiyaowong/nvim-transparent'
call plug#end()


" disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

let g:dirvish_git_show_ignored = 1

let g:tokyonight_style = "night"
let g:tokyonight_transparent = v:true
let g:tokyonight_transparent_sidebar = v:true
colorscheme tokyonight
:highlight LineNr guifg=#bf00ff

" basic settings
syntax on
set number
set ignorecase      " ignore case
set smartcase     " but don't ignore it, when search string contains uppercase letters
set nocompatible
set incsearch        " do incremental searching
set visualbell
set expandtab
set tabstop=4
set ruler
set smartindent
set shiftwidth=4
set hlsearch
set virtualedit=all
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent      
set nowrap
" set mouse=a  " mouse support

" set leader key to ,
let g:mapleader=","

" resizing windows
nnoremap <silent> <C-]> <cmd>:vertical resize +5<CR>
nnoremap <silent> <C-[> <cmd>:vertical resize -5<CR>
                                                
" >> Telescope bindings
nnoremap <Leader>pp <cmd>lua require'telescope.builtin'.builtin{}<CR>

" most recently used files
nnoremap <Leader>m <cmd>lua require'tlescope.builtin'.oldfiles{}<CR>

" find buffer
nnoremap ; <cmd>lua require'telescope.builtin'.buffers{}<CR>

" find in current buffer
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" bookmarks
nnoremap <Leader>' <cmd>lua require'telescope.builtin'.marks{}<CR>

" git files
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>

" all files
nnoremap <Leader>bfs <cmd>lua require'telescope.builtin'.find_files{}<CR>

" ripgrep like grep through dir
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>

" pick color scheme
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>


" >> setup nerdcomment key bindings
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

xnoremap <Leader>ci <cmd>call NERDComment('n', 'toggle')<CR>
nnoremap <Leader>ci <cmd>call NERDComment('n', 'toggle')<CR>

" >> nvim nvim-tree
nnoremap <C-t> :NvimTreeToggle<CR>

" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>
lua <<EOF
require("lsp")
require("treesitter")
require("statusbar")
require("completion")
require("transparent")
require("filetree")
EOF
