" ===
" === 基本设置
" ===
let mapleader="\<space>"
set nocompatible

" ===
" === 插件
" ===
call plug#begin('~/.config/nvim/plugged')

" ===
" === 配色
" ===
Plug 'morhetz/gruvbox'

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

call plug#end()

" ===
" === 配色
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
