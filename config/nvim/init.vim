"
" Author: Kai Strecker
" Repository: https://github.com/kstrecker/dotfiles
"

" Plugins ------------------------------------------------------------------ {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

" Appearance
Plug 'joshdick/onedark.vim'
Plug 'joshdick/airline-onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentline'
Plug 'valloric/matchtagalways', {'for': 'html' }

" Usability/Editing
Plug 'Shougo/unite.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'matze/vim-move'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Raimondi/delimitmate'
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Misc
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'

call plug#end()
" END: Plugins ------------------------------------------------------------- }}}

" General ------------------------------------------------------------------ {{{
let mapleader=','

set incsearch
set showcmd
set wildmenu
set wildmode=full
set wildignore+=*~,*.bak,*.tmp,*.o,*.obj,*.swp,.hg,.git,.svn,#*#,.*.sw*,*.png
set wildignore+=*.gif,*.jpg,*.ico,*.pyc,*.pdf,*.zip,*.exe,*.so,*.dll,*.javac
set wildignore+=*.swf,*.jar,*.bin

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set mouse=

set scrolloff=5
set hidden

set foldenable
set foldmethod=indent
set foldminlines=5
set foldlevel=1
set foldopen=hor

let g:vim_markdown_folding_disabled=1
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0

set virtualedit=

set undofile
set undodir="$HOME/.vim_undo_files"

" END: General ------------------------------------------------------------- }}}

" Appearance --------------------------------------------------------------- {{{
set cursorline
set colorcolumn=81

set number
set relativenumber
set showmatch
set nowrap

let g:onedark_terminal_italics = 1
colorscheme onedark

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

autocmd FileType markdown set wrap linebreak
" END: Appearance ---------------------------------------------------------- }}}

" Usability/Editing -------------------------------------------------------- {{{
" Navigate between display lines
noremap <silent> <Up> gk
noremap <silent> <Down> gj
noremap <silent> k gk
noremap <silent> j gj

noremap H ^
noremap J 5j
noremap K 5k
noremap L g_

vnoremap < <gv
vnoremap > >gv
" END: Usability/Editing --------------------------------------------------- }}}

" Airline ------------------------------------------------------------------ {{{
set laststatus=2
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
" END: Airline ------------------------------------------------------------- }}}

" Nerdtree ----------------------------------------------------------------- {{{
map <F2> :NERDTreeToggle<CR>
" END: Nerdtree ------------------------------------------------------------ }}}

" Indentline --------------------------------------------------------------- {{{
set concealcursor=c
autocmd FileType help let g:indentLine_enabled=0
autocmd FileType json let g:indentLine_concealcursor='c'
" END: Indentline ---------------------------------------------------------- }}}

" Deoplete ----------------------------------------------------------------- {{{
let g:deoplete#enable_at_startup=1
" END: Deoplete ------------------------------------------------------------ }}}

" Neosnippet --------------------------------------------------------------- {{{
let g:neosnippet#enable_sniptmate_compatibility=1
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_or_jump)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \ : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \ : "\<TAB>"
" END: Neosnippet ---------------------------------------------------------- }}}
