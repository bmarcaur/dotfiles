set nocompatible

filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" --- Making Vim Look Good ---
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

filetype plugin indent on

" --- General Settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax enable
set mouse=a

set clipboard=unnamed
set scrolljump=10
set tabstop=2
set shiftwidth=2
set cursorline
set cursorcolumn
set relativenumber
set nowrap

" --- Plugin Specific Settings ---
" --- altercation/vim-colors-solarized ---
set notermguicolors
set background=dark

colorscheme solarized

" --- override the system to use ripgrep
set grepprg=rg\ --color=never

set wildignore+=*/.git/*,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
