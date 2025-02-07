~/.config/nvim/init.vim

set number                    " 行番号を表示する
" set relativenumber            " 相対行番号を表示する
set tabstop=2                 " タブ幅を2に設定
set shiftwidth=2              " 自動インデント時のスペース幅を2に設定
set textwidth=0               " 自動改行を無効化する
set expandtab                 " タブをスペースに変換する
set autoindent                " 自動インデントを有効にする
set smartindent               " スマートインデントを有効にする
set wrap                      " テキストの折り返しを有効にする
set clipboard=unnamedplus     " システムのクリップボードと連携する
set cursorline                " 現在の行をハイライトする
set ignorecase                " 検索時に大文字小文字を無視する
set smartcase                 " 大文字が含まれる場合は区別する
set incsearch                 " インクリメンタル検索を有効にする
set hlsearch                  " 検索結果をハイライトする
set termguicolors             " 端末の真の色をサポートする

let mapleader = " "           " リーダーキーをスペースに設定

" jjでEsc
inoremap jj <Esc>

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Select all
nnoremap <C-a> gg<S-v>G

" Save file and quit
nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>c :quit!<CR>

" New tab
nnoremap te :tabedit<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>

" Split window
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
" Move window
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sh <C-w>h
nnoremap sl <C-w>l

" Resize window
nnoremap <Leader>k 5<C-w>+
nnoremap <Leader>j 5<C-w>-
nnoremap <Leader>h 5<C-w><
nnoremap <Leader>l 5<C-w>>


" Vim Plug
call plug#begin()
Plug 'ntk148v/vim-horizon'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'windwp/nvim-autopairs'
call plug#end()

" vim-horizon
set termguicolors
colorscheme horizon
let g:lightline = {}
let g:lightline.colorscheme = 'horizon'

" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>

" FuzzyFinder
nnoremap <leader>f :FZF<CR>

" coc-nvm
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" coc-nvm(autocomplete)
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm() : "\<Enter>"
inoremap <silent><expr> <Esc> coc#pum#visible() ? coc#pum#cancel() : "\<Esc>"
inoremap <silent><expr> <C-h> coc#pum#visible() ? coc#pum#cancel() : "\<C-h>"

" coc-nvm(<Tab>で次、<S+Tab>で前)
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>" " "\<C-h>"
inoremap <silent><expr> <c-n> coc#refresh()

" nvim-autopairs
lua << EOF
require("nvim-autopairs").setup {}
EOF
