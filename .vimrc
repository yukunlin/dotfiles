"{{{ package manager
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-latex/vim-latex', { 'for': 'tex' }
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'nachumk/systemverilog.vim'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline' | Plug 'yukunlin/vim-airline-themes'
Plug 'yukunlin/cscope_maps.vim'
Plug 'yukunlin/vim-gutentags'
Plug 'matze/vim-move'
Plug 'justinmk/vim-syntax-extra'
Plug 'frankier/neovim-colors-solarized-truecolor-only', has('gui_vimr')  ? {} : { 'on': [] }
Plug 'altercation/vim-colors-solarized',                !has('gui_vimr') ? {} : { 'on': [] }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'yukunlin/auto-pairs'
call plug#end()
"}}}

" vim settings {{{
set t_RV=
set mouse=a
set updatetime=1000
if !has('nvim')
  set ttymouse=xterm2
endif

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
set noshowcmd

" Search highlighting
set incsearch
set nohlsearch
nnoremap <leader>h :set hlsearch!<CR>
vnoremap // y/<C-R>"<CR>

" Indent settings
set nosmartindent
set nocindent
set autoindent
" Ignore certain files for completion
set wildignore+=*/.hg/*,*/.svn/*

" Tab settings
set expandtab
set smarttab
set tabstop=8
set softtabstop=0
set shiftwidth=4
set backspace=2

" fancier autocomplete in command mode
set wildmenu

" Turn on line numberings
set number

" File loading settings
set autoread
set hidden

" Disable text wrapping
set nowrap

" Omnicomplete settings
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,longest

" GUI options
set guioptions-=r
if !has("gui_vimr")
  set guifont=Inconsolata\ for\ Powerline:h18
endif
set guioptions-=T
set guioptions-=L

if !has("gui_running")
  " highlight in insert mode
  autocmd InsertEnter,InsertLeave * set cul!
  set gcr=a:blinkon0-block
else
  set gcr=a:blinkon0
endif

" custom indent for tex and system verilog
autocmd FileType tex source ~/.vim/syntax/tex.vim
autocmd FileType systemverilog source ~/.vim/syntax/sv.vim
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
"}}}

" vim-move settings {{{
let g:move_key_modifier ='C'
let g:move_map_keys = 0
nmap <C-k> <Plug>MoveLineUp
nmap <C-j> <Plug>MoveLineDown
xmap <C-k> <Plug>MoveBlockUp
xmap <C-j> <Plug>MoveBlockDown
vmap <C-h> <Plug>MoveBlockLeft
vmap <C-l> <Plug>MoveBlockRight
" }}}

" gitgutter settings {{{
nmap ghp <Plug>GitGutterPreviewHunk
nmap ghs <Plug>GitGutterStageHunk
nmap ghu <Plug>GitGutterUndoHunk
"}}}

" supertab setting {{{
let g:SuperTabDefaultCompletionType='<c-n>'
let g:SuperTabContextDefaultCompletionType='<c-n>'
let g:SuperTabLongestEnhanced=1
let g:SuperTabLongestHighlight=1
let g:SuperTabCrMapping=1
inoremap <C-Space> <C-x><C-o>
" }}}

" jedi settings {{{
let g:jedi#popup_on_dot = 0
let g:jedi#auto_vim_configuration = 0
let g:python_highlight_all = 1
" }}}

" taglist settings {{{
let Tlist_WinWidth = 30
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_foldlevel = 99
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'       : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
    \ ]
\ }
"}}}

" airline setting {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline_solarized_enable_command_color = 1
let g:airline_solarized_dark_inactive_border = 1
let g:airline_solarized_dark_inactive_background = 1
set laststatus=2
set timeoutlen=1000 ttimeoutlen=10
" shows COMMAND in status
"au CmdlineEnter * redraws
" }}}

" autopairs setting {{{
let g:AutoPairsShortcutJump='<C-f>'
let g:AutoPairsShortcutFastWrap='<C-w>'
let g:AutoPairsShortcutToggle = '<F6>'
let g:AutoPairsNormalJump=0

" toggle autopair settings when entering tex file
autocmd BufEnter *.tex let g:AutoPairs = {'(':')', '[':']', '{':'}'}
autocmd BufLeave *.tex let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
"}}}

" ctrlp settings {{{
nnoremap <leader>f :CtrlPCurWD<CR>
nnoremap <leader>c :CtrlPCurFile<CR>
nnoremap <leader>g :CtrlPLine<CR>
nnoremap <leader>p :CtrlPRoot<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPBufTag<CR>
nnoremap <leader>a :CtrlPTag<CR>
nnoremap <leader>m :CtrlPMRU<CR>

let g:ctrlp_max_depth = 9
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_extensions = ['tag']
let g:ctrlp_prompt_mappings = { 'PrtCurLeft()': ['<left>', '<c-^>']  }
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'
let g:ctrlp_root_markers = ['.tags_root']

let g:ctrlp_buftag_types = {
    \ 'armasm'        : '--language-force=asm',
    \ 'systemverilog' : '--language=systemverilog',
    \ 'objc'          : '--language=objectivec'
\ }
"}}}

" gutentags settings {{{
let g:gutentags_ctags_tagfile='.tags'
set tags=./.tags,.tags
" }}}

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
" black hole it to prevent overriding vim-move bindings
nmap <a-j> <Plug>IMAP_JumpForward
vmap <a-j> <Plug>IMAP_JumpForward
"}}}

" custom key mappings {{{
nnoremap <F9>  :TagbarToggle   <CR>
nnoremap <F8>  :NERDTreeToggle <CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bpreviou<CR>
nnoremap <C-S> :call StripTrailingWhitespace() <CR>
nnoremap <leader>w :w <CR>

" mapping for inserting newlines in normal mode
nnoremap <leader>j o<Esc>k
nnoremap <leader>k O<Esc>j

" mapping for splits
nnoremap <leader>s :split<Cr>
nnoremap <leader>v :vsplit<Cr>
"}}}

" custom fuctions {{{
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
"}}}
