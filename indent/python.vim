" Vim indent file
" Language:	python
" Version: 1.0
" Created: 2018 June 25
" Last Change: 2018 June 26
" Maintainer: V. M.
" Usage: to copy in ~/.vim/python.vim. Add 'filetype plugin indent on' in vimrc.
" Credits:



" -----------------------------------------------------------------------------------------------------------
" LOCAL OPTIONS
" -----------------------------------------------------------------------------------------------------------
setlocal nosmartindent
setlocal nolisp
setlocal autoindent



" -----------------------------------------------------------------------------------------------------------
" APPELER LA FONCTION D'INDENTATION QUAND CES MOTS SONT TAPÉS EN INSERTION.
" ------------------------------------------------------------------------------------------------------------
setlocal indentkeys+==~#}
setlocal indentkeys+==~else
setlocal indentkeys+==~elif



" -----------------------------------------------------------------------------------------------------------
" DEFINE INDENT FUNCTION BUT ONLY ONCE
" -----------------------------------------------------------------------------------------------------------
" Avoid loading system indent file. See /usr/share/vim/vimXX/indent/python.vim.
let b:did_indent = 1

setlocal indentexpr=PythonGetIndent()
if exists("*PythonGetIndent")
    finish
endif



" -----------------------------------------------------------------------------------------------------------
" DONNE LE NUMÉRO DE LA LIGNE PRÉCÉDENTE (FAIT ABSTRACTION DES LIGNES !COMM ET #PREPROC)
" -----------------------------------------------------------------------------------------------------------
function PrevCodeLine(lnum)
    " passer les lignes commentées et les commandes préprocesseur
    let SKIP_LINES = '^\s*#\[^}\]'

    let nline = a:lnum
    while nline > 0
        let nline = prevnonblank(nline - 1)
        " différente regexp : !~   ignorer la casse : ?   total : !~?
        if getline(nline) !~? SKIP_LINES
            break
        endif
    endwhile

    return nline
endfunction



" -----------------------------------------------------------------------------------------------------------
" INDENTATION FORMAT LIBRE
" -----------------------------------------------------------------------------------------------------------
function PythonGetIndent()
    " number of previous line
    let l:prev = PrevCodeLine(v:lnum)
    " indent of previous line, futur return
    let l:ind = indent(l:prev)
    " fin de ligne non terminée
    let l:continue = '\(=\|(\|{\|[\|,\|+\|-\|*\|/\)\s*$'

    if v:lnum == 1
        return 0
    endif


    " -------------------------------------------------------------------------------------------------------
    "  DÉBUT ET FIN DE BLOC
    " -------------------------------------------------------------------------------------------------------
    if getline(l:prev) =~? ':\s*$' && getline(l:prev) !~? '^\s*#'
        let l:ind += shiftwidth()
    endif

    if getline(v:lnum) =~? '^\s*#}'
        let l:ind -= shiftwidth()
    endif

    " -------------------------------------------------------------------------------------------------------
    " RETRAIT MILIEU DE BLOC
    " -------------------------------------------------------------------------------------------------------
    if getline(v:lnum) =~? '^\s*\(else\|elif\)'
        let l:ind -= shiftwidth()
    endif

    " -------------------------------------------------------------------------------------------------------
    " CONTINUATION DE LIGNE
    " -------------------------------------------------------------------------------------------------------
    let l:temp = getline(v:lnum - 1)

    if l:temp =~? l:continue && getline(v:lnum - 2) !~? l:continue
        " Indentation ++ continuation de ligne.
        if l:temp !~? '^\s*#'
            let l:ind += shiftwidth()
        endif
    elseif getline(l:prev) !~? l:continue && getline(PrevCodeLine(l:prev)) =~? l:continue
        " Indentation -- continuation de ligne.
        if getline(PrevCodeLine(l:prev)) !~? '^\s*#'
            let l:ind -= shiftwidth()
        endif
    endif

    return l:ind
endfunction
