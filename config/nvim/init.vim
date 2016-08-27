"
" Author: Kai Strecker
" Repository: https://github.com/kstrecker/dotfiles
"

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

" Appearance
Plug 'joshdick/onedark.vim'
Plug 'joshdick/airline-onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" Usability
Plug 'scrooloose/NERDTree'

" Misc
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'

call plug#end()

" General
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent

vnoremap < <gv
vnoremap > >gv

" Appearance
let g:onedark_terminal_italics = 1
colorscheme onedark

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

set cursorline

" Usability
nmap H ^
nmap J 5j
nmap K 5k
nmap L $

" Airline
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1

" Nerdtree
map <F2> :NERDTreeToggle<CR>
