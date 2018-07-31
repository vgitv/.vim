" chaîne commentaire et longueur
let comment = "%"
let lencomm = strlen(comment)

" source le fichier commun
execute 'source' g:CONF . '/ftplugin/all.vim'

"setlocal spell spelllang=fr spell
setlocal colorcolumn&
setlocal wrap
setlocal linebreak
"setlocal background=light
"colorscheme solarized
"colorscheme gruvbox
"
let s:balise = "<++>"
let s:n = strlen(s:balise)
setlocal tabstop=2
setlocal shiftwidth=2
let g:tex_flavor='latex'

" local leader
let maplocalleader = ";"

" compiler en mode insertion (enregistre aussi)
imap <F4> <Esc>:w<CR><F4>

" aller à la prochaine balise avec tab
inoremap <Tab> <Esc>/<++><CR>"_c4l

" sortir de l'accolade fermante et ajouter après
inoremap <LocalLeader>; <Esc>la



" -----------------------------------------------------------------------------------------------------------
" sectionnement (1, 2, 3, 4 sans le shift)
" -----------------------------------------------------------------------------------------------------------
inoremap <LocalLeader>& \part{}<CR><++><Esc>k$i
inoremap <LocalLeader>é \chapter{}<CR><++><Esc>k$i
inoremap <LocalLeader>" \section{}<CR><++><Esc>k$i
inoremap <LocalLeader>' \subsection{}<CR><++><Esc>k$i



" -----------------------------------------------------------------------------------------------------------
" mises en forme
" -----------------------------------------------------------------------------------------------------------
inoremap <LocalLeader>e \emph{}<Esc>i
inoremap <LocalLeader>b \textbf{}<Esc>i
inoremap <LocalLeader>t \text{}<Esc>i



" -----------------------------------------------------------------------------------------------------------
" inclusions (deux lettres répétés)
" -----------------------------------------------------------------------------------------------------------
inoremap <LocalLeader>gg \noindent\begin{minipage}{\textwidth}<CR>
             \\noindent\includegraphics[width=\textwidth]{<++>}<CR>
             \\captionof{figure}{<++>}<CR>
             \\label{fig:<++>}<CR>
             \\end{minipage}<Esc>4kf{f{a


"}}
" On ajoute le commentaire précédent pour corriger la coloration dans vim.

inoremap <LocalLeader>cc \noindent\lstinputlisting{}<Esc>i



" -----------------------------------------------------------------------------------------------------------
" environnement maths (deux lettres différentes)
" -----------------------------------------------------------------------------------------------------------
inoremap <LocalLeader>ma $$<Space><++><Esc>2T$i
inoremap <LocalLeader>eq <CR>$$$$<CR><++><Esc>k_2li



" -----------------------------------------------------------------------------------------------------------
" maths (une lettre si possible)
" -----------------------------------------------------------------------------------------------------------
inoremap <LocalLeader>u ^{}<Esc>i
inoremap <LocalLeader>d _{}<Esc>i
inoremap <LocalLeader>f \frac{}{<++>}<Esc>6hi
inoremap <LocalLeader>i \int_{}^{<++>} <++> \mathrm{d}<++><Esc>T_a
inoremap <LocalLeader>s \sum_{}^{<++>} <++><Esc>T_a
inoremap <LocalLeader>v \vec{}<Esc>i



" -----------------------------------------------------------------------------------------------------------
" environnements divers (trois lettres, les 3 premières)
" -----------------------------------------------------------------------------------------------------------
inoremap <LocalLeader>tab \begin{tabular}{}<CR>
              \<++><CR>
              \\end{tabular}<Esc>2k$i

inoremap <LocalLeader>min \noindent\begin{minipage}{}<CR>
              \<++><CR>
              \\end{minipage}<Esc>2k$i

inoremap <LocalLeader>lst \begin{lstlisting}<CR>
              \\end{lstlisting}<Esc>O

inoremap <LocalLeader>mat \begin{matrix}<CR>
              \<++><CR>
              \\end{<++>matrix}<Esc>2kT{i

"}
" On ajoute le commentaire précédent pour corriger la coloration dans vim.

inoremap <LocalLeader>ali \begin{align}<CR>
              \\end{align}<Esc>O

inoremap <LocalLeader>equ \begin{equation}<CR>
              \\end{equation}<Esc>O

inoremap <LocalLeader>arr \begin{array}{}<CR>
              \<++><CR>
              \\end{array}<Esc>2k$i

inoremap <LocalLeader>enu \begin{enumerate}<CR>
              \\item<Space><CR>
              \\end{enumerate}<Esc>kA



" -----------------------------------------------------------------------------------------------------------
" délimiteurs
" -----------------------------------------------------------------------------------------------------------
inoremap <LocalLeader>( \left(<Space><Space>\right)<Esc>7hi
inoremap <LocalLeader>[ \left[<Space><Space>\right]<Esc>7hi
inoremap <LocalLeader>{ \left\{<Space><Space>\right\}<Esc>8hi
