let use_0x = 1

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

    nmap = <C-W>=
    nmap , <C-W><
    nmap . <C-W>>

    nmap h <C-W>W
    nmap l <C-W>w

    nmap <leader>h <C-W>h
    nmap <leader>j <C-W>j
    nmap <leader>k <C-W>k
    nmap <leader>l <C-W>l

    nnoremap <C-J> :m+<CR>==
    nnoremap <C-K> :m-2<CR>==
   " inoremap <C-J> <Esc>:m+<CR>==gi
"     inoremap <C-K> <Esc>:m-2<CR>==gi
    vnoremap <C-J> :m'>+<CR>gv=gv
    vnoremap <C-K> :m-2<CR>gv=gv

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    nnoremap <silent> <C-l> :noh<return><C-l>
" }}}

" Position restore {{{
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}

" Vundle {{{
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    filetype plugin indent on
    Plugin 'gmarik/Vundle.vim'

    Plugin 'wakatime/vim-wakatime'

    Plugin 'scrooloose/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'

    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'

    Plugin 'rhysd/vim-clang-format'

    Plugin 'scrooloose/nerdcommenter'

    Plugin 'bling/vim-airline'
    Plugin 'altercation/vim-colors-solarized'
    " Plugin 'chase/focuspoint-vim'
    " Plugin 'Zenburn'

    Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'

    Plugin 'kongo2002/fsharp-vim'

    Plugin 'plasticboy/vim-markdown'

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

    " color_coded {{{
    hi link NotImplemented Error
    " hi clear EnumConstant
    hi link EnumConstant Constant
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

" NERDTree {{{
    map 1 :NERDTreeToggle<CR>
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

    " latex {{{
        let g:tex_flavor='latex'

        func! SetupLatexSuite()
            setlocal iskeyword+=: sw=2
            call IMAP('=>', '\Rightarrow', 'tex')
            call IMAP('<=>', '\Leftrightarrow', 'tex')
            call IMAP("`'", '\cdot', 'tex')
            call IMAP('`C', 'C_{<++>}^{<++>}<++>', 'tex')
            call IMAP('`~', '\sim', 'tex')
            call IMAP('~=', '\cong', 'tex')
            call IMAP('`A', '\forall <++> \to <++>', 'tex')
            call IMAP('`E', '\exists <++> : <++>', 'tex')
            call IMAP('FBB', '\mathbb{<++>}<++>', 'tex')
            call IMAP('`_', '\overline{<++>}<++>', 'tex')

            imap i <M-i>
            nmap i <M-i>
            imap c <M-c> 
            nmap c <M-c> 
            imap l <M-l> 
            nmap l <M-l> 

            imap O1;2P <S-F1>
            imap O1;2Q <S-F2>
            imap O1;2R <S-F3>
            imap O1;2S <S-F4>
        endf

        set grepprg=grep\ -nH\ $*

        let g:Tex_PromptedEnvironments='multline,$$,align,align*,define*,Th,remark*,exercise,claim,example,lem,proof'
        " let g:Tex_PromptedEnvironments='eqnarray*,eqnarray,equation,equation*,multline,$$,align,align*,define*,Th,remark*,exercise,claim,example,lem,proof'
        let g:Tex_DefaultTargetFormat='pdf'
        let g:Tex_MultipleCompileFormats='dvi,pdf'
        autocmd Syntax tex call SetupLatexSuite()
    " }}}

    " c/cpp {{{
        let clang_format#detect_style_file = 1
        autocmd FileType cpp let clang_format#auto_formatexpr = 1
    " }}}

    " text-like formats {{{
        autocmd FileType markdown,text,tex setlocal tw=80
    " }}}

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

