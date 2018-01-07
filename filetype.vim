" my filetype file
"
" permet de savoir reconnaître un fichier d'extension .gnu comme un fichier
" gnuplot pour la coloration syntaxique (le fichier de coloration gnupot est
" le fichier ~/.vim/syntax/gnuplot.vim plus exactement ce fichier ajoute des
" règles supplémentaires pour la coloration syntaxique des fichiers gnuplot)
"
" De même, on mettra dans ce fichier toutes les règles pour reconnaître les
" extensions de fichiers (associé une extension à un langage)
"
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.gnu setfiletype gnuplot
    au! BufRead,BufNewFile *.tex setfiletype tex
augroup END
