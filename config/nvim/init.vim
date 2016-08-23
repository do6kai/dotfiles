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

" Misc
Plug 'sheerun/vim-polyglot'

call plug#end()

" Appearance
let g:onedark_terminal_italics = 1
colorscheme onedark

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

set cursorline

" Airline
let g:airline_theme = 'onedark'
