" ===========================================================================================================
" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim



" ===========================================================================================================
" FUNCTIONS {{{
" ===========================================================================================================

" -----------------------------------------------------------------------------------------------------------
" donne le nom de la branche
" -----------------------------------------------------------------------------------------------------------
function GetBranchName()
    let l:branch = ''

    " let l:cmd = '~/.vim/vgit ' . expand('%:p:h') . ' ' . expand('%:t')
    " let l:git = systemlist(l:cmd)

    " if l:git[0] ==? 'true'
    "     let l:branch = l:git[1]
    "     if l:git[2] ==? 'true'
    "         let l:branch = l:branch . ' ▴'
    "     else
    "         let l:branch = l:branch . ' ▾'
    "     endif
    " else
    "     let l:branch = ''
    " endif

    return l:branch
endfunction

" -----------------------------------------------------------------------------------------------------------
" Display highlight groups (see :help highlight-groups).
" -----------------------------------------------------------------------------------------------------------
function HiGrp()
    echohl ColorColumn | echo "ColorColumn"
    echohl Conceal | echo "Conceal"
    echohl Cursor | echo "Cursor"
    echohl CursorIM | echo "CursorIM"
    echohl CursorColumn | echo "CursorColumn"
    echohl CursorLine | echo "CursorLine"
    echohl Directory | echo "Directory"
    echohl DiffAdd | echo "DiffAdd"
    echohl DiffChange | echo "DiffChange"
    echohl DiffDelete | echo "DiffDelete"
    echohl DiffText | echo "DiffText"
    echohl ErrorMsg | echo "ErrorMsg"
    echohl VertSplit | echo "VertSplit"
    echohl Folded | echo "Folded"
    echohl FoldColumn | echo "FoldColumn"
    echohl SignColumn | echo "SignColumn"
    echohl IncSearch | echo "IncSearch"
    echohl LineNr | echo "LineNr"
    echohl CursorLineNr | echo "CursorLineNr"
    echohl MatchParen | echo "MatchParen"
    echohl ModeMsg | echo "ModeMsg"
    echohl MoreMsg | echo "MoreMsg"
    echohl NonText | echo "NonText"
    echohl Normal | echo "Normal"
    echohl Pmenu | echo "Pmenu"
    echohl PmenuSel | echo "PmenuSel"
    echohl PmenuSbar | echo "PmenuSbar"
    echohl PmenuThumb | echo "PmenuThumb"
    echohl Question | echo "Question"
    echohl Search | echo "Search"
    echohl SpecialKey | echo "SpecialKey"
    echohl SpellBad | echo "SpellBad"
    echohl SpellCap | echo "SpellCap"
    echohl SpellLocal | echo "SpellLocal"
    echohl SpellRare | echo "SpellRare"
    echohl StatusLine | echo "StatusLine"
    echohl StatusLineNC | echo "StatusLineNC"
    echohl TabLine | echo "TabLine"
    echohl TabLineFill | echo "TabLineFill"
    echohl TabLineSel | echo "TabLineSel"
    echohl Title | echo "Title"
    echohl Visual | echo "Visual"
    echohl VisualNOS | echo "VisualNOS"
    echohl WarningMsg | echo "WarningMsg"
    echohl WildMenu | echo "WildMenu"
    echohl None
endfunction

