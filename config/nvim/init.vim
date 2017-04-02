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

" Color schemes
Plug 'morhetz/gruvbox'

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentline'
Plug 'valloric/matchtagalways', { 'for': 'html' }
Plug 'elmar-hinz/vim.typoscript'

" Misc
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'

" Usability/Editing
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-clang'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/denite.nvim', { 'do': function('DoRemote') }
Plug 'airblade/vim-gitgutter'
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'vimlab/mdown.vim', { 'do': 'npm install' }

Plug 'tpope/vim-fugitive'
" :Gstatus, :Gcommit, :Gremove, ...:Gstatus, :Gcommit, :Gremove, ...

Plug 'junegunn/gv.vim'
" :GV to open commit browser (mapped to <F3>)

Plug 'matze/vim-move'
" Move line(s):
" <A-k>   Move current line/selection up
" <A-j>   Move current line/selection down
" let g:move_key_modifier = 'C'

Plug 'tpope/vim-surround'
" Press cs"' inside of
" "Hello World"
" to change it to
" 'Hello World'
" Can also be used:
"  - with tags
"  - to delete surroundings

Plug 'Raimondi/delimitmate'
" Insert mode auto-completion for quotes, parens and brackets, etc.

Plug 'mattn/emmet-vim', { 'for': 'html' }
" Use <C-I>, to expand abbreviation

Plug 'terryma/vim-multiple-cursors'
" Select text and press <C-n> for the next hit

call plug#end()
" END: Plugins ------------------------------------------------------------- }}}

" General ------------------------------------------------------------------ {{{
filetype plugin on
let mapleader=','

set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox

set cursorline
set colorcolumn=81

set number
set relativenumber

set showmatch

set nowrap

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

set mouse-=a

set scrolloff=5

set hidden

set foldenable
set foldmethod=indent
set foldminlines=5
set foldlevel=1
set foldopen=hor

" No folding in markdown files
let g:vim_markdown_folding_disabled=1

" Folding for my init.vim
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0
autocmd FileType vim setlocal foldminlines=0

" No folding for startify screen
autocmd FileType startify setlocal foldlevel=10

set virtualedit=

set undofile
set undodir="$HOME/.vim_undo_files"

" Use <Esc> to get in normal mode if terminal is focused
tnoremap <Esc> <C-\><C-n>
" END: General ------------------------------------------------------------- }}}

" Usability/Editing -------------------------------------------------------- {{{
noremap H ^
noremap J 5j
noremap K 5k
noremap L g_

vnoremap < <gv
vnoremap > >gv
" END: Usability/Editing --------------------------------------------------- }}}

" Airline ------------------------------------------------------------------ {{{
set laststatus=2
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

let g:deoplete#sources#clang#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header='/Library/Developer/CommandLineTools/usr/lib/clang/'
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

" Emmet  ------------------------------------------------------------------- {{{
let g:user_emmet_leader_key='<C-I>'
" END: Emmet --------------------------------------------------------------- }}}

" GV (Git commit browser)  ------------------------------------------------- {{{
map <F3> :GV<CR>
" END: GV (Git commit browser) --------------------------------------------- }}}

" Vim-move  ---------------------------------------------------------------- {{{
let g:move_key_modifier = 'C'
" END: Vim-move ------------------------------------------------------------ }}}

" Denite  ------------------------------------------------------------------ {{{
nnoremap <C-p> :Denite file_rec<CR>
" END: Denite -------------------------------------------------------------- }}}

" mdown.vim  --------------------------------------------------------------- {{{
function! s:initMdownCommands()
    au! CursorHold,CursorHoldI,CursorMoved,CursorMovedI <buffer> call g:MdownReload()
endfunction
autocmd! FileType markdown call s:initMdownCommands()
" END: mdown.vim ----------------------------------------------------------- }}}

" Deoplete: Rust  ---------------------------------------------------------- {{{
let g:deoplete#sources#rust#racer_binary='/Users/merdog/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/merdog/Sources/rust/src'
" END: Deoplete: Rust ------------------------------------------------------ }}}
