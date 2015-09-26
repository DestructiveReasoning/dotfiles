set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "wiltz"

"General
hi Normal		cterm=NONE	ctermbg=233	ctermfg=251
hi CursorLine		cterm=NONE	ctermbg=235	ctermfg=NONE
hi LineNr		cterm=NONE	ctermbg=236	ctermfg=246
hi CursorLineNr		cterm=NONE	ctermbg=236	ctermfg=220
hi NonText		cterm=NONE	ctermbg=NONE	ctermfg=235
hi SpecialKey		cterm=NONE	ctermbg=NONE	ctermfg=235
hi CursorNonText	cterm=NONE	ctermbg=NONE	ctermfg=248
hi CursorSpecialKey	cterm=NONE	ctermbg=NONE	ctermfg=248 
hi Cursor		cterm=NONE	ctermbg=250	ctermfg=231
hi Pmenu		cterm=NONE	ctermbg=238	ctermfg=253
hi PmenuSel		cterm=NONE	ctermbg=234	ctermfg=83

"C & C++
hi cType		cterm=NONE	ctermbg=NONE	ctermfg=32
hi cStructure		cterm=NONE	ctermbg=NONE	ctermfg=136
hi cppType		cterm=NONE	ctermbg=NONE	ctermfg=107
hi cStorageClass	cterm=NONE	ctermbg=NONE	ctermfg=68
hi cppBoolean		cterm=NONE	ctermbg=NONE	ctermfg=33
hi cNumber		cterm=NONE	ctermbg=NONE	ctermfg=23
hi cComment		cterm=NONE	ctermbg=NONE	ctermfg=59
hi cInclude		cterm=NONE	ctermbg=NONE	ctermfg=34
hi cIncluded		cterm=NONE	ctermbg=NONE	ctermfg=184
hi cPreCondit		cterm=NONE	ctermbg=NONE	ctermfg=184
hi cPreConditMatch	cterm=NONE	ctermbg=NONE	ctermfg=184
hi cDefine		cterm=NONE	ctermbg=NONE	ctermfg=84
hi cBlock		cterm=NONE	ctermbg=235	ctermfg=NONE
hi cConditional		cterm=NONE	ctermbg=NONE	ctermfg=60
hi cParen		cterm=NONE	ctermbg=NONE	ctermfg=254
hi cConstant		cterm=NONE	ctermbg=NONE	ctermfg=33
hi cFloat		cterm=NONE	ctermbg=NONE	ctermfg=23
hi cString		cterm=NONE	ctermbg=NONE	ctermfg=30
hi cppStatement		cterm=BOLD	ctermbg=NONE	ctermfg=214
hi cppRepeat		cterm=NONE	ctermbg=NONE	ctermfg=148
hi cLabel		cterm=NONE	ctermbg=NONE	ctermfg=39
hi cStatement		cterm=BOLD	ctermbg=NONE	ctermfg=214

"JAVA
hi javaType		cterm=NONE	ctermbg=NONE	ctermfg=32
hi javaStorageClass	cterm=NONE	ctermbg=NONE	ctermfg=68
hi javaBoolean		cterm=NONE	ctermbg=NONE	ctermfg=33
hi javaNumber		cterm=NONE	ctermbg=NONE	ctermfg=23
hi javaLineComment	cterm=NONE	ctermbg=NONE	ctermfg=59
hi javaDocComment	cterm=NONE	ctermbg=NONE	ctermfg=240
hi javaCommentTitle	cterm=NONE	ctermbg=NONE	ctermfg=240
hi javacommentStar	cterm=NONE	ctermbg=NONE	ctermfg=94
hi javaExternal		cterm=NONE	ctermbg=NONE	ctermfg=34
hi javaConditional	cterm=NONE	ctermbg=NONE	ctermfg=60
hi javaString		cterm=NONE	ctermbg=NONE	ctermfg=30
hi javaStatement	cterm=BOLD	ctermbg=NONE	ctermfg=214
hi javaScopeDecl	cterm=BOLD	ctermbg=NONE	ctermfg=24
hi javaClassDecl	cterm=BOLD	ctermbg=NONE	ctermfg=106
hi javaOperator		cterm=NONE	ctermbg=NONE	ctermfg=68

"HASKELL
hi hsVarSym		cterm=NONE	ctermbg=NONE	ctermfg=242
hi hsConditional	cterm=NONE	ctermbg=NONE	ctermfg=60
hi hsNumber		cterm=NONE	ctermbg=NONE	ctermfg=23
hi hsTypedef		cterm=NONE	ctermbg=NONE	ctermfg=68
hi hsStructure		cterm=NONE	ctermbg=NONE	ctermfg=68
hi hsString		cterm=NONE	ctermbg=NONE	ctermfg=30
hi hsLineComment	cterm=NONE	ctermbg=NONE	ctermfg=59
hi hsImport 		cterm=NONE	ctermbg=NONE	ctermfg=34
hi hsStatement		cterm=NONE	ctermbg=NONE	ctermfg=61
hi ConId		cterm=BOLD	ctermbg=NONE	ctermfg=31