" -----------------------------------------------------------------------------------------------------------
" convert 255 colors of term to hex color
" -----------------------------------------------------------------------------------------------------------
function GetHex(num)
    let l:col = ['000000', '800000', '008000', '808000', '000080', '800080', '008080', 'c0c0c0', '808080', 'ff0000', '00ff00', 'ffff00', '0000ff', 'ff00ff', '00ffff', 'ffffff', '000000', '00005f', '000087', '0000af', '0000d7', '0000ff', '005f00', '005f5f', '005f87', '005faf', '005fd7', '005fff', '008700', '00875f', '008787', '0087af', '0087d7', '0087ff', '00af00', '00af5f', '00af87', '00afaf', '00afd7', '00afff', '00d700', '00d75f', '00d787', '00d7af', '00d7d7', '00d7ff', '00ff00', '00ff5f', '00ff87', '00ffaf', '00ffd7', '00ffff', '5f0000', '5f005f', '5f0087', '5f00af', '5f00d7', '5f00ff', '5f5f00', '5f5f5f', '5f5f87', '5f5faf', '5f5fd7', '5f5fff', '5f8700', '5f875f', '5f8787', '5f87af', '5f87d7', '5f87ff', '5faf00', '5faf5f', '5faf87', '5fafaf', '5fafd7', '5fafff', '5fd700', '5fd75f', '5fd787', '5fd7af', '5fd7d7', '5fd7ff', '5fff00', '5fff5f', '5fff87', '5fffaf', '5fffd7', '5fffff', '870000', '87005f', '870087', '8700af', '8700d7', '8700ff', '875f00', '875f5f', '875f87', '875faf', '875fd7', '875fff', '878700', '87875f', '878787', '8787af', '8787d7', '8787ff', '87af00', '87af5f', '87af87', '87afaf', '87afd7', '87afff', '87d700', '87d75f', '87d787', '87d7af', '87d7d7', '87d7ff', '87ff00', '87ff5f', '87ff87', '87ffaf', '87ffd7', '87ffff', 'af0000', 'af005f', 'af0087', 'af00af', 'af00d7', 'af00ff', 'af5f00', 'af5f5f', 'af5f87', 'af5faf', 'af5fd7', 'af5fff', 'af8700', 'af875f', 'af8787', 'af87af', 'af87d7', 'af87ff', 'afaf00', 'afaf5f', 'afaf87', 'afafaf', 'afafd7', 'afafff', 'afd700', 'afd75f', 'afd787', 'afd7af', 'afd7d7', 'afd7ff', 'afff00', 'afff5f', 'afff87', 'afffaf', 'afffd7', 'afffff', 'd70000', 'd7005f', 'd70087', 'd700af', 'd700d7', 'd700ff', 'd75f00', 'd75f5f', 'd75f87', 'd75faf', 'd75fd7', 'd75fff', 'd78700', 'd7875f', 'd78787', 'd787af', 'd787d7', 'd787ff', 'd7af00', 'd7af5f', 'd7af87', 'd7afaf', 'd7afd7', 'd7afff', 'd7d700', 'd7d75f', 'd7d787', 'd7d7af', 'd7d7d7', 'd7d7ff', 'd7ff00', 'd7ff5f', 'd7ff87', 'd7ffaf', 'd7ffd7', 'd7ffff', 'ff0000', 'ff005f', 'ff0087', 'ff00af', 'ff00d7', 'ff00ff', 'ff5f00', 'ff5f5f', 'ff5f87', 'ff5faf', 'ff5fd7', 'ff5fff', 'ff8700', 'ff875f', 'ff8787', 'ff87af', 'ff87d7', 'ff87ff', 'ffaf00', 'ffaf5f', 'ffaf87', 'ffafaf', 'ffafd7', 'ffafff', 'ffd700', 'ffd75f', 'ffd787', 'ffd7af', 'ffd7d7', 'ffd7ff', 'ffff00', 'ffff5f', 'ffff87', 'ffffaf', 'ffffd7', 'ffffff', '080808', '121212', '1c1c1c', '262626', '303030', '3a3a3a', '444444', '4e4e4e', '585858', '626262', '6c6c6c', '767676', '808080', '8a8a8a', '949494', '9e9e9e', 'a8a8a8', 'b2b2b2', 'bcbcbc', 'c6c6c6', 'd0d0d0', 'dadada', 'e4e4e4', 'eeeeee']
    return '#' . l:col[a:num]
endfunction

" -----------------------------------------------------------------------------------------------------------
" toggle fold column
" -----------------------------------------------------------------------------------------------------------
function FoldColumnToggle()
    if &foldcolumn
        set foldcolumn=0
        echo "foldcolumn=0"
    else
        set foldcolumn=4
        echo "foldcolumn=4"
    endif
