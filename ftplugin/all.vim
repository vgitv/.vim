" source .vimrc
let my_filetype = &filetype
" nnoremap <Leader>s :source $MYVIMRC<CR> :source ~/.vim/ftplugin/<C-R>=my_filetype<CR>.vim<CR>

" commenter et décommenter
nnoremap <C-K> _i<C-R>=comment<CR><Space><ESC>_
nnoremap <C-J> _:execute "normal! ".lencomm."x"<CR>==

vnoremap <C-K> <ESC>'<<C-V>'>I<C-R>=comment<CR><Space><ESC>:w<CR>
vnoremap <C-J> <ESC>'<:execute "normal! ".lencomm."l"<CR>h<C-V>'>d='>:w<CR>

" box commentaires
nnoremap ,- o<Esc>:normal! <C-R>=&colorcolumn<CR>a-<Esc>mz==`zd$_R<C-R>=comment<CR><Space><Esc>_
nnoremap ,= o<Esc>:normal! <C-R>=&colorcolumn<CR>a=<Esc>mz==`zd$_R<C-R>=comment<CR><Space><Esc>_
nnoremap ,@ o<Esc>:normal! <C-R>=&colorcolumn<CR>a@<Esc>mz==`zd$_R<C-R>=comment<CR><Space><Esc>_
nnoremap ,> o<Esc>:normal! <C-R>=&colorcolumn<CR>a><Esc>mz==`zd$_R<C-R>=comment<CR><Space><Esc>_
nnoremap ,< o<Esc>:normal! <C-R>=&colorcolumn<CR>a<<Esc>mz==`zd$_R<C-R>=comment<CR><Space><Esc>_

" espace de code pour fold (voir :help foldmethod)
" nnoremap ,z o<Esc>:normal! <C-R>=&colorcolumn<CR>a=<Esc>mz==`zd$_R<C-R>=comment<CR><Space><Esc>yy3p_2lc$<Space>{{{<Esc>_2j2lc$}}}<Esc>_2kla
