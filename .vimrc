" General options {{{
    set nocompatible
    syntax on

    set autoindent
    set smartindent
    set expandtab
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    set smarttab

    set nojoinspaces  " always single space on J, not even after full stop

    set showcmd
    set showmode

    set backspace=indent,eol,start
    set whichwrap+=h,l
    set matchpairs+=<:>
    set mouse=a
    set scrolloff=4

    set number
    set ruler " relativenumber

    set conceallevel=2 concealcursor=

    set hlsearch incsearch
    set gdefault " replace with g flag

    set foldmarker={{{,}}} foldmethod=marker foldenable

    set tabpagemax=20

    set linespace=0   " No extra spaces between rows 

    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set wildignore=*.o,*~,*.pyc
    let completeopt='menu,menuone'

    set list listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

    set splitright    " Puts new vsplit windows to the right of the current
    " set splitbelow  " Puts new split windows below the current

    " backups {{{
        set backup backupdir=~/.vim/backupdir
        if has('persistent_undo')
            set undodir=~/.vim/undodir undofile
            set undolevels=1000            " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif
    " }}}

    " gui-relative {{{
        if has('gui_running')
          set guioptions-=T              " Remove the toolbar
          set lines=40                  " 40 lines of text instead of 24
        else
            if &term == 'xterm' || &term == 'screen'
                set t_Co=256
            endif
        endif
    " }}}

    set colorcolumn=80,100,120

" }}}

" General mappings {{{
    let mapleader = ','
    let localleader = ';'

    nmap Q :q<CR>

    nmap j 5j
    vmap j 5j
    nmap k 5k
    vmap k 5k

    nmap = <C-W>=
    nmap , <C-W><
    nmap . <C-W>>

    nmap h <C-W>W
    nmap l <C-W>w

    nmap <leader>h <C-W>h
    nmap <leader>j <C-W>j
    nmap <leader>k <C-W>k
    nmap <leader>l <C-W>l

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    nnoremap <silent> <C-l> :noh<return><C-l>
" }}}

" Position restore {{{
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message

    autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}

" Vundle {{{
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    filetype plugin indent on
    Plugin 'gmarik/Vundle.vim'

    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'

    Plugin 'scrooloose/nerdcommenter'

    Plugin 'bling/vim-airline'
    Plugin 'altercation/vim-colors-solarized'
    " Plugin 'chase/focuspoint-vim'
    " Plugin 'Zenburn'

    call vundle#end()
" }}}

" appearance {{{
    set background=dark
    color solarized

    " if has("conceal")
        " set conceallevel=0
        " au FileType * setl conceallevel=0
    " endif

    hi clear SignColumn
    hi link SignColumn LineNr

    " gitgutter {{{
    hi GitGutterChange ctermfg=darkblue ctermbg=0 guifg=#bbbb00
    hi GitGutterDelete ctermfg=darkred ctermbg=0 guifg=#ff2222

    let g:gitgutter_map_keys = 0
    let g:gitgutter_realtime = 1
    let g:updatetime = 750

    nmap <Leader>gg :GitGutterToggle<CR>
    nmap <Leader>gs <Plug>GitGutterStageHunk
    nmap <Leader>gr <Plug>GitGutterRevertHunk
    " }}}

    " airline {{{
    let g:airline_theme = 'dark'
    let g:airline_left_sep='›'  " Slightly fancier than '>'
    let g:airline_right_sep='‹'
    " }}}
" }}}

" spellcheck {{{
    set spell
    set spelllang=ru_yo,en
" }}}
    " ycm {{{
        let g:ycm_filetype_blacklist = {}
        let g:ycm_filetype_specific_completion_to_disable = {}
        let g:ycm_warning_symbol = '--'
        let g:ycm_add_preview_to_completeopt = 1
        let g:ycm_autoclose_preview_window_after_insertion = 1
        let g:ycm_complete_in_comments = 1
        let g:ycm_collect_identifiers_from_comments_and_strings = 1
        let g:ycm_global_ycm_extra_conf = '~/.ycm_complete_conf.py'
        let g:ycm_confirm_extra_conf = 0
    " }}}

" fugitive {{{
nnoremap <Leader>gs :Gstatus<Enter>
nnoremap <Leader>gp :Gpush<Enter>
nnoremap <Leader>gl :Glog<Enter>
nnoremap <Leader>gcc :Gcommit<Enter>
nnoremap <Leader>gcv :Gcommit -v<Enter>
nnoremap <Leader>gca :Gcommit -v -a<Enter>
nnoremap <Leader>gw :Gwrite<Enter>
nnoremap <Leader>ga :Gwrite<Enter>
" }}}

" ft-specific {{{
augroup ftSpecific
    autocmd!

    "Makefiles {{{
        autocmd FileType make setlocal noexpandtab
    " }}}

    " Markdown {{{
        " For en/em dashes, respectively
        autocmd FileType markdown imap -- –
        autocmd FileType markdown imap --- —
    " }}}

augroup END
" }}}

" nerdcommenter {{{
    let g:NERDSpaceDelims=1
    nmap <Leader>/ <Leader>c<space>
    vmap <Leader>/ <Leader>c<space>
" }}}

" Run/compile mappings {{{
    map <F8> :cope<Enter>:cc<Enter>
    imap <F8> <Esc><F8>i
    map <S-F8> :cclo<Enter>
    imap <S-F8> <Esc><S-F8>i
    map <F9> :cn<Enter>
    imap <F9> <Esc><F9>i
    map <S-F9> :cp<Enter>
    imap <S-F9> <Esc><S-F9>i

    map <F10> :make<Enter>:!make tests && make view-tests<Enter>
    imap <F10> <Esc><F10>
" }}}

set timeoutlen=300
