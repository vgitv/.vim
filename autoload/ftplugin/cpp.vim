function! ftplugin#cpp#SwitchSourceHeader()
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

function! ftplugin#cpp#OldSplitSourceHeader()
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

function! ftplugin#cpp#SplitSourceHeader()
    " let l:file_current_name = expand('%')
    " let l:file_current_extension = expand('%:e')
    let l:file_root_name = expand('%:r')
    let l:file_header_name = l:file_root_name . '.h'
    " let l:file_source_name = l:file_root_name . '.cpp'

    let l:header_bn = bufnr(l:file_header_name)

    if l:header_bn > 0
        " let l:header_win = win_findbuf(l:header_bn)[0]
        " let l:out = win_gotoid(l:header_win)
        wincmd k
        if expand('%:e') ==? 'h'
            bwipe
        else
            echo 'Attention, le buffer ' . l:file_header_name . ' n''a pas été supprimé (bwipe)'
        endif
    else
        if filereadable(l:file_header_name)
            execute 'split' l:file_header_name
        else
            echom l:file_header_name . ' n''existe pas'
        endif
    endif
endfunction
