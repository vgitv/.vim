let comment = "#"
let lencomm = strlen(comment)

" local leader
let maplocalleader = "$"

" source le fichier commun
source ~/.vim/ftplugin/all.vim

inoremap <Tab> <Esc>/#++#<CR>"_c4l

inoremap <LocalLeader>i if<Space><Space>:<CR><Space><BS>#++#<CR><BS>#if<Esc>2ka
inoremap <LocalLeader>d def<Space>(#++#)<Space>:<CR><Space><BS>#++#<CR><BS>#def<Esc>2ka