endfunction


" -----------------------------------------------------------------------------------------------------------
" toggle quick fix window
" -----------------------------------------------------------------------------------------------------------
let g:quickfix_is_open=0
function QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open=0
        echo "cclose"
    else
        copen
        let g:quickfix_is_open=1
        echo "copen"
    endif
endfunction

" -----------------------------------------------------------------------------------------------------------
" Nombre total de buffers ouverts.
" -----------------------------------------------------------------------------------------------------------
function TotBuf()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

" -----------------------------------------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------------------------------------
function MyStatusLine()
    if mode() ==? 'n'
        let my_mode = '%1* NORMAL %*  '
    elseif mode() ==? 'i'
        let my_mode = '%2* INSERT %*  '
    elseif mode() ==? 'v'
        let my_mode = '%3* VISUAL %*  '
    elseif mode() ==? 'R'
        let my_mode = '%4* REPLACE %*  '
    else
        let my_mode = '%3* VISUAL %*  '
    endif

    let l:sep1 = " \u276f  "
    let l:sep2 = " \u276e  "

    " mode
    let line = my_mode
    " buffer number / total buffers & modified flag
    let line = line . '%n/%{TotBuf()}'
    " branch name
    if g:branch_name !=? ''
        let line = line . l:sep1
        let line = line . ' %{g:branch_name}'
        "Ue0a0') # 
    endif
    " modified flag & path to file
    let line = line . l:sep1
    let line = line . '%M%<%f '

    " right side
    let line = line . '%='
    " file type
    let line = line . '%Y'
    " line number / total lines (percentage)
    let line = line . l:sep2
    let line = line . '%l/%L (%p%%)'
    " column number
    let line = line . l:sep2
    let line = line . '%-3v'

    return line
endfunction
" }}}



" ===========================================================================================================
" MISCELLANEOUS {{{
" ===========================================================================================================

" Uncomment the next line to make Vim more Vi-compatible
" NOTE : debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible
set nocompatible        " default vim-like environement (!= vi)

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
    syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
" if has("autocmd")
"   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
    filetype plugin indent on
endif

" Source a global configuration file if available
" if filereadable("/etc/vim/vimrc.local")
"     source /etc/vim/vimrc.local
" endif

execute pathogen#infect()

" nerdtree
augroup nerdtreeGroup
    autocmd!
    autocmd VimEnter * NERDTree | wincmd l
augroup END

" powerline
" set rtp+=$HOME/.local/lib/python3.6/site-packages/powerline/bindings/vim/
augroup vimGroup
    autocmd!
    " ne pas insérer automatique un commentaire après une ligne commentée
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufEnter * let g:branch_name = GetBranchName()
augroup END
" }}}



" ===========================================================================================================
" OS SPECIFIC COMMANDS {{{
" ===========================================================================================================

let white = 15
let black = 16
let yellow_green = 154
let blue = 38
let orange = 214
let red = 196
let grey = 237

" Unix or windows ? Config file location.
if has('unix')
    let g:OS = 'unix'
    let g:CONF = $HOME . '/.vim'
    set t_Co=256
    set background=dark
    colorscheme vcolor
elseif has('win32') || has('win64')
    let g:OS = 'windows'
    let g:CONF = $HOME . '/vimfiles'
    set guifont=Consolas:h11
    set background=dark
    colorscheme vcolor
    " highlight ColorColumn guibg=#000000
    " highlight CursorLine  guibg=#000000
    " highlight Visual      guibg=#3A3A3A
    " highlight User1       guibg=#AFFF00 guifg=#000000
    " highlight User2       guibg=#00AFD7 guifg=#FFFFFF
    " highlight User3       guibg=#FFAF00 guifg=#000000
    " highlight User4       guibg=#FF0000 guifg=#FFFFFF

    " Équivalent des couleurs en hexadécimal
    let white = GetHex(white)
    let black = GetHex(black)
    let yellow_green = GetHex(yellow_green)
    let blue = GetHex(blue)
    let orange = GetHex(orange)
    let red = GetHex(red)
    let grey = GetHex(grey)
