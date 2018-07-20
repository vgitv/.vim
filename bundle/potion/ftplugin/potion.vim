setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)



" -----------------------------------------------------------------------------------------------------------
" -----------------------------------------------------------------------------------------------------------
function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction



" -----------------------------------------------------------------------------------------------------------
" -----------------------------------------------------------------------------------------------------------
function! NextNonBlankLine(lnum)
    let totlines = line('$')
    let current = a:lnum + 1

    while current <= totlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
endfunction



" -----------------------------------------------------------------------------------------------------------
" -----------------------------------------------------------------------------------------------------------
function! GetPotionFold(lnum)
    " blanck lines
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    " get indent level of current line and the one that follow
    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        return '>' . next_indent
    endif
endfunction
