" Vim syntax file
" Language: Markdown
" Maintainer: V. M.
" Filenames: *.md

if exists("b:current_syntax")
  finish
endif

" ignorer la casse
syntax case ignore

" parse from the begining of the file, for good colors when scrolling backwards
syntax sync fromstart



" -----------------------------------------------------------------------------------------------------------
" Commentaires
" -----------------------------------------------------------------------------------------------------------
syntax region mdComment start=#\v\<# end=#\v\>#
highlight link mdComment Comment



" -----------------------------------------------------------------------------------------------------------
" Code
" -----------------------------------------------------------------------------------------------------------
" inline code
syntax region mdString start=#\v\`# end=#\v\`#
syntax region mdString start=#\v\$# skip=#\v\\\$# end=#\v\$#
" code block
syntax region mdString start=#\v^\`\`\`# end=#\v^\`\`\`#
highlight link mdString String



" -----------------------------------------------------------------------------------------------------------
" Titres
" -----------------------------------------------------------------------------------------------------------
syntax match mdIdentifier #\v^\s*\#+.*$#
highlight link mdIdentifier Identifier



" -----------------------------------------------------------------------------------------------------------
" Liens et images
" -----------------------------------------------------------------------------------------------------------
syntax match mdStatement #\v^\s*!\[\S*\]\(\S*\)#
syntax match mdStatement #\v\[.*\]\([a-zA-Z0-9_#:.@*/+-]*\)#
highlight link mdStatement Statement



" -----------------------------------------------------------------------------------------------------------
" Bold, italic, cross
" -----------------------------------------------------------------------------------------------------------
" Pour permettre d'échapper _ et *, on ne link pas mdNull.
syntax match mdNull #\v\\_#
syntax match mdNull #\v\\\*#

syntax region mdConstant start=#\v_{1,2}# skip=#\v\\(_|\*)# end=#\v_{1,2}#
syntax region mdConstant start=#\v\*{1,2}# skip=#\v\\(_|\*)# end=#\v\*{1,2}#
syntax region mdConstant start=#\v\~\~# end=#\v\~\~#
highlight link mdConstant Constant



" -----------------------------------------------------------------------------------------------------------
" Listes à puces, task lists, grand titre pour pandoc avec % ...
" -----------------------------------------------------------------------------------------------------------
syntax match mdSpecial #\v^\s*\* #
syntax match mdSpecial #\v^\s*[0-9]+\. #
syntax match mdSpecial #\v^\s*\%.*$#
syntax match mdSpecial #\v^\s*- \[( |x)\] #
highlight link mdSpecial Special



" -----------------------------------------------------------------------------------------------------------
" Tableaux
" -----------------------------------------------------------------------------------------------------------
syntax match mdException #\v\|#
syntax match mdException #\v-{3,}#
highlight link mdException Exception



let b:current_syntax = "markdown"
