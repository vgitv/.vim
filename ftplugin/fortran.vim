" indentation des boucles do
let fortran_do_enddo=1
let fortran_free_source=1

" chaîne commentaire et longueur
let comment = "!"
let lencomm = strlen(comment)

" local leader
let maplocalleader = "$"

" source le fichier commun
source ~/.vim/ftplugin/all.vim





" ----------------------------------------------------------------------------------------------------
" paramètres pour fortran
" ----------------------------------------------------------------------------------------------------
syn match fortranDirective "\v!\$\s"




" ===========================================================================================================
" MAPPINGS {{{
" ===========================================================================================================
" prochaine balise
inoremap <Tab> <Esc>/!++!<CR>"_c4l

" if then
inoremap <LocalLeader>i if<Space>()<Space>then<CR>
            \!++!<CR>
            \<BS>end if<Esc>2k_3la

" subroutine
inoremap <LocalLeader>s subroutine<Space><CR>
            \! paramètres<CR>
            \!++!<CR>
            \<CR>
            \! variables locales<CR>
            \!++!<CR>
            \<BS>end subroutine<Esc>6kA

" function
inoremap <LocalLeader>f function<Space><CR>
            \! paramètres<CR>
            \!++!<CR>
            \<CR>
            \! return<CR>
            \!++!<CR>
            \<CR>
            \! variables locales<CR>
            \!++!<CR>
            \<BS>end function<Esc>9kA

" type
inoremap <LocalLeader>t type<Space><CR>!++!<CR>end type<Esc>2kA

" do
inoremap <LocalLeader>d do<Space><CR>!++!<CR>end do<Esc>2kA

" while
inoremap <LocalLeader>w do while<Space><CR>!++!<CR>end do<Esc>2kA

" open
inoremap <LocalLeader>o open(unit = , file = !++!)<CR>!++!<CR>close(!++!)<Esc>2k_11la

" réels précision
inoremap çç _rp
inoremap àà .0_rp



" opérateurs
onoremap s :<C-U>execute "normal! ?subroutine\rV/end subroutine\r"<CR>
" }}}


" ===========================================================================================================
" ABBRÉVIATIONS {{{
" ===========================================================================================================
iabbrev real real(rp)
iabbrev int integer
" }}}

" ===========================================================================================================
" REGISTER COMMANDS {{{
" ===========================================================================================================
" pour créer l'en-tête, commencer à la fin du fichier
"nnoremap <F10> ?^    \(subroutine\\|function\)<CR>zzmzyygg/^!$<CR>p0r!'zzzk
let @a = "!?^    \(subroutine\|function\)zzmzyygg/^!$p0r!'zzzk"
" }}}
