"         
" ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
" ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
" ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
" ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
" 
"         @Pinto So Good
set number 

set nu
set nohlsearch
set mouse=a
set hidden
set splitright
set splitbelow
set noerrorbells
set nowrap
set formatoptions-=t
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=2
set noshowmode
set completeopt=menu,menuone,noselect
set signcolumn=yes
set number
set updatetime=50
set encoding=UTF-8
set clipboard+=unnamedplus " Copy paste between vim and everything else
set nojoinspaces " don't autoinsert two spaces after '.', '?', '!' for join command
set showcmd " extra info at end of command line
set wildignore+=*/node_modules/**

set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"Speed up Vim"
set ttyfast
set lazyredraw

filetype plugin indent on
syntax on

call plug#begin('~/.config/nvim/plugged')
Plug 'Mofiqul/dracula.nvim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'kien/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'editorconfig/editorconfig-vim'
Plug 'karb94/neoscroll.nvim'
" Tab Tab "
Plug 'romgrk/barbar.nvim'
Plug 'GustavoKatel/sidebar.nvim'
"DashBoard"
Plug 'glepnir/dashboard-nvim'
"Syntax"
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
"Line"
Plug 'dstein64/vim-startuptime'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'hoob3rt/lualine.nvim'
Plug 'APZelos/blamer.nvim'

"color"
Plug 'norcalli/nvim-colorizer.lua'

"Telescope"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'folke/zen-mode.nvim'
Plug 'junegunn/limelight.vim'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'stevearc/dressing.nvim'
call plug#end()

colorscheme dracula
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"coc install"
"Neoscroll"
lua require('neoscroll').setup()
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

"Tab Tab"
let g:lightline={ 'enable': {'statusline': 1, 'tabline': 0} }
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"Wilder set up"
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })

"Buffer line"
lua << EOF
vim.api.nvim_exec([[let $KITTY_WINDOW_ID=0]], true)
require("bufferline").setup{
  highlights = {
    fill = {
      guibg = "#282828"
    },
    separator_selected = {
      guifg = "#282828"
    },
    separator_visible = {
      guifg = "#282828"
    },
    separator = {
      guifg = "#282828"
    }
  },
  options = {
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 25,
    max_prefix_length = 25,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    offsets = {
      {
        filetype = "coc-explorer",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center"
      }
    }
  }
}
EOF
nnoremap <silent> gb :BufferLinePick<CR>

"Dash Board"
let g:dashboard_default_executive ='telescope'
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
" nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>ct :DashboardChangeColorscheme<CR>
" nnoremap <silent> <Leader>fg :DashboardFindWord<CR>
nnoremap <silent> <Leader>fm :DashboardJumpMark<CR>
nnoremap <silent> <Leader>nf :DashboardNewFile<CR>
let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f h',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC n f',
\ 'change_colorscheme' : 'SPC c t',
\ 'find_word'          : 'SPC f g',
\ 'book_marks'         : 'SPC f m',
\ }
let s:header = [
    \ '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
    \ '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
    \ '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
    \ '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
    \ '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
    \ '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
    \ '',
    \ '                 [ @elijahmanor ]                 ',
    \ ]
let s:footer = []
let g:dashboard_custom_header = s:header
let g:dashboard_custom_footer = s:footer

"Lua Line"
lua << EOF
require('plenary.reload').reload_module('lualine', true)
require('lualine').setup({
  options = {
    theme = 'dracula',
    disabled_types = { 'NvimTree' }
  },
  sections = {
    lualine_x = {},
    -- lualine_y = {},
    -- lualine_z = {},
  }
})
EOF

"Balmer"
let g:blamer_enabled = 1
nnoremap <silent> <leader>tb :BlamerToggle<CR>

"color lize"
lua require'colorizer'.setup()
