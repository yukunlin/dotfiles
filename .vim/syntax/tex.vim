syntax spell default
syntax spell toplevel
setlocal tabstop=2
setlocal spell spelllang=en_us
setlocal textwidth=90

call Tex_MakeMap('<leader>ll', ':update!<CR>:call Tex_RunLaTeX()<CR>', 'n', '<buffer>')