" Compilation functions {{{
    func! CompileC()
        !gcc -std=c11 -Wall -Wextra -pedantic -O2 -o %< %
    endf
    func! CompileCDebug()
        !gcc -std=c11 -Wall -Wextra -pedantic -fsanitize=address -fsanitize=undefined -g -o %< %
    endf
    func! CompileCPP()
        let CXX_FLAGS = "-Dmoskupols -Wno-unused-result -Wall -Wextra -O2"
        if g:use_0x == "1"
            let CXX_FLAGS .= " -std=gnu++0x"
        endif
        exec "!g++ " . CXX_FLAGS . " -o %< %"
    endf
    func! CompileCPPDebug()
        let CXX_FLAGS = "-Dmoskupols -Wno-unused-result -Wall -Wextra -g"
        if g:use_0x == "1"
            let CXX_FLAGS .= " -std=gnu++0x"
        endif
        exec "!g++ " . CXX_FLAGS . " -o %< %"
    endf
    func! Compile()
        wa
        if &filetype == "cpp"
            call CompileCPP()
        elseif &filetype == "c"
            call CompileC()
        elseif &filetype == "cs"
            !mcs %
        else
            echo "Not appropriate file type"
        endif
    endf
    func! MakeRelease()
        wa
        if filereadable("Makefile")
            echo "Found Makefile, running make release..."
            make! release
        else
            call Compile()
        endif
    endf
    func! CompileDebug()
        wa
        if &filetype == "cpp"
            call CompileCPPDebug()
        elseif &filetype == "c"
            call CompileCDebug()
        else
            call Compile()
        endif
    endf
    func! MakeDebug()
        wa
        if filereadable("Makefile")
            echo "Found Makefile, running make..."
            make! debug
        else
            call CompileDebug()
        endif
    endf
    " }}}

    " Running functions {{{
        func! Run()
            wa
            if &filetype == "python"
                !python3 %
            elseif &filetype == "sh" || &filetype == "bash"
                !bash %
            elseif &filetype == "text"
                !./`basename \`pwd\``
            elseif &filetype == "haskell"
                !runhaskell %
            elseif &filetype == "cs"
                !./%<.exe
            else
                !./%<
            endif
        endf
        func! MakeRun()
            wa
            if filereadable("Makefile")
                echo "Found Makefile, running make..."
                make! run
            else
                call Run()
            endif
        endf
        func! RunGdb()
            :wa
            if &filetype == "c" || &filetype == "cpp"
                silent !gdb -q %<
                redraw!
            else
                echo "no Makefile here, and filetype not supported :("
            endif
        endf
        func! MakeGdb()
            wa
            if filereadable("Makefile")
                echo "Found Makefile, running make..."
                make! gdb
                redraw!
            else
                call RunGdb()
            endif
        endf
        func! RunValgrind()
            wa
            elseif &filetype == "c" || &filetype == "cpp"
                !valgrind --leak-check=full ./%<
                redraw!
            else
                echo "no Makefile here, and filetype not supported :("
            endif
        endf
        func! MakeValgrind()
            wa
            if filereadable("Makefile")
                echo "Found Makefile"
                silent make! valgrind
                redraw!
            else
                call RunValgrind()
            endif
        endf
" }}}

" Run/compile mappings {{{
    map <F5> :call MakeGdb()<Enter>
    imap <F5> <Esc><F5>
    map <S-F5> :call RunGdb()<Enter>
    imap <S-F5> <Esc><S-F5>
    map <C-F5> :call MakeValgrind()<Enter>
    imap <C-F5> <Esc><C-F5>
    map <S-C-F5> :call RunValgrind()<Enter>
    imap <S-C-F5> <Esc><S-C-F5>

    map <F6> :call MakeRun()<Enter>
    imap <F6> <Esc><F6>
    map <S-F6> :call Run()<Enter>
    imap <S-F6> <Esc><S-F6>

    map <F7> :call MakeDebug()<Enter>
    imap <F7> <Esc><F7>
    map <S-F7> :call CompileDebug()<Enter>
    imap <S-F7> <Esc><S-F7>
    map <C-F7> :call MakeRelease()<Enter>
    imap <C-F7> <Esc><C-F7>
    map <S-C-F7> :call Compile()<Enter>
    imap <S-C-F7> <Esc><S-C-F7>

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

    " map <S-F10> :qa<Enter>
    " imap <S-F10> <Esc>:qa<Enter>
" }}}

set timeoutlen=300

" autocmd BufWrite * retab!

