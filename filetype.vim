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
    autocmd!
    autocmd! BufRead,BufNewFile *.gnu setfiletype gnuplot
    autocmd! BufRead,BufNewFile *.tex setfiletype tex
    autocmd! BufRead,BufNewFile *.mx  setfiletype maxima
    autocmd! BufRead,BufNewFile *.pn  setfiletype potion
    autocmd! BufRead,BufNewFile *.reg setfiletype pcre
    autocmd! BufRead,BufNewFile *.vf  setfiletype vfortran
    autocmd! BufRead,BufNewFile *.vmd setfiletype vmarkdown
    autocmd! BufRead,BufNewFile *.zsh* setfiletype zsh
    autocmd! BufRead,BufNewFile *.vl  setfiletype vlanguage
    autocmd! BufRead,BufNewFile *.nml  setfiletype namelist
augroup END
