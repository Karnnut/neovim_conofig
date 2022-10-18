set number 
syntax on
set nocompatible
call plug#begin('~/.config/nvim/plugged')
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'karb94/neoscroll.nvim'
Plug 'windwp/nvim-autopairs'

call plug#end()
let g:lightline = {'colorscheme': 'tokyonight'}
colorscheme tokyonight
lua require('neoscroll').setup()

lua << EOF
require("nvim-autopairs").setup {}
EOF

