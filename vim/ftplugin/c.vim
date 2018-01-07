setlocal comments-=://
setlocal comments+=f://



" ---------------------------------------------------------------------
" raccourcis
" ---------------------------------------------------------------------
" pour switcher entre .h et .c
map <F3> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

" pour commenter une ligne en C et sauvegarder
nmap <C-K> _i//<ESC>:w<CR>

" pour décommenter une ligne et sauvegarder
nmap <C-J> _xx:w<CR>
