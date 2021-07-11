" ===
" === Basic settings
" ===
set clipboard+=unnamedplus
set number
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
" === Fuzzy Search
" ===

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ===
" === Color scheme
" ===
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ===
" === Code completion
" ===
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dsznajder/vscode-es7-javascript-react-snippets', {
      \ 'do': 'yarn install --frozen-lockfile && yarn compile' }

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

" ===
" === Markdown
" ===

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }

" ===
" === Interface
" ===

Plug 'simeji/winresizer'

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
    \ 'coc-pairs',
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ 'coc-tabnine',
    \ 'coc-yank',
    \]

"Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" coc-explorer

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

" ===
" === vim-prettier
" ===

" when running at every change you may want to disable quickfix
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
