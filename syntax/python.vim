let b:current_syntax = 1

" modif perso
syntax match pythonFunction "\w\+\s*(\@="
highlight def link pythonFunction Function

syntax match pythonOperator "\v(\+|-|\*|/|\=|\%|\<|\>)"
highlight def link pythonOperator Operator

syntax keyword pythonConstant False, None, True
highlight def link pythonConstant Constant

syntax keyword pythonStructure class
highlight def link pythonStructure Structure

" Fichier config global
syn keyword pythonStatement	as assert break continue del exec global
syn keyword pythonStatement	lambda nonlocal pass print return with yield
syn keyword pythonStatement	class def nextgroup=pythonFunction skipwhite
syn keyword pythonConditional	elif else if
syn keyword pythonRepeat	for while
syn keyword pythonOperator	and in is not or
syn keyword pythonException	except finally raise try
syn keyword pythonInclude	from import
syn keyword pythonAsync		async await

" Decorators (new in Python 2.4)
syn match   pythonDecorator	"@" display nextgroup=pythonFunction skipwhite
" The zero-length non-grouping match before the function name is
" extremely important in pythonFunction.  Without it, everything is
" interpreted as a function inside the contained environment of
" doctests.
" A dot must be allowed because of @MyClass.myfunc decorators.
syn match   pythonFunction
      \ "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained

syn match   pythonComment	"#.*$" contains=pythonTodo,@Spell
syn keyword pythonTodo		FIXME NOTE NOTES TODO XXX contained

" Triple-quoted strings can contain doctests.
syn region  pythonString matchgroup=pythonQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=pythonEscape,@Spell
syn region  pythonString matchgroup=pythonTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend
      \ contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell
syn region  pythonRawString matchgroup=pythonQuotes
      \ start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=@Spell
