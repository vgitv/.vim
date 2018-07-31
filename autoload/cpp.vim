function! cpp#SwitchSourceHeader()
    if expand('%:e') ==? 'cpp'
        let l:file = expand('%:r') . '.h'
        if filereadable(l:file)
            execute 'edit' l:file
        else
            echo l:file . ' n''existe pas'
        endif

    elseif expand('%:e') ==? 'h'
        let l:file = expand('%:r') . '.cpp'
        execute 'buffer' l:file
        execute 'bwipe #'
    endif
endfunction

function! cpp#SplitSourceHeader()
    if expand('%:e') ==? 'cpp'
        let l:file = expand('%:r') . '.h'
        if filereadable(l:file)
            execute 'split' l:file
        else
            echo l:file . ' n''existe pas'
        endif
    elseif expand('%:e') ==? 'h'
        bwipe
    endif
endfunction
