" Vim indent file
" Language:	Fortran 95
" Version: 1.0
" Created: 2018 June 11
" Last Change: 2018 June 20
" Maintainer: V. M.
" Usage: to copy in ~/.vim/fortran.vim. Add 'filetype plugin indent on' in vimrc.
" Credits:



" -----------------------------------------------------------------------------------------------------------
" Appeler la fonction d'indentation quand ces mots sont tapés en insertion.
" ------------------------------------------------------------------------------------------------------------
setlocal indentkeys+==~#
setlocal indentkeys+==~program
setlocal indentkeys+==~module
setlocal indentkeys+==~submodule
setlocal indentkeys+==~contains

setlocal indentkeys+==~if
setlocal indentkeys+==~elseif
setlocal indentkeys+==~else
setlocal indentkeys+==~elsewhere
setlocal indentkeys+==~where
setlocal indentkeys+==~endif

setlocal indentkeys+==~type
setlocal indentkeys+==~associate
setlocal indentkeys+==~function
setlocal indentkeys+==~subroutine

setlocal indentkeys+==~do
setlocal indentkeys+==~enddo
setlocal indentkeys+==~while
setlocal indentkeys+==~close
setlocal indentkeys+==~select
setlocal indentkeys+==~case
setlocal indentkeys+==~default



" -----------------------------------------------------------------------------------------------------------
" Define the appropriate indent function but only once
" -----------------------------------------------------------------------------------------------------------
" À compléter avec le format fixe.
setlocal indentexpr=FortranGetFreeIndent()
if exists("*FortranGetFreeIndent")
    finish
endif



" -----------------------------------------------------------------------------------------------------------
" Donne le numéro de la ligne précédente (fait abstraction des lignes !comm et #preproc)
" -----------------------------------------------------------------------------------------------------------
function PrevCodeLine(lnum)
    " passer les lignes commentées et les commandes préprocesseur
    let SKIP_LINES = '^\s*\(!\|#\)'

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



" À ajouter :
"   - enum
"   - class
"   - block
"   - forall

" -----------------------------------------------------------------------------------------------------------
" Indentation format libre
" -----------------------------------------------------------------------------------------------------------
function FortranGetFreeIndent()
    " number of previous line
    let l:prev = PrevCodeLine(v:lnum)
    " indent of previous line, futur return
    let l:ind = indent(l:prev)

    if v:lnum == 1
        return 0
    endif



    " -------------------------------------------------------------------------------------------------------
    "  INSTRUCTIONS PROGRAMMES ET PRÉPROCESSEURS, INDENTATION ZÉRO, RETURN
    "  PROGRAM, MODULE, SUBMODULE, CONTAINS
    "  END PROGRAM, END MODULE, END SUBMODULE
    " -------------------------------------------------------------------------------------------------------
    if getline(v:lnum) =~? '^\s*\(#\|program\|module\|submodule\|contains\|'
                \ . 'end\s*\(program\|module\|submodule\)\)'
        let l:ind = 0
        return l:ind
    endif



    " -------------------------------------------------------------------------------------------------------
    "  PRINCIPAUX BLOCS : 
    "  PROGRAM, MODULE, CONTAINS, 
    "  IF, ELSE, ELSE IF, DO, DO WHILE, WHERE, ELSE WHERE, OPEN
    "  RECURSIVE, PURE, IMPURE, FUNCTION, SUBROUTINE, INTERFACE, ABSTRACT
    "  TYPE
    " -------------------------------------------------------------------------------------------------------
    if getline(l:prev) =~? '^\s*\(program\|module\|contains\|'
                \ . 'if\|else\|else\s*if\|do\|do\s*while\|where\|else\s*where\|open\|'
                \ . 'recursive\|pure\|impure\|elemental\|function\|subroutine\|interface\|abstract\|'
                \ . 'type\s*::\|associate\)'
        " Indentation ++ début de bloc
        let l:ind += shiftwidth()
        echom "un"
    endif

    " FERMETURE DU BLOC :
    " ELSE, ELSE IF, END IF, END DO, END WHERE, CLOSE
    " END FUNCTION, END SUBROUTINE, END INTERFACE
    " END TYPE
    if getline(v:lnum) =~? '^\s*\(else\|else\s*if\|end\s*\(if\|do\|where\)\|close\|'
                \ . 'end\s*\(function\|subroutine\|interface\)\|'
                \ . 'end\s*\(type\|associate\)\)'
        " Indentation -- fin de bloc
        let l:ind -= shiftwidth()
        echom "deux"
    endif



    " -------------------------------------------------------------------------------------------------------
    "  CONTINUATION DE LIGNE AVEC &
    " -------------------------------------------------------------------------------------------------------
    if getline(v:lnum - 1) =~? '&$' && getline(v:lnum - 2) !~? '&$'
        " Indentation ++ continuation de ligne.
        let l:ind += shiftwidth()
    elseif getline(l:prev) !~? '&$' && getline(PrevCodeLine(l:prev)) =~? '&$'
        " Indentation -- continuation de ligne.
        let l:ind -= shiftwidth()
    endif



    " -------------------------------------------------------------------------------------------------------
    "  CAS PARTICULIER ET TORTUEUX DU SELECT CASE
    " -------------------------------------------------------------------------------------------------------
    if getline(l:prev) =~? '^\s*select\s*case'
        let l:ind += shiftwidth()
    endif

    if getline(l:prev) =~? '^\s*\(case\|default\)'
        let l:ind += shiftwidth()
    endif

    if getline(v:lnum) =~ '^\s*\(case\|default\)'
        let l:ind -= shiftwidth()
    endif

    if getline(v:lnum) =~? '^\s*end\s*select'
        let l:ind -= shiftwidth()
    endif

    return l:ind
endfunction



" -----------------------------------------------------------------------------------------------------------
" Indentation format fixe
" -----------------------------------------------------------------------------------------------------------
function FortranGetFixedIndent(lnum)
endfunction
