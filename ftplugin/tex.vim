"set spell spelllang=fr spell
set colorcolumn&
set wrap
set linebreak
"set background=light
"colorscheme solarized
"colorscheme gruvbox
"
let s:balise = "<++>"
let s:n = strlen(s:balise)
set tabstop=2
set shiftwidth=2
let g:tex_flavor='latex'

" compiler en mode insertion (enregistre aussi)
imap <F4> <Esc>:w<CR><F4>

" aller à la prochaine balise avec tab
inoremap <Tab> <Esc>/<++><CR>"_c4l

" sortir de l'accolade fermante et ajouter après
inoremap ;; <Esc>la



" -----------------------------------------------------------------------------------------------------------
" sectionnement (1, 2, 3, 4 sans le shift)
" -----------------------------------------------------------------------------------------------------------
inoremap ;& \part{}<CR><++><Esc>k$i
inoremap ;é \chapter{}<CR><++><Esc>k$i
inoremap ;" \section{}<CR><++><Esc>k$i
inoremap ;' \subsection{}<CR><++><Esc>k$i



" -----------------------------------------------------------------------------------------------------------
" mises en forme
" -----------------------------------------------------------------------------------------------------------
inoremap ;e \emph{}<Esc>i
inoremap ;b \textbf{}<Esc>i
inoremap ;t \text{}<Esc>i



" -----------------------------------------------------------------------------------------------------------
" inclusions (deux lettres répétés)
" -----------------------------------------------------------------------------------------------------------
inoremap ;gg \noindent\begin{minipage}{\textwidth}<CR>
             \\noindent\includegraphics[width=\textwidth]{<++>}<CR>
             \\captionof{figure}{<++>}<CR>
             \\label{fig:<++>}<CR>
             \\end{minipage}<Esc>4kf{f{a

inoremap ;cc \noindent\lstinputlisting{}<Esc>i



" -----------------------------------------------------------------------------------------------------------
" environnement maths (deux lettres différentes)
" -----------------------------------------------------------------------------------------------------------
inoremap ;ma $$<Space><++><Esc>2T$i
inoremap ;eq <CR>$$$$<CR><++><Esc>k_2li



" -----------------------------------------------------------------------------------------------------------
" maths (une lettre si possible)
" -----------------------------------------------------------------------------------------------------------
inoremap ;u ^{}<Esc>i
inoremap ;d _{}<Esc>i
inoremap ;f \frac{}{<++>}<Esc>6hi
inoremap ;i \int_{}^{<++>} <++> \mathrm{d}<++><Esc>T_a
inoremap ;s \sum_{}^{<++>} <++><Esc>T_a
inoremap ;v \vec{}<Esc>i



" -----------------------------------------------------------------------------------------------------------
" environnements divers (trois lettres, les 3 premières)
" -----------------------------------------------------------------------------------------------------------
inoremap ;tab \begin{tabular}{}<CR>
              \<++><CR>
              \\end{tabular}<Esc>2k$i

inoremap ;min \noindent\begin{minipage}{}<CR>
              \<++><CR>
              \\end{minipage}<Esc>2k$i

inoremap ;lst \begin{lstlisting}<CR>
              \\end{lstlisting}<Esc>O

inoremap ;mat \begin{matrix}<CR>
              \<++><CR>
              \\end{<++>matrix}<Esc>2kT{i

inoremap ;ali \begin{align}<CR>
              \\end{align}<Esc>O

inoremap ;equ \begin{equation}<CR>
              \\end{equation}<Esc>O

inoremap ;arr \begin{array}{}<CR>
              \<++><CR>
              \\end{array}<Esc>2k$i

inoremap ;enu \begin{enumerate}<CR>
              \\item<Space><CR>
              \\end{enumerate}<Esc>kA



" -----------------------------------------------------------------------------------------------------------
" délimiteurs
" -----------------------------------------------------------------------------------------------------------
inoremap ;( \left(<Space><Space>\right)<Esc>7hi
inoremap ;[ \left[<Space><Space>\right]<Esc>7hi
inoremap ;{ \left\{<Space><Space>\right\}<Esc>8hi
