setlocal foldmethod=syntax
syntax sync fromstart

syntax region myFold start="\v^\s*function" end="\v^\s*end\s*function" transparent fold
syntax region myFold start="\v^\s*subroutine" end="\v^\s*end\s*subroutine" transparent fold
