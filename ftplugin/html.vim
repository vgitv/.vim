"set spell spelllang=fr spell
set colorcolumn&
set wrap
set linebreak
"set background=light
"colorscheme solarized
"colorscheme gruvbox
"
let s:balise = "<!!>"
let s:n = strlen(s:balise)
set tabstop=2
set shiftwidth=2
let g:tex_flavor='latex'

" compiler en mode insertion (enregistre aussi)
imap <F4> <Esc>:w<CR><F4>

" aller à la prochaine balise avec tab
inoremap <Tab> <Esc>/<!!><CR>"_c4l

" sortir de l'accolade fermante et ajouter après
inoremap ;; <Esc>la


inoremap ;ht <html><CR></html><ESC>O
inoremap ;he <head><CR></head><ESC>O
inoremap ;bo <body><CR></body><ESC>O

" paragraph
inoremap ;pp <p></p><Esc>3hi

" break line
inoremap ;br <br />

" emphasis
inoremap ;em <em></em><!!><Esc>8hi

" strong
inoremap ;st <strong></strong><!!><Esc>12hi

" marquage du texte
inoremap ;ma <mark></mark><!!><Esc>10hi

" listes
inoremap ;ul <ul><CR>
            \<li></li><CR>
            \</ul><Esc>k_3la

" listes ordonées
inoremap ;ol <ol><CR>
            \<li></li><CR>
            \</ol><Esc>k_3la

" puces
inoremap ;li <li></li><Esc>4hi

" titres
inoremap ;& <h1></h1><Esc>4hi
inoremap ;é <h2></h2><Esc>4hi
inoremap ;" <h3></h3><Esc>4hi
inoremap ;' <h4></h4><Esc>4hi
inoremap ;( <h5></h5><Esc>4hi
inoremap ;- <h6></h6><Esc>4hi
