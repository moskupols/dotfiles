" General options {{{
    set smartindent
    set expandtab shiftwidth=2 tabstop=2 softtabstop=2

    set whichwrap+=h,l
    set matchpairs+=<:>

    set autowrite

    set mouse=a
    set scrolloff=4

    set number

    set conceallevel=2 concealcursor=

    set gdefault

    set foldmarker={{{,}}} foldmethod=marker foldenable

    set wildignore=*.o,*~,*.pyc
    set completeopt=menu,menuone

    set list listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

    set splitright    " Puts new vsplit windows to the right of the current

    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

    set colorcolumn=80,100,120

    let mapleader = ','
    let localleader = ';'

    set termguicolors
" }}}


" General mappings {{{
    let mapleader = ','
    let localleader = ';'

    nmap Q :q<CR>

    nmap <M-=> <C-W>=
    nmap <M-,> <C-W><
    nmap <M-.> <C-W>>

    nmap <M-h> <C-W>W
    nmap <M-l> <C-W>w

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    nnoremap <silent> <C-l> :noh<return><C-l>

    map <F8> :cope<Enter>:cc<Enter>
    imap <F8> <Esc><F8>i
    map <S-F8> :cclo<Enter>
    imap <S-F8> <Esc><S-F8>i
    map <F9> :cn<Enter>
    imap <F9> <Esc><F9>i
    map <S-F9> :cp<Enter>
    imap <S-F9> <Esc><S-F9>i

    map <F10> :make<Enter>:vs<Enter>:te make tests && make view-tests<Enter>
    imap <F10> <Esc><F10>
" }}}

" Plugins declaration {{{

    call plug#begin('~/.local/share/nvim/plugged')

    Plug 'iCyMind/NeoSolarized'

    call plug#end()

" }}}


" Visuals {{{

    colorscheme NeoSolarized
    set background=dark

" }}}

" Terminal {{{
autocmd TermOpen * set nonumber
autocmd TermOpen * startinsert
"
