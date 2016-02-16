set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" --- Making Vim Look Good ---
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'

" --- Vim as a programmer's text editor
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'Align'
Plugin 'airblade/vim-gitgutter'

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
set re=1

autocmd FileType ruby setlocal nocursorline nocursorcolumn norelativenumber

" --- Plugin Specific Settings ---

" --- altercation/vim-colors-solarized ---
set background=dark

colorscheme solarized

" --- bling/vim-airline ---
" Always show statusbar
set laststatus=2

" Show PASTE if in paste mode
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" --- jistr/vim-nerdtree-tabs ---
" Open and close nerdtree tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" To have Nerdtree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1

" --- scrooloose/syntastic ---
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
	au!
	au FileType tex let b:syntastic_mode = "passive"
augroup end


" --- kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