endif

execute 'highlight ColorColumn ctermbg='.black
execute 'highlight CursorLine  ctermbg='.black
execute 'highlight Visual      ctermbg='.grey
execute 'highlight User1       ctermbg='.yellow_green 'ctermfg='.black
execute 'highlight User2       ctermbg='.blue         'ctermfg='.white
execute 'highlight User3       ctermbg='.orange       'ctermfg='.black
execute 'highlight User4       ctermbg='.red          'ctermfg='.white
" }}}



" ===========================================================================================================
" PARAMÈTRES DE BASE {{{
" ===========================================================================================================
" permet l'utilisation de 256 couleurs dans vim
" set t_Co=256

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark
" coloration syntaxique
" colorscheme molokai
" colorscheme vcolor
" colorscheme Mustang
" colorscheme gruvbox
" colorscheme apprentice
" colorscheme jellybeans

" highlight ColorColumn ctermbg=Black
" highlight ColorColumn ctermbg=0
" highlight CursorLine ctermbg=232
" highlight Visual ctermbg=237
" highlight User1 ctermbg=154 ctermfg=232
" highlight User2 ctermbg=38  ctermfg=231
" highlight User3 ctermbg=214 ctermfg=232
" highlight User4 ctermbg=196 ctermfg=231
" highlight ColorColumn ctermbg=232
" highlight WarningMsg cterm=bold ctermfg=red
" highlight MatchParen cterm=bold ctermbg=green ctermfg=blue

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd	            " Show (partial) command in status line.
set showmatch           " Show matching brackets.

set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make
set nohidden            " (no) Hide buffers when abandoned (permet de changer de buffer quand non sauvegardé)
set mouse=a             " Enable mouse usage (all modes)
set number              " line number
set norelativenumber    " relative number

set autoindent          " copy indent from current line
set smartindent         " smart autoindenting when starting line
set tabstop=4           " number of spaces that a <Tab> counts for
set shiftwidth=4
set expandtab           " replace tabs by a number of spaces
set smarttab

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set tabpagemax=26       " max tab number
set cursorline          " mise en valeur de la ligne du curseur
set colorcolumn=110     " délimiteur 110eme caractère
set foldmethod=marker   " permet de délimiter une zone à plier (comman za) avec {{{ }}}
set foldlevelstart=0    " édition avec les zones repliés au démarrage
set foldcolumn=0        " band à gauche de l'écran avec des repères de fold
set textwidth=0         " largeur max d'une ligne, 0 désactive l'option
set wrap                " paramètre graphique, wrap une ligne qui dépasse la taille de la fenêtre graphique
set nolinebreak         " quand 'no', une ligne peut être 'wrapée' éventuellement en plein milieu d'un mot
set nohlsearch          " (no) highlight last search pattern

" status line settings
set statusline=%!MyStatusLine()
set laststatus=2        " tjrs afficher la barre de statut (0 = jamais, 1 = seulement quand split, 2 = tjr)



" ?
set comments=sl:/*,mb:\ */

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" }}}



" ===========================================================================================================
"  KEY MAPPING {{{
" ===========================================================================================================
let mapleader = ","



" -----------------------------------------------------------------------------------------------------------
" Free keys and synonimes
" -----------------------------------------------------------------------------------------------------------
" F1 dans vim sert à éditer l'aide

" F2 pour enregistrer
nnoremap <F2> :w<CR>
inoremap <F2> <ESC>:w<CR>a

" compilation date en cyan
nnoremap <F4> :!echo -e "\033[1;36m`date`\033[00m"<CR>:make!<CR>

" exécution date en vert : penser à ajouter une règle make au makefile :
" make :
"   ./truc
nnoremap <F5> :!echo -e "\033[1;32m`date`\033[00m"; make make<CR>

" F6 pour indenter tout le fichier et revenir à l'endroit
nnoremap <F6> mzgg=G`zzz
inoremap <F6> <ESC>mzgg=G`zzza

