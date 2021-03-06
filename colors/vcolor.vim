" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant 
" by Hamish Stuart Macpherson
"
" Personnalisation du thème molakai.
"

highlight clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    highlight clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="vcolor"

if exists("g:vcolor_original")
    let s:vcolor_original = g:vcolor_original
else
    let s:vcolor_original = 0
endif


" COLORS FOR GUI {{{
" -----------------------------------------------------------------------------------------------------------
" Dans l'ordre de :help group-name
" highlight Comment         guifg=#75715E
highlight Comment         guifg=#465457

highlight Constant        guifg=#AE81FF               gui=bold
highlight String          guifg=#E6DB74
highlight Character       guifg=#E6DB74
highlight Number          guifg=#AE81FF
highlight Boolean         guifg=#AE81FF
highlight Float           guifg=#AE81FF

highlight Identifier      guifg=#FD971F
highlight Function        guifg=#A6E22E

highlight Statement       guifg=#F92672               gui=bold
highlight Conditional     guifg=#F92672               gui=bold
highlight Repeat          guifg=#F92672               gui=bold
highlight Label           guifg=#E6DB74               gui=none
highlight Operator        guifg=#F92672
highlight Keyword         guifg=#F92672               gui=bold
highlight Exception       guifg=#A6E22E               gui=bold

highlight PreProc         guifg=#A6E22E
highlight Include         guifg=#66D9EF
highlight Define          guifg=#66D9EF
highlight Macro           guifg=#C4BE89               gui=italic
highlight PreCondit       guifg=#A6E22E               gui=bold

highlight Type            guifg=#66D9EF               gui=none
highlight StorageClass    guifg=#FD971F               gui=italic
highlight Structure       guifg=#66D9EF
highlight Typedef         guifg=#66D9EF

highlight Special         guifg=#66D9EF guibg=bg      gui=italic
highlight SpecialChar     guifg=#F92672               gui=bold
highlight Tag             guifg=#F92672               gui=italic
highlight Delimiter       guifg=#8F8F8F
highlight SpecialComment  guifg=#465457               gui=bold
highlight Debug           guifg=#BCA3A3               gui=bold

highlight Underlined      guifg=#808080               gui=underline

highlight Ignore          guifg=#808080 guibg=bg

highlight Error           guifg=#960050 guibg=#1E0010

highlight Todo            guifg=#FFFFFF guibg=bg      gui=bold
" -----------------------------------------------------------------------------------------------------------



highlight Cursor          guifg=#000000 guibg=#F8F8F0
highlight DiffAdd                       guibg=#13354A
highlight DiffChange      guifg=#89807D guibg=#4C4745
highlight DiffDelete      guifg=#960050 guibg=#1E0010
highlight DiffText                      guibg=#4C4745 gui=italic,bold

highlight Directory       guifg=#A6E22E               gui=bold
highlight ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
highlight FoldColumn      guifg=#465457 guibg=#000000
highlight Folded          guifg=#465457 guibg=#000000
highlight IncSearch       guifg=#C4BE89 guibg=#000000

highlight SpecialKey      guifg=#66D9EF               gui=italic

highlight MatchParen      guifg=#000000 guibg=#FD971F gui=bold
highlight ModeMsg         guifg=#E6DB74
highlight MoreMsg         guifg=#E6DB74

" complete menu
highlight Pmenu           guifg=#66D9EF guibg=#000000
highlight PmenuSel                      guibg=#808080
highlight PmenuSbar                     guibg=#080808
highlight PmenuThumb      guifg=#66D9EF

highlight Question        guifg=#66D9EF
highlight Search          guifg=#FFFFFF guibg=#455354
" ghlightmarks column
highlight SignColumn      guifg=#A6E22E guibg=#232526
highlight SpecialKey      guifg=#888A85               gui=italic
if has("spell")
    highlight SpellBad    guisp=#FF0000 gui=undercurl
    highlight SpellCap    guisp=#7070F0 gui=undercurl
    highlight SpellLocal  guisp=#70F0F0 gui=undercurl
    highlight SpellRare   guisp=#FFFFFF gui=undercurl
endif
highlight StatusLine      guifg=#455354 guibg=fg
highlight StatusLineNC    guifg=#808080 guibg=#080808
highlight Title           guifg=#ef5939


highlight VertSplit       guifg=#808080 guibg=#080808 gui=bold
highlight VisualNOS                     guibg=#403D3D
highlight Visual                        guibg=#403D3D
highlight WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
highlight WildMenu        guifg=#66D9EF guibg=#000000

if s:vcolor_original == 1
    highlight Normal          guifg=#F8F8F2 guibg=#272822
    highlight CursorLine                    guibg=#3E3D32
    highlight CursorColumn                  guibg=#3E3D32
    highlight LineNr          guifg=#BCBCBC guibg=#3B3A32
    highlight NonText         guifg=#BCBCBC guibg=#3B3A32
