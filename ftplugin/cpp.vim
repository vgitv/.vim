" empêche de s'appliquer au fichier c
if (&ft != 'cpp')
    finish
endif
"

" chaîne commentaire et longueur
let comment = "//"
let lencomm = strlen(comment)

" local leader
let maplocalleader = "$"


" ---------------------------------------------------------------------
" raccourcis
" ---------------------------------------------------------------------
" pour switcher entre .h et .c
"
" FONCTIONNEMENT
" :e permet d'éditer un fichier à la place de l'onglet courant. On peut faire
" par exemple      :e autrefichier.h
" pour switcher entre .c et .h, il faut récupérer le nom du fichier courant,
" remplacer .c par .h ou .h par .c en fc du fichier courant.
"
" % permet de récupérer le nom du fichier courant.
" :. indique qu'on veut seulement le chemin à partir de ./ (!= chemin abs)
" :s remplace du texte : :s?expression regulière?elt de substitution?
"       (? peut être remplacé par n'importe quel caractère)
"
" Les remplacements vont s'effectués dans l'ordre. D'où l'intérêt de passer
" par une extension .X123X arbitraire (c'est comme pour échanger la valeur de
" deux variables, on doit passer par une variable intermédiaire)
"
" par défaut, un .h est un fichier cpp (en soit on ne peut pas savoir si c'est
" du C ou C++)
"
" Pour voir l'aide de vim    :h filename-modifiers
" map <F3> :e %:t:s?.h$?.X123X?:s?.cpp$?.h?:s?.X123X$?.cpp?<CR>

" pour commenter une ligne en C et sauvegarder
nmap <C-K> _i//<ESC>:w<CR>

" pour décommenter une ligne et sauvegarder
nmap <C-J> _xx:w<CR>

" prochaine balise
inoremap <Tab> <Esc>/<++><CR>"_c4l

" classe
inoremap <LocalLeader>c class<CR>{<CR><++><CR>};<Esc>3kA<Space>

" include
inoremap <LocalLeader>< #include <><Esc>i
inoremap <LocalLeader>" #include ""<Esc>i

inoremap <LocalLeader>f for (; <++>; <++>)<CR>{<CR><++><CR>}<Esc>3k_4la
inoremap <LocalLeader>w while ()<CR>{<CR><++><CR>}<Esc>3k_6la

nnoremap <F8> p==$xo{<CR>}<Esc>2k0w

" nnoremap <F3> :call cpp#SwitchSourceHeader()<CR>
nnoremap <F3> :call cpp#SplitSourceHeader()<CR>
