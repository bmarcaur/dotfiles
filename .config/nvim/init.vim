set nocompatible

filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" --- Making Vim Look Good ---
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'

" --- Vim as a programmer's text editor
Plugin 'kien/ctrlp.vim'
Plugin 'Align'
Plugin 'airblade/vim-gitgutter'
Plugin 'airblade/vim-rooter'
Plugin 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" --- Needed for ncm
Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-path'

" --- Language specific plugins
" --- Rust
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

" --- ncm2/ncm2 ---
let g:python3_host_prog='/usr/local/bin/python3'
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" --- autozimu/LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }
let g:LanguageClient_autoStart = 1

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
let g:ctrlp_user_command = 'rg %s --files --color=never --hidden --glob ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 1

set wildignore+=*/.git/*,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
