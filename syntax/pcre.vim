" Firsts lines. Avoid loading twice.
if exists("b:current_syntax")
    finish
endif

syntax match pcreKeyword "\v(\^|\$)"
syntax match pcreKeyword "\v\\[^dDwWtnrsS]"
highlight link pcreKeyword Keyword

syntax match pcreIdentifier "\v(\(|\)|\[|\]|\||\-)"
highlight link pcreIdentifier Identifier

syntax match pcreSpecial "\v(\\d|\\D|\\w|\\W|\\t|\\n|\\r|\\s|\\S|\.)"
highlight link pcreSpecial Special

syntax match pcreFunction "\v(\*|\+|\?|\{[0-9,]*\})"
highlight link pcreFunction Function

" Last line. Avoid loading twice.
let b:current_syntax = "pcre"