syn region  pythonRawString matchgroup=pythonTripleQuotes
      \ start=+[uU]\=[rR]\z('''\|"""\)+ end="\z1" keepend
      \ contains=pythonSpaceError,pythonDoctest,@Spell

syn match   pythonEscape	+\\[abfnrtv'"\\]+ contained
syn match   pythonEscape	"\\\o\{1,3}" contained
syn match   pythonEscape	"\\x\x\{2}" contained
syn match   pythonEscape	"\%(\\u\x\{4}\|\\U\x\{8}\)" contained
" Python allows case-insensitive Unicode IDs: http://www.unicode.org/charts/
syn match   pythonEscape	"\\N{\a\+\%(\s\a\+\)*}" contained
syn match   pythonEscape	"\\$"

if exists("python_highlight_all")
  if exists("python_no_builtin_highlight")
    unlet python_no_builtin_highlight
  endif
  if exists("python_no_doctest_code_highlight")
    unlet python_no_doctest_code_highlight
  endif
  if exists("python_no_doctest_highlight")
    unlet python_no_doctest_highlight
  endif
  if exists("python_no_exception_highlight")
    unlet python_no_exception_highlight
  endif
  if exists("python_no_number_highlight")
    unlet python_no_number_highlight
  endif
  let python_space_error_highlight = 1
endif

" It is very important to understand all details before changing the
" regular expressions below or their order.
" The word boundaries are *not* the floating-point number boundaries
" because of a possible leading or trailing decimal point.
" The expressions below ensure that all valid number literals are
" highlighted, and invalid number literals are not.  For example,
"
" - a decimal point in '4.' at the end of a line is highlighted,
" - a second dot in 1.0.0 is not highlighted,
" - 08 is not highlighted,
" - 08e0 or 08j are highlighted,
"
" and so on, as specified in the 'Python Language Reference'.
" https://docs.python.org/2/reference/lexical_analysis.html#numeric-literals
" https://docs.python.org/3/reference/lexical_analysis.html#numeric-literals
if !exists("python_no_number_highlight")
  " numbers (including longs and complex)
  syn match   pythonNumber	"\<0[oO]\=\o\+[Ll]\=\>"
  syn match   pythonNumber	"\<0[xX]\x\+[Ll]\=\>"
  syn match   pythonNumber	"\<0[bB][01]\+[Ll]\=\>"
  syn match   pythonNumber	"\<\%([1-9]\d*\|0\)[Ll]\=\>"
  syn match   pythonNumber	"\<\d\+[jJ]\>"
  syn match   pythonNumber	"\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
  syn match   pythonNumber
	\ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
  syn match   pythonNumber
	\ "\%(^\|\W\)\zs\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"
endif

" Group the built-ins in the order in the 'Python Library Reference' for
" easier comparison.
" https://docs.python.org/2/library/constants.html
" https://docs.python.org/3/library/constants.html
" http://docs.python.org/2/library/functions.html
" http://docs.python.org/3/library/functions.html
" http://docs.python.org/2/library/functions.html#non-essential-built-in-functions
" http://docs.python.org/3/library/functions.html#non-essential-built-in-functions
" Python built-in functions are in alphabetical order.
if !exists("python_no_builtin_highlight")
  " built-in constants
  syn keyword pythonBuiltin	NotImplemented Ellipsis __debug__
  " built-in functions
  syn keyword pythonBuiltin	abs all any bin bool bytearray callable chr
  syn keyword pythonBuiltin	classmethod compile complex delattr dict dir
  syn keyword pythonBuiltin	divmod enumerate eval filter float format
  syn keyword pythonBuiltin	frozenset getattr globals hasattr hash
  syn keyword pythonBuiltin	help hex id input int isinstance
  syn keyword pythonBuiltin	issubclass iter len list locals map max
  syn keyword pythonBuiltin	memoryview min next object oct open ord pow
  syn keyword pythonBuiltin	print property range repr reversed round set
  syn keyword pythonBuiltin	setattr slice sorted staticmethod str
  syn keyword pythonBuiltin	sum super tuple type vars zip __import__
  " Python 2 only
  syn keyword pythonBuiltin	basestring cmp execfile file
  syn keyword pythonBuiltin	long raw_input reduce reload unichr
  syn keyword pythonBuiltin	unicode xrange
  " Python 3 only
  syn keyword pythonBuiltin	ascii bytes exec
  " non-essential built-in functions; Python 2 only
  syn keyword pythonBuiltin	apply buffer coerce intern
  " avoid highlighting attributes as builtins
  syn match   pythonAttribute	/\.\h\w*/hs=s+1 contains=ALLBUT,pythonBuiltin transparent
endif

" From the 'Python Library Reference' class hierarchy at the bottom.
" http://docs.python.org/2/library/exceptions.html
" http://docs.python.org/3/library/exceptions.html
if !exists("python_no_exception_highlight")
  " builtin base exceptions (used mostly as base classes for other exceptions)
  syn keyword pythonExceptions	BaseException Exception
  syn keyword pythonExceptions	ArithmeticError BufferError
  syn keyword pythonExceptions	LookupError
  " builtin base exceptions removed in Python 3
  syn keyword pythonExceptions	EnvironmentError StandardError
  " builtin exceptions (actually raised)
  syn keyword pythonExceptions	AssertionError AttributeError
  syn keyword pythonExceptions	EOFError FloatingPointError GeneratorExit
  syn keyword pythonExceptions	ImportError IndentationError
  syn keyword pythonExceptions	IndexError KeyError KeyboardInterrupt
  syn keyword pythonExceptions	MemoryError NameError NotImplementedError
  syn keyword pythonExceptions	OSError OverflowError ReferenceError
  syn keyword pythonExceptions	RuntimeError StopIteration SyntaxError
  syn keyword pythonExceptions	SystemError SystemExit TabError TypeError
  syn keyword pythonExceptions	UnboundLocalError UnicodeError
  syn keyword pythonExceptions	UnicodeDecodeError UnicodeEncodeError
  syn keyword pythonExceptions	UnicodeTranslateError ValueError
  syn keyword pythonExceptions	ZeroDivisionError
  " builtin OS exceptions in Python 3
  syn keyword pythonExceptions	BlockingIOError BrokenPipeError
  syn keyword pythonExceptions	ChildProcessError ConnectionAbortedError
  syn keyword pythonExceptions	ConnectionError ConnectionRefusedError
  syn keyword pythonExceptions	ConnectionResetError FileExistsError
  syn keyword pythonExceptions	FileNotFoundError InterruptedError
  syn keyword pythonExceptions	IsADirectoryError NotADirectoryError
  syn keyword pythonExceptions	PermissionError ProcessLookupError
  syn keyword pythonExceptions	RecursionError StopAsyncIteration
  syn keyword pythonExceptions	TimeoutError
  " builtin exceptions deprecated/removed in Python 3
  syn keyword pythonExceptions	IOError VMSError WindowsError
  " builtin warnings
  syn keyword pythonExceptions	BytesWarning DeprecationWarning FutureWarning
  syn keyword pythonExceptions	ImportWarning PendingDeprecationWarning
  syn keyword pythonExceptions	RuntimeWarning SyntaxWarning UnicodeWarning
  syn keyword pythonExceptions	UserWarning Warning
  " builtin warnings in Python 3
  syn keyword pythonExceptions	ResourceWarning
endif

if exists("python_space_error_highlight")
  " trailing whitespace
  syn match   pythonSpaceError	display excludenl "\s\+$"
  " mixed tabs and spaces
  syn match   pythonSpaceError	display " \+\t"
  syn match   pythonSpaceError	display "\t\+ "
endif

" Do not spell doctests inside strings.
" Notice that the end of a string, either ''', or """, will end the contained
" doctest too.  Thus, we do *not* need to have it as an end pattern.
if !exists("python_no_doctest_highlight")
  if !exists("python_no_doctest_code_highlight")
    syn region pythonDoctest
	  \ start="^\s*>>>\s" end="^\s*$"
	  \ contained contains=ALLBUT,pythonDoctest,@Spell
    syn region pythonDoctestValue
	  \ start=+^\s*\%(>>>\s\|\.\.\.\s\|"""\|'''\)\@!\S\++ end="$"
	  \ contained
  else
    syn region pythonDoctest
	  \ start="^\s*>>>" end="^\s*$"
	  \ contained contains=@NoSpell
  endif
endif

" Sync at the beginning of class, function, or method definition.
syn sync match pythonSync grouphere NONE "^\s*\%(def\|class\)\s\+\h\w*\s*("

if version >= 508 || !exists("did_python_syn_inits")
  if version <= 508
    let did_python_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default highlight links.  Can be overridden later.
  HiLink pythonStatement	Statement
  HiLink pythonConditional	Conditional
  HiLink pythonRepeat		Repeat
  HiLink pythonOperator		Operator
  HiLink pythonException	Exception
  HiLink pythonInclude		Include
  HiLink pythonAsync		Statement
  HiLink pythonDecorator	Define
  HiLink pythonFunction		Function
  HiLink pythonComment		Comment
  HiLink pythonTodo		Todo
  HiLink pythonString		String
  HiLink pythonRawString	String
  HiLink pythonQuotes		String
  HiLink pythonTripleQuotes	pythonQuotes
  HiLink pythonEscape		Special
  if !exists("python_no_number_highlight")
    HiLink pythonNumber		Number
  endif
  if !exists("python_no_builtin_highlight")
    HiLink pythonBuiltin	Function
  endif
  if !exists("python_no_exception_highlight")
    HiLink pythonExceptions	Structure
  endif
  if exists("python_space_error_highlight")
    HiLink pythonSpaceError	Error
  endif
  if !exists("python_no_doctest_highlight")
    HiLink pythonDoctest	Special
    HiLink pythonDoctestValue	Define
  endif

  delcommand HiLink
endif

