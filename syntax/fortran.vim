" Firsts lines. Avoid loading twice.
if exists("b:current_syntax")
    finish
endif

" Fortran is case insensitive
syntax case ignore



" -----------------------------------------------------------------------------------------------------------
" COMMENT
" -----------------------------------------------------------------------------------------------------------
syntax region fortranComment start=/\v!/ end=/\v$/ contains=fortranTodo
highlight link fortranComment Comment



" -----------------------------------------------------------------------------------------------------------
" CONSTANT
" -----------------------------------------------------------------------------------------------------------
syntax match fortranNumber "\v<[0-9]+>"
highlight link fortranNumber Number

syntax region fortranString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region fortranString start=/\v'/ skip=/\v\\./ end=/\v'/
highlight link fortranString String

syntax match fortranBoolean "\v\.true\."
syntax match fortranBoolean "\v\.false\."
highlight link fortranBoolean Boolean

syntax match fortranFloat "\v<[0-9]*\.[0-9]*[eEdD]?[0-9]*_?[a-zA-Z]*>"
highlight link fortranFloat Float



" -----------------------------------------------------------------------------------------------------------
" IDENTIFIER
" -----------------------------------------------------------------------------------------------------------
highlight link fortranIdentifier Identifier

syntax keyword fortranFunction	abs acos aimag aint anint asin atan atan2 char cmplx conjg cos cosh exp ichar index int log log10 max min nint sign sin sinh sqrt tan tanh alog alog10 amax0 amax1 amin0 amin1 amod cabs ccos cexp clog csin csqrt dabs dacos dasin datan datan2 dcos dcosh ddim dexp dint dlog dlog10 dmax1 dmin1 dmod dnint dsign dsin dsinh dsqrt dtan dtanh float iabs idim idint idnint ifix isign max0 max1 min0 min1 sngl adjustl adjustr all allocated any associated bit_size btest ceiling count cshift date_and_time digits dot_product eoshift epsilon exponent floor fraction huge iand ibclr ibits ibset ieor ior ishft ishftc lbound len_trim matmul maxexponent maxloc maxval merge minexponent minloc minval modulo mvbits nearest pack precision present product radix random_number random_seed range repeat reshape rrspacing scale scan selected_int_kind selected_real_kind set_exponent shape size spacing spread sum system_clock tiny transpose trim ubound unpack verify command_argument_count get_command get_command_argument get_environment_variable is_iostat_end is_iostat_eor move_alloc new_line selected_char_kind same_type_as extends_type_of iso_c_binding c_loc c_funloc c_associated  c_f_pointer c_f_procpointer ieee_arithmetic ieee_support_underflow_control ieee_get_underflow_mode ieee_set_underflow_mode acosh asinh atanh bessel_j0 bessel_j1 bessel_jn bessel_y0 bessel_y1 bessel_yn erf erfc erfc_scaled gamma log_gamma hypot norm2 atomic_define atomic_ref execute_command_line leadz trailz storage_size merge_bits bge bgt ble blt dshiftl dshiftr findloc iall iany iparity image_index lcobound ucobound maskl maskr num_images parity popcnt poppar shifta shiftl shiftr this_image null cpu_time trim
highlight link fortranFunction Function



" -----------------------------------------------------------------------------------------------------------
" STATEMENT
" -----------------------------------------------------------------------------------------------------------
syntax keyword fortranStatement print write read
highlight link fortranStatement Statement

syntax keyword fortranConditional if then else elseif endif where elsewhere
syntax match fortranConditional "\v^\s*end\s*if"
syntax match fortranConditional "\v^\s*select\s*case"
syntax match fortranConditional "\v^\s*end\s*select"
syntax match fortranConditional "\v^\s*end\s*where"
highlight link fortranConditional Conditional

syntax keyword fortranRepeat do while enddo
syntax match fortranRepeat "\v^\s*end\s*do"
highlight link fortranRepeat Repeat

syntax keyword fortranLabel case default
highlight link fortranLabel Label

syntax match fortranOperator "\v(\+|\-|\*|/|\=|\<|\>|\.and\.|\.or\.|\.not\.)"
syntax match fortranOperator #\v\(\/#
syntax match fortranOperator #\v\/\)#
highlight link fortranOperator Operator

syntax keyword fortranKeyword open close allocate deallocate nullify cycle exit position access blank direct exist file fmt form formatted iostat name named nextrec number opened rec recl sequential status unformatted unit nml namelist return
highlight link fortranKeyword Keyword

syntax keyword fortranException function subroutine interface use only call result program module contains
syntax match fortranException "\v^\s*end\s*(program|module)"
syntax match fortranException "\v^\s*end\s*(function|subroutine|interface)"
highlight link fortranException Exception



" -----------------------------------------------------------------------------------------------------------
" PREPROC
" -----------------------------------------------------------------------------------------------------------
syntax match fortranInclude "\v^\s*#\s*include.*"
highlight link fortranInclude Include

syntax match fortranDefine "\v^\s*#\s*defined?.*"
highlight link fortranDefine Define

syntax match fortranPreCondit "\v^\s*#\s*(if|elif|else|endif|ifdef|ifndef).*$"
highlight link fortranPreCondit PreCondit



" -----------------------------------------------------------------------------------------------------------
" TYPE
" -----------------------------------------------------------------------------------------------------------
syntax keyword fortranType logical integer real character implicit none abstract pure impure elemental procedure asynchronous nopass non_overridable pass protected volatile extends import non_intrinsic value bind deferred generic final enumerator
syntax match fortranType "\vdouble\s*precision"
highlight link fortranType Type

syntax keyword fortranStorageClass save parameter len in out inout
highlight link fortranStorageClass StorageClass

syntax keyword fortranStructure type intent private public dimension allocatable pointer target class enum
syntax match fortranStructure "\vend\s*enum"
syntax match fortranStructure "\vend\s*type"
highlight link fortranStructure Structure



" -----------------------------------------------------------------------------------------------------------
" SPECIAL
" -----------------------------------------------------------------------------------------------------------
syntax match fortranSpecial "\v\&"
highlight link fortranSpecial Special

highlight link fortranDelimiter Delimiter



" -----------------------------------------------------------------------------------------------------------
" TYPE
" -----------------------------------------------------------------------------------------------------------
syntax keyword fortranTodo todo fixme warning
syntax match fortranTodo "\vxxx+"
highlight link fortranTodo Todo



" Last line. Avoid loading twice.
let b:current_syntax = "fortran"



" ===========================================================================================================
" folding

" syn region myFold start="\v^\s*function" end="\v^\s*end\s*function" transparent fold
" syn region myFold start="\v^\s*subroutine" end="\v^\s*end\s*subroutine" transparent fold
" syn sync fromstart
" setlocal foldmethod=syntax
