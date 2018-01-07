inoremap <Tab> <Esc>/!++!<CR>"_c4l


inoremap $i if<Space>()<Space>then<CR>
            \!++!<CR>
            \<BS>end if<Esc>2k_3la

inoremap $s subroutine<Space><CR>
            \implicit none<CR>
            \<CR>
            \! paramètres<CR>
            \!++!<CR>
            \<CR>
            \! variables locales<CR>
            \!++!<CR>
            \<BS>end subroutine<Esc>8kA

inoremap $f function<Space><CR>
            \implicit none<CR>
            \<CR>
            \! paramètres<CR>
            \!++!<CR>
            \<CR>
            \! return<CR>
            \!++!<CR>
            \<CR>
            \! variables locales<CR>
            \!++!<CR>
            \<BS>end function<Esc>11kA

inoremap $t type<Space><CR>!++!<CR>end type<Esc>2kA

inoremap $d do<Space><CR>!++!<CR>end do<Esc>2kA

inoremap $w do while<Space><CR>!++!<CR>end do<Esc>2kA

inoremap $o open(unit = , file = !++!)<CR>!++!<CR>close(!++!)<Esc>2k_11la
