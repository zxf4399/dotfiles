" ===
" === Basic settings
" ===
set clipboard+=unnamedplus
set nocompatible

" ===
" === Basic mappings
" ===

let mapleader="\<space>"

tnoremap <Esc> <C-\><C-n>

" ===
" === 插件
" ===
call plug#begin('~/.config/nvim/plugged')

" ===
" === Color scheme
" ===
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ===
" === 代码补全
" ===
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ===
" === 语言包
" ===
Plug 'sheerun/vim-polyglot'

" ===
" === 代码格式化
" ===
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" ===
" === File navigation
" ===

Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'

" ===
" === Terminal
" ===

Plug 'voldikss/vim-floaterm'

" ===
" === Productivity
" ===

Plug 'rhysd/accelerated-jk'

" ===
" === Git
" ===

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()

" ===
" === Color scheme
" ===
set background=dark
colorscheme gruvbox

" ===
" === coc.nvim
" ===

let g:coc_global_extensions =[
    \ 'coc-explorer',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-tabnine',
    \ 'coc-yank',
    \]

" ===
" === coc-explorer
" ===

nmap <leader>e :CocCommand explorer<CR>

" ===
" === vim-vue
" ===

let g:vue_pre_processors = 'detect_on_enter'

" ===
" === accelerated-jk
" ===

nmap <silent> j <Plug>(accelerated_jk_gj)
nmap <silent> k <Plug>(accelerated_jk_gk)
