"{{{ vundle package manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'davidhalter/jedi-vim.git'
Plugin 'vim-latex/vim-latex.git'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'ervandew/supertab.git'
Plugin 'tpope/vim-surround.git'
Plugin 'nachumk/systemverilog.vim.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'bling/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xolox/vim-easytags.git'
Plugin 'xolox/vim-misc.git'
Plugin 'yukunlin/vim-move.git'
Plugin 'justinmk/vim-syntax-extra.git'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'yukunlin/auto-pairs.git'
"}}}

" vim settings {{{
set t_RV=
set mouse=a

" set manual fold for vimrc
autocmd bufread .vimrc setlocal foldmethod=marker

" re-map leader key
let mapleader=" "

" gets rid of some historical baggage
set vb t_vb=

"filetype indent on
filetype plugin indent on

" Set colors
set background=dark
let g:solarized_contrast="high"
colorscheme solarized
syntax on

" Don't show mode which is handled by airline
set noshowmode

" Search highlighting
set incsearch
set nohlsearch
nnoremap <leader>h :set hlsearch!<CR>

" Indent settings
set nosmartindent
set nocindent
set autoindent
" Ignore certain files for completion
set wildignore+=*/.hg/*,*/.svn/*

" Tab settings
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2

" Turn on line numberings
set number

" File loading settings
set autoread
set hidden
set autochdir

" Disable text wrapping
set nowrap

" Omnicomplete settings
set omnifunc=syntaxcomplete#Complete
set ofu=syntaxcomplete#Complete
set completeopt=menuone,longest

" GUI options
set gcr=a:blinkon0
set guioptions-=r
set guifont=Inconsolata\ for\ Powerline:h18
set guioptions-=T
set guioptions-=L

" custom indent for tex and system verilog
autocmd FileType tex source ~/.vim/syntax/tex.vim
autocmd FileType systemverilog source ~/.vim/syntax/sv.vim
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
"}}}

" map c-j and c-k to move lines up and down {{{
let g:move_key_modifier ='C'
let g:move_select_mode = 0
" }}}

" supertab setting {{{
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabContextDefaultCompletionType='<c-n>'
"autocmd BufEnter *.hs,*.py,*.cs,*.c,*.cpp let g:SuperTabDefaultCompletionType = "context"
"autocmd BufLeave *.hs,*.py,*.cs,*.c,*.cpp let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabLongestHighlight = 1
let g:SuperTabLongestEnhanced=1
" }}}

" jedi settings {{{
let g:jedi#popup_on_dot = 0
let g:jedi#auto_vim_configuration = 0
" }}}

" taglist settings {{{
let Tlist_WinWidth = 30
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_foldlevel = 99

let g:tagbar_type_armasm = {
    \ 'ctagsbin'  : 'ctags',
    \ 'ctagsargs' : '-f- --format=2 --excmd=pattern --fields=nksSa --extra= --sort=no --language-force=asm',
    \ 'kinds' : [
        \ 'm:macros:0:1',
        \ 't:types:0:1',
        \ 'd:defines:0:1',
        \ 'l:labels:0:1'
    \ ]
\}

let g:tagbar_type_systemverilog = {
    \ 'ctagsbin'  : 'ctags',
    \ 'ctagsargs' : '-f- --format=2 --excmd=pattern --fields=nksSa --extra= --sort=no --languages=systemverilog',
    \ 'kinds' : [
        \ 'e:typedef:0:1',
        \ 'i:interface:0:1',
        \ 'c:class:0:1',
        \ 'f:functions:0:1',
        \ 'm:module:0:1',
        \ 'p:program:0:1',
        \ 't:task:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'e' : 'typedef'
    \ },
    \ 'scope2kind' : {
        \ 'typedef'   : 'e'
    \ }
\}

let g:tagbar_type_tex = {
    \ 'ctagstype' : 'latex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'u:subsections',
        \ 't:subsubsections',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0
\}
"}}}

" airline setting {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tab_nr = 0
set laststatus=2
set timeoutlen=1000 ttimeoutlen=10
" }}}

" autopairs setting {{{
let g:AutoPairsShortcutJump='<C-f>'
let g:AutoPairsShortcutFastWrap='<C-e>'
let g:AutoPairsShortcutBackInsert='<C-b>'
let g:AutoPairsShortcutToggle = '<F6>'
let g:AutoPairsNormalJump=0
let g:AutoPairsClangComplete=1

" toggle autopair settings when entering tex file
autocmd BufEnter *.tex let g:AutoPairs = {'(':')', '[':']', '{':'}'}
autocmd BufLeave *.tex let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
"}}}

" ctrlp settings {{{
nnoremap <leader>f :CtrlP .<CR>
nnoremap <leader>d :CtrlP
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPBufTag<CR>
nnoremap <leader>r :CtrlPMRU<CR>
nnoremap <leader>m :CtrlPMRU<CR>

let g:ctrlp_max_depth = 2
let g:ctrlp_extensions = ['tag']
let g:ctrlp_prompt_mappings = { 'PrtCurLeft()': ['<left>', '<c-^>']  }
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

let g:ctrlp_buftag_types = {
    \ 'armasm'        : '--language-force=asm',
    \ 'systemverilog' : '--language=systemverilog',
    \ 'haskell' : {
    \ 'bin': 'hasktags',
    \ 'args': '-c -x -o-',
    \},
\ }
"}}}

" easytags settings {{{
let g:easytags_async=1
let g:easytags_updatetime_min=5000
let g:easytags_updatetime_warn=0
set tags=./.tags
let g:easytags_dynamic_files = 2
let g:easytags_languages = {
\   'armasm': {
\     'cmd': 'ctags',
\       'args': [],
\       'fileoutput_opt': '-f',
\       'stdout_opt': '-f-',
\       'recurse_flag': '-R'
\   }
\}
"}}}

" vim_latex settings {{{
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf='skim'
let g:Tex_FoldedSections=""
let g:Tex_FoldedMisc="<<<"
let g:Tex_GotoError = 0
let g:Tex_ShowErrorContext = 0
let g:Tex_FoldedEnvironments="verbatim,Verbatim,comment,eq,gather,align,align*,equation*,figure,table,thebibliography,keywords,abstract,titlepage,algorithm"
imap <c-k> <Plug>IMAP_JumpBack
smap <c-k> <Plug>IMAP_JumpBack
"}}}

" custom key mappings {{{
nnoremap <F9>  :TagbarToggle   <CR>
nnoremap <F8>  :NERDTreeToggle <CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bpreviou<CR>
nnoremap <C-S> :call StripTrailingWhitespace() <CR>
nnoremap <leader>w :w <CR>
nnoremap <leader>x :bp\|bd #
nnoremap <leader>c :bd
nnoremap <leader>q :q

" mapping for inserting newlines in normal mode
nnoremap <leader>j o<Esc>k
nnoremap <leader>k O<Esc>j

" mapping for splits
nnoremap <leader>s :split<Cr>
nnoremap <leader>v :vsplit<Cr>
"}}}

" custom fuctions {{{
function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

function! Bclose()
    let curbufnr = bufnr("%")
    let altbufnr = bufnr("#")

    if buflisted(altbufnr)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == curbufnr
        new
    endif

    if buflisted(curbufnr)
        execute("bdelete! " . curbufnr)
    endif
endfunction

cabbrev bdd call Bclose()
"}}}