" ajouter point virgule en fin de ligne ou ligne d'avant en insertion
nnoremap <F7> mzA;<ESC>`z
inoremap <F7> <ESC>kA;<ESC>j==A

" toggle relative number
nnoremap <F8> :set relativenumber!<CR>

" éxecuter le fichier courant par gnuplot
nnoremap <F9> :!gnuplot -p %<CR>

" inverser maj / min d'un mot
inoremap <C-_> <ESC>mzbviw~`za
nnoremap <C-_> mzviw~`z

" insérer ligne vide
nnoremap <C-N> o<Esc>

" Changer de buffer.
nnoremap <CR> :bnext<CR>
nnoremap <BS> :bprevious<CR>

" modifier la hauteur de la fenêtre
nnoremap + :resize +1<CR>
nnoremap - :resize -1<CR>



" -----------------------------------------------------------------------------------------------------------
" Leader normal, ordre alphabétique
" -----------------------------------------------------------------------------------------------------------
" Choisir un buffer.
nnoremap <Leader>b :ls<CR>:buffer<Space>

" Delete buffer
nnoremap <Leader>d :bnext<CR>:bdelete #<CR>

" editer ~/.vimrc
nnoremap <Leader>e :tabedit ~/.vim/ftplugin/<C-R>=my_filetype<CR>.vim<CR> :split $MYVIMRC<CR>

" toggle foldcolumn
nnoremap <Leader>f :call FoldColumnToggle()<CR>

" descendre d'une ligne
nnoremap <Leader>j ddp==

" monter d'une ligne
nnoremap <Leader>k ddkP==

" toggle quick fix window
nnoremap <Leader>q :call QuickfixToggle()<CR>

" toggle hlsearch
nnoremap <Leader>s :set hlsearch!<CR>:set hlsearch?<CR>

" toggle NerdTree
nnoremap <Leader>t :NERDTreeToggle<CR>

" chercher le mot sous le curseur
nnoremap <Leader>w mzviw<Esc>_/<C-R>=@*<CR><CR>`z:set hlsearch<CR>



" -----------------------------------------------------------------------------------------------------------
" Leader, caractères spéciaux
" -----------------------------------------------------------------------------------------------------------
" sélectionner un mot
nnoremap <Leader><space> viw

" entourer" de " ' ( [ { _ *
nnoremap <Leader>" mzviw<Esc>a"<Esc>bi"<Esc>`zl
nnoremap <Leader>' mzviw<Esc>a'<Esc>bi'<Esc>`zl
nnoremap <Leader>( mzviw<Esc>a)<Esc>bi(<Esc>`zl
nnoremap <Leader>[ mzviw<Esc>a]<Esc>bi[<Esc>`zl
nnoremap <Leader>{ mzviw<Esc>a}<Esc>bi{<Esc>`zl
nnoremap <Leader>_ mzviw<Esc>a_<Esc>bi_<Esc>`zl
nnoremap <Leader>* mzviw<Esc>a*<Esc>bi*<Esc>`zl

vnoremap <Leader>" <Esc>`<i"<Esc>`>la"<Esc>
vnoremap <Leader>' <Esc>`<i'<Esc>`>la'<Esc>
vnoremap <Leader>( <Esc>`<i(<Esc>`>la)<Esc>
vnoremap <Leader>[ <Esc>`<i[<Esc>`>la]<Esc>
vnoremap <Leader>{ <Esc>`<i{<Esc>`>la}<Esc>
vnoremap <Leader>_ <Esc>`<i_<Esc>`>la_<Esc>
vnoremap <Leader>* <Esc>`<i*<Esc>`>la*<Esc>

" Buffer alternatif.
nnoremap <Leader># :buffer #<CR>



" -----------------------------------------------------------------------------------------------------------
" opérateurs
" -----------------------------------------------------------------------------------------------------------
" inside next (
onoremap in( :<C-U>normal! f(vi(<CR>
" inside previous (
onoremap ip( :<C-U>normal! F)vi(<CR>
" }}}
