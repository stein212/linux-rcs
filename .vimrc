syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set backspace=indent,eol,start

set colorcolumn=80,100
highlight ColorColumn ctermbg=4 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'ayu-theme/ayu-vim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

autocmd CursorHold * silent call CocActionAsync('highlight')
set termguicolors
let ayucolor='mirage'
colorscheme ayu
