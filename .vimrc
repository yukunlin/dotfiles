"{{{ vundle package manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'yukunlin/auto-pairs.git'
Bundle 'octol/vim-cpp-enhanced-highlight.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'davidhalter/jedi-vim.git'
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
Bundle 'bitc/lushtags.git'
Bundle 'terryma/vim-multiple-cursors.git'
Bundle 'eagletmt/neco-ghc.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'ervandew/supertab.git'
Bundle 'tpope/vim-surround.git'
Bundle 'nachumk/systemverilog.vim.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'SirVer/ultisnips.git'
Bundle 'honza/vim-snippets.git'
Bundle 'bling/vim-airline.git'
Bundle 'xolox/vim-easytags.git'
Bundle 'xolox/vim-misc.git'
Bundle 'yukunlin/vim-move.git'
Bundle 'justinmk/vim-syntax-extra.git'
Bundle 'dag/vim2hs.git'
Bundle 'altercation/vim-colors-solarized.git'
"}}}

" vim settings {{{

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
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
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
autocmd Filetype haskell setlocal omnifunc=necoghc#omnifunc

" GUI options
set gcr=a:blinkon0
set guioptions-=r
set guifont=Inconsolata\ for\ Powerline:h18
set guioptions-=T
set guioptions-=L

" custom indent for tex and system verilog
autocmd FileType tex source ~/.vim/tex.vim
autocmd FileType systemverilog source ~/.vim/sv.vim
"}}}

" map c-j and c-k to move lines up and down
let g:move_key_modifier ='C'
let g:move_select_mode = 0

" supertab settings
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabLongestHighlight = 1

" jedi settings
let g:jedi#popup_on_dot = 0
let g:jedi#auto_vim_configuration = 0

" ultisnips settings
let g:UltiSnipsExpandTrigger = '<c-space>'

" taglist settings {{{
let Tlist_WinWidth = 30
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_foldlevel = 99
"}}}

" airline setting {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
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

autocmd BufEnter *.hs nnoremap <leader>t :CtrlPTag <CR>
autocmd BufLeave *.hs nnoremap <leader>t :CtrlPBufTag <CR>

let g:ctrlp_max_depth = 3
let g:ctrlp_extensions = ['tag']
let g:ctrlp_prompt_mappings = { 'PrtCurLeft()': ['<left>', '<c-^>']  }
"}}}

" easytags settings {{{
let g:easytags_updatetime_min=5000
let g:easytags_updatetime_warn=0
set tags=./.tags
let g:easytags_dynamic_files = 2
" hack because dynamic_files = 2 doesn't seem to work for haskell files
autocmd bufread,bufnewfile *.hs silent! !touch .tags
"}}}

" vim_latex settings {{{
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf='skim'
let g:Tex_FoldedSections=""
let g:Tex_FoldedMisc="<<<"
let g:Tex_GotoError = 0
let g:Tex_ShowErrorContext = 0
let g:Tex_FoldedEnvironments="verbatim,Verbatim,comment,eq,gather,align,align*,equation*,figure,table,thebibliography,keywords,abstract,titlepage,algorithm"
imap <c-k> <Plug>IMAP_JumpBack
smap <c-k> <Plug>IMAP_JumpBack
"}}}

" vim2hs settings
let g:haskell_conceal = 0

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
"}}}