"PYTHON
hi pythonComment	cterm=NONE	ctermbg=NONE	ctermfg=239
hi pythonInclude	cterm=NONE	ctermbg=NONE	ctermfg=184
hi pythonFunction	cterm=NONE	ctermbg=NONE	ctermfg=221
hi pythonString		cterm=NONE	ctermbg=NONE	ctermfg=131
hi pythonBuiltin	cterm=BOLD	ctermbg=NONE	ctermfg=73
hi pythonNumber		cterm=NONE	ctermbg=NONE	ctermfg=203
hi pythonConditional	cterm=NONE	ctermbg=NONE	ctermfg=75

"VIM
hi vimHighlight		cterm=NONE	ctermbg=NONE	ctermfg=68
hi vimHiGroup		cterm=NONE	ctermbg=NONE	ctermfg=192
hi vimHiNmbr		cterm=NONE	ctermbg=NONE	ctermfg=203
hi vimFgBgAttrib	cterm=NONE	ctermbg=NONE	ctermfg=39
hi vimHiAttrib		cterm=NONE	ctermbg=NONE	ctermfg=39
hi vimVar		cterm=NONE	ctermbg=NONE	ctermfg=33
hi vimLet		cterm=BOLD	ctermbg=NONE	ctermfg=226
hi vimFuncName		cterm=NONE	ctermbg=NONE	ctermfg=107
hi vimString		cterm=NONE	ctermbg=NONE	ctermfg=221
hi vimCommand		cterm=BOLD	ctermbg=NONE	ctermfg=226
hi vimOption		cterm=NONE	ctermbg=NONE	ctermfg=239
hi vimSetEqual		cterm=ITALIC	ctermbg=NONE	ctermfg=221
hi vimLineComment	cterm=ITALIC	ctermbg=NONE	ctermfg=59
hi vimCursorLineComment		cterm=ITALIC	ctermfg=239	ctermbg=83

"CONFIG FILES
hi confString	cterm=NONE	ctermbg=NONE	ctermfg=39
hi confComment	cterm=NONE	ctermbg=NONE	ctermfg=238

"URXVT CONFIG
hi xdefaultsLabel	cterm=NONE	ctermbg=NONE	ctermfg=131
hi xdefaultsValue	cterm=NONE	ctermbg=NONE	ctermfg=39

"ZSH CONFIG
hi zshCommands		cterm=BOLD	ctermbg=NONE	ctermfg=184
hi zshString		cterm=NONE	ctermbg=NONE	ctermfg=39
hi zshDeref		cterm=ITALIC	ctermbg=NONE	ctermfg=203
hi zshComment		cterm=NONE	ctermbg=NONE	ctermfg=239

"SH CONFIG AND PKGBUILDS
hi shVariable		cterm=BOLD	ctermbg=NONE	ctermfg=148
hi shNumber		cterm=NONE	ctermbg=NONE	ctermfg=203
hi shQuote		cterm=NONE	ctermbg=NONE	ctermfg=39
hi shDoubleQuote	cterm=NONE	ctermbg=NONE	ctermfg=39
hi shSingleQuote	cterm=NONE	ctermbg=NONE	ctermfg=39
hi shDerefSimple	cterm=ITALIC	ctermbg=NONE	ctermfg=77
hi shFunction		cterm=NONE	ctermbg=NONE	ctermfg=131
hi shOption		cterm=NONE	ctermbg=NONE	ctermfg=33

"NERDTree
hi NERDTreeFile			cterm=none	ctermbg=NONE 	ctermfg=222
hi NERDTreeBookmark		cterm=BOLD	ctermbg=NONE	ctermfg=60
hi NERDTreeExecFile		cterm=none	ctermbg=NONE	ctermfg=130
hi NERDTreeOpenable		cterm=none	ctermbg=NONE	ctermfg=220
hi NERDTreeClosable		cterm=none	ctermbg=NONE	ctermfg=220
hi NERDTreeDir			cterm=BOLD	ctermbg=NONE	ctermfg=60
hi NERDTreeBookmarkName		cterm=none	ctermbg=NONE	ctermfg=220
hi NERDTreeBookmarksLeader	cterm=none	ctermbg=NONE	ctermfg=220
hi NERDTreeCWD			cterm=NONE	ctermbg=23	ctermfg=255
hi NERDTreeUp			cterm=NONE	ctermbg=NONE	ctermfg=196

"VIM STATUSLINE
hi statusInsert		cterm=NONE	ctermbg=60	ctermfg=252
hi statusNormal		cterm=NONE	ctermbg=23	ctermfg=252
hi statusInsertFile	cterm=NONE	ctermbg=67	ctermfg=252
hi statusNormalFile	cterm=NONE	ctermbg=245	ctermfg=237
hi statusLocation	cterm=BOLD	ctermbg=100	ctermfg=232
hi statusReadOnly	cterm=BOLD	ctermbg=196	ctermfg=172
