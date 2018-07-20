if exists("b:current_syntax")
    finish
endif



" -----------------------------------------------------------------------------------------------------------
" ------------------------------------------------------------------------------------------------------------
syntax keyword potionKeyword to times loop while if elsif else class return

syntax keyword potionFunction print join string

syntax match potionComment "\v\s*#.*$"

syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="
syntax match potionOperator "\v\="

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/



" -----------------------------------------------------------------------------------------------------------
" ------------------------------------------------------------------------------------------------------------
highlight link potionKeyword Keyword
highlight link potionFunction Function
highlight link potionComment Comment
highlight link potionOperator Operator
highlight link potionString String



" -----------------------------------------------------------------------------------------------------------
" ------------------------------------------------------------------------------------------------------------
let b:current_syntax = "potion"
