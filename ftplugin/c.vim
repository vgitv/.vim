" empêche de s'appliquer au fichier cpp
if (&ft != 'c')
    finish
endif
"

" chaîne commentaire et longueur
let comment = "//"
let lencomm = strlen(comment)

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
" Par défaut, un fichier .h est assumé C++. On impose donc manuellement le
" langage à la fin de la commande. Ceci fonctionnera si on ouvre un .c en
" premier et qu'on switche uniquement en utilisant le raccourcis F3. Si on
" ouvre un .h en premier, il sera vu comme un fichier C++ et la commande F3
" qui s'appliquera sera celle du script cpp.vim. La commande ouvrira donc un
" fichier %.cpp vide.
"
" Pour voir l'aide de vim    :h filename-modifierse
map <F3> :e %:t:s?.h$?.X123X?:s?.c$?.h?:s?.X123X$?.c?<CR>:setlocal filetype=c<CR>

" pour commenter une ligne en C et sauvegarder
nmap <C-K> _i//<ESC>:w<CR>

" pour décommenter une ligne et sauvegarder
nmap <C-J> _xx:w<CR>