else
    highlight Normal          guifg=#F8F8F2 guibg=#1B1D1E
    highlight CursorLine                    guibg=#293739
    highlight CursorColumn                  guibg=#293739
    highlight LineNr          guifg=#BCBCBC guibg=#232526
    highlight NonText         guifg=#BCBCBC guibg=#232526
end
" }}}



"
" Support for 256-color terminal
"
" COLORS FOR TERM {{{
if &t_Co > 255
    " -------------------------------------------------------------------------------------------------------
    " Dans l'ordre de :help group-name
    highlight Comment         ctermfg=59

    highlight Constant        ctermfg=135                 cterm=bold
    highlight String          ctermfg=144
    highlight Character       ctermfg=144
    highlight Number          ctermfg=135
    highlight Boolean         ctermfg=135
    highlight Float           ctermfg=135  

    highlight Identifier      ctermfg=208  
    highlight Function        ctermfg=118  

    highlight Statement       ctermfg=161                 cterm=bold
    highlight Conditional     ctermfg=161                 cterm=bold
    highlight Repeat          ctermfg=161                 cterm=bold
    highlight Label           ctermfg=229                 cterm=none
    highlight Operator        ctermfg=161  
    highlight Keyword         ctermfg=161                 cterm=bold
    highlight Exception       ctermfg=118                 cterm=bold

    highlight PreProc         ctermfg=118  
    highlight Include         ctermfg=193
    highlight Define          ctermfg=193
    highlight Macro           ctermfg=193  
    highlight PreCondit       ctermfg=193                 cterm=bold

    highlight Type            ctermfg=81                  cterm=none
    highlight StorageClass    ctermfg=208  
    highlight Structure       ctermfg=81
    highlight Typedef         ctermfg=81

    highlight Special         ctermfg=81    ctermbg=232
    highlight SpecialChar     ctermfg=161                 cterm=bold
    highlight Tag             ctermfg=161  
    highlight Delimiter       ctermfg=241  
    highlight SpecialComment  ctermfg=245                 cterm=bold
    highlight Debug           ctermfg=225                 cterm=bold

    highlight Underlined      ctermfg=244                 cterm=underline

    highlight Ignore          ctermfg=244   ctermbg=232

    highlight Error           ctermfg=219   ctermbg=89

    highlight Todo            ctermfg=161   ctermbg=154   cterm=bold
    " -------------------------------------------------------------------------------------------------------

    highlight Cursor          ctermfg=16    ctermbg=253

    highlight DiffAdd                       ctermbg=24
    highlight DiffChange      ctermfg=181   ctermbg=239
    highlight DiffDelete      ctermfg=162   ctermbg=53
    highlight DiffText                      ctermbg=102   cterm=bold

    highlight Directory       ctermfg=118                 cterm=bold
    highlight ErrorMsg        ctermfg=199   ctermbg=16    cterm=bold
    highlight FoldColumn      ctermfg=67    ctermbg=16
    highlight Folded          ctermfg=67    ctermbg=16
    highlight IncSearch       ctermfg=193   ctermbg=16

    highlight SpecialKey      ctermfg=81

    highlight MatchParen      ctermfg=16    ctermbg=208   cterm=bold
    highlight ModeMsg         ctermfg=229  
    highlight MoreMsg         ctermfg=229  

    " complete menu
    highlight Pmenu           ctermfg=81    ctermbg=16
    highlight PmenuSel                      ctermbg=244
    highlight PmenuSbar                     ctermbg=232
    highlight PmenuThumb      ctermfg=81

    highlight Question        ctermfg=81
    highlight Search          ctermfg=253   ctermbg=66

    " marks column
    highlight SignColumn      ctermfg=118   ctermbg=235
    highlight SpecialKey      ctermfg=245  

    highlight StatusLine      ctermfg=238   ctermbg=253
    highlight StatusLineNC    ctermfg=244   ctermbg=232
    highlight Title           ctermfg=166  


    highlight VertSplit       ctermfg=244   ctermbg=232   cterm=bold
    highlight VisualNOS                     ctermbg=238
    highlight Visual                        ctermbg=235
    highlight WarningMsg      ctermfg=231   ctermbg=238   cterm=bold
    highlight WildMenu        ctermfg=81    ctermbg=16

    highlight Normal          ctermfg=252   ctermbg=233
    highlight CursorLine                    ctermbg=234   cterm=none
    highlight CursorColumn                  ctermbg=234
    highlight LineNr          ctermfg=250   ctermbg=234
    highlight NonText         ctermfg=232   ctermbg=234
end
" }}}
