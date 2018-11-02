set nocompatible

filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" --- Making Vim Look Good ---
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'

" --- Vim as a programmer's text editor
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'Align'
Plugin 'airblade/vim-gitgutter'
Plugin 'rust-lang/rust.vim'

call vundle#end()

filetype plugin indent on

" --- General Settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on
set mouse=a


" --- Personal Settings ---
" associate *.map with ruby filetype
au BufRead,BufNewFile *.map set filetype=ruby

set clipboard=unnamed
set scrolljump=10
set tabstop=2
set shiftwidth=2
set cursorline
set cursorcolumn
set relativenumber
set nowrap

autocmd FileType ruby setlocal nocursorline nocursorcolumn norelativenumber

" --- Plugin Specific Settings ---

" --- altercation/vim-colors-solarized ---
set background=dark

colorscheme solarized

" --- bling/vim-airline ---
" Always show statusbar
set laststatus=2

" Show ligature fonts
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" --- scrooloose/syntastic ---
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
	au!
	au FileType tex let b:syntastic_mode = "passive"
augroup end

" --- override the system to use ripgrep
set grepprg=rg\ --color=never

" --- kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0

set wildignore+=*/.git/*,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
