set nocompatible
filetype off
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
" optional bundles
"Bundle 'mikewest/vimroom'
" Bundle 'pangloss/vim-javascript'
" Bundle 'kchmck/vim-coffee-script'
" Bundle 'derekwyatt/vim-scala'
" Bundle 'guns/vim-clojure-static'
" Bundle 'vim-scripts/JSON.vim'
" Bundle 'goldfeld/vim-seek'
" Bundle 'lukerandall/haskellmode-vim
" Bundle 'tpope/vim-fireplace'
" Bundle 'tpope/vim-classpath'
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
syntax on
set nocompatible
filetype plugin indent on
let loaded_matchparen = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let go_highlight_trailing_whitespace_error=0
color solarized
set lsp=5
set background=dark
set clipboard=unnamed
set hidden
set autoindent
set smartindent
set gdefault
set smarttab
set ignorecase
set smartcase
set incsearch
set hlsearch
set history=2000
set undolevels=2000
set undoreload=2000
set title
set vb t_vb=
set showmatch
set noerrorbells
set nuw=1
set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
set expandtab
let mapleader = ","
nnoremap <Leader>g :GundoToggle<CR>
nnoremap <S-CR> O<Esc>j
nnoremap <CR> o<Esc>k
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap / /\v
nnoremap <Leader><CR> i<CR><Esc>
nnoremap <silent> <Leader>a :nohl<CR>
nnoremap <Leader>/ :Ack 
nnoremap ; :
nnoremap J mlJ`l
nnoremap <Leader>0 :VimuxPromptCommand<CR>
nnoremap <Leader>t :VimuxRunLastCommand<CR>

" check off and uncheck items on todo list
nnoremap <Leader>d ^rxj
nnoremap <Leader>s ^roj
set scrolloff=2
set noswapfile
set nowb
set nobackup
set viminfo^=%
set linespace=0
set shortmess=aOstT
set undofile
set undodir=~/.vimundo//
set rnu
set wildignore=*/.git/*,*/templates_c/*,*/live/*
set shortmess+=I
set splitbelow
set splitright
set encoding=utf-8
set colorcolumn=80

nnoremap <Leader>r :Eval (user/reset)<CR>
