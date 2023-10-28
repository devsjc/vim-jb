" ====================================================================================
" Vim Color File
" URL:        https://github.com/devsjc/vim-jb
" Filename:   colors/jb.vim
" Author:     devsjc
" License:    The MIT License (MIT)
" Based On:   https://github.com/drewtempelmeyer/palenight.vim
" ====================================================================================

" === Initializaion ==================================================================

highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256

let g:colors_name="jb"
let g:jb_termcolors = 256

let s:config = {
      \ "style": "dark",
      \ "enable_italic": 1,
      \ "overrides": {},
      \ }
let s:colors = jb#GetColors(s:config.style, s:config.overrides)

" This function is based on one from FlatColor: https://github.com/MaxSt/FlatColor/
" Which in turn was based on one found in hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  if s:config.enable_italic == 0
    if has_key(a:style, "cterm") && a:style["cterm"] == "italic"
      unlet a:style.cterm
    endif
    if has_key(a:style, "gui") && a:style["gui"] == "italic"
      unlet a:style.gui
    endif
  endif
  let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
  let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm     : "NONE")
    \ "ctermul=" (has_key(a:style, "ctermul") ? a:style.ctermul : "NONE")
endfunction


" === JETBRAINS COLOR GROUPS ==========================================================

" General
call s:h("JBDefault", { "fg": s:colors.text, "bg": s:colors.editor }) " Standard text
call s:h("JBHyperlink", { "fg": s:colors.link, "gui": "underline", "cterm": "underline" })
call s:h("JBTodo", { "fg": s:colors.todo }) " TODOs
call s:h("JBSearchResult", { "bg": s:colors.search }) " Search results
call s:h("JBFoldedText", { "fg": s:colors.comment, "bg": s:colors.folded }) " Folded text
call s:h("JBError", { "fg": s:colors.err, "gui": "underline", "cterm": "underline" }) " Doesn't match JB exactly, can't do seperate color undercurls in terminal
call s:h("JBWarning", { "fg": s:colors.warning, "gui": "underline", "cterm": "underline" }) " Doesn't match JB exactly, can't do seperate color undercurls in terminal
call s:h("JBCursor", { "fg": s:colors.text, "bg": s:colors.folded }) " Cursor

" Language defaults
call s:h("JBString", { "fg": s:colors.string }) " Strings
call s:h("JBStringRef", { "fg": s:colors.stringref }) "References within strings
call s:h("JBNumber", { "fg": s:colors.number }) " Numbers (floats, ints)
call s:h("JBKeyword", { "fg": s:colors.keyword }) " Keywords
call s:h("JBFunction", { "fg": s:colors.function }) " Functions (calls and definitions)
call s:h("JBComment", { "fg": s:colors.comment }) " Comment text
call s:h("JBCommentRef", { "fg": s:colors.commentref }) " References within comments e.g. to classes
call s:h("JBConstant", { "fg": s:colors.const }) " Constants
call s:h("JBType", { "fg": s:colors.type }) " Types
call s:h("JBTag", { "fg": s:colors.tag }) " Tags
call s:h("JBMatchedBracket", { "fg": s:colors.text, "bg": s:colors.folded, "gui": "bold", "cterm": "bold" }) " Matching brackets

" Diff and Merge
call s:h("JBDiffAddedLine", { "bg": s:colors.diffadd }) " Newly inserted lines in diff
call s:h("JBDiffChangedLine", { "bg": s:colors.diffmod }) " Changed lines in diff
call s:h("JBDiffChangedText", { "bg": s:colors.difftext }) " Changed text in diff
call s:h("JBDiffDeletedLine", { "bg": s:colors.diffdel }) " Deleted lines in diff

" Gutter
call s:h("JBGutterAddedLine", { "fg": s:colors.gutteradd }) " Added lines in gutter
call s:h("JBGutterChangedLine", { "fg": s:colors.guttermod }) " Changed lines in gutter
call s:h("JBGutterDeletedLine", { "fg": s:colors.gutterdel }) " Deleted lines in gutter
call s:h("JBGutterLineNr", { "fg": s:colors.diffdel }) " Line numbers in gutter

" UI
call s:h("JBEditorBG", { "bg": s:colors.editor }) " Editor background
call s:h("JBTree", { "fg": s:colors.text, "bg": s:colors.folded }) " Tree text
call s:h("JBTreeBG", { "bg": s:colors.folded }) " Tree background
call s:h("JBDivider", { "fg": s:colors.diffdel }) " Divider between panes

" === VIM HIGHLIGHT GROUPS ============================================================
" See :help highlight-groups for more information

" --- Major ---
call s:h("Normal", {"fg": s:colors.text, "bg": s:colors.editor}) " Normal text
highlight! link Comment JBComment
highlight! link Constant JBConstant
highlight! link Identifier JBFunction
highlight! link Statement JBKeyword
highlight! link PreProc JBCommentRef
highlight! link Type JBType
highlight! link Special JBKeyword
call s:h("Underlined", { "gui": "underline", "cterm": "underline" })
call s:h("Ignore", {})
highlight! link Error JBError
highlight! link Todo JBTodo

" --- Minor ---
highlight! link String JBString
highlight! link Character Normal
highlight! link Number JBNumber
highlight! link Boolean Number
highlight! link Float Number
highlight! link Function Identifier
highlight! link Keyword JBKeyword
highlight! link Conditional Keyword
highlight! link Repeat Keyword
highlight! link Label Keyword
highlight! link Include Keyword
highlight! link Define Keyword
highlight! link Macro Keyword
highlight! link SpecialChar Keyword
highlight! link Operator Normal
highlight! link Exception Error
highlight! link PreCondit PreProc
highlight! link StorageClass Type
highlight! link Structure Type
highlight! link Typedef Type
highlight! link Tag JBTag
highlight! link Delimiter Normal
highlight! link SpecialComment Keyword
highlight! link Debug Tag

" --- Text ---
highlight! link Cursor JBCursor
highlight! link LineNr JBGutterLineNr 
highlight! link CursorLineNr Comment
highlight! link NormalNC Normal
highlight! link Folded JBFoldedText
highlight! link FoldColumn Folded
highlight! link SignColumn Normal
highlight! link Search JBSearch
highlight! link IncSearch JBDiffChangedText
highlight! link CurSearch IncSearch
highlight! link ColorColumn JBTreeBG
highlight! link Conceal JBGutterLineNr
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
highlight! link CursorLine JBTreeBG
highlight! link CursorColumn CursorLine
highlight! link MatchParen JBMatchedBracket
highlight! link Title Constant

" --- Diff and Merge ---
highlight! link DiffAdd JBDiffAddedLine
highlight! link DiffChange JBDiffChangedLine
highlight! link DiffText JBDiffChangedText
highlight! link DiffDelete JBDiffDeletedLine

" --- Diagnostics ---
highlight! link ErrorText Error
highlight! link WarningText JBWarning
highlight! link InfoText Underline
highlight! link HintText Underline
highlight clear ErrorLine
highlight clear WarningLine
highlight clear InfoLine
highlight clear HintLine
highlight! link ErrorMsg Error
highlight! link WarningMsg JBWarning
highlight! link Question JBWarning
call s:h("ModeMsg", { "fg": s:colors.text, "gui": "bold", "cterm": "bold" }) "Mode message
call s:h("MoreMsg", { "fg": s:colors.function, "gui": "bold", "cterm": "bold" }) "More message
highlight! link SpellBad Underline
highlight! link NonText LineNr
highlight! link WhiteSpace LineNr
highlight! link SpecialKey LineNr

" --- UI ---
highlight! link Pmenu JBTree
highlight! link PmenuSbar Comment
highlight! link PmenuSel Cursor
call s:h("PmenuKind", { "fg": s:colors.type, "bg": s:colors.folded }) "Popup menu kind
call s:h("PmenuExtra", { "fg": s:colors.comment, "bg": s:colors.folded }) "Popup menu extra
highlight! link WildMenu PmenuSel
highlight! link Directory String
call s:h("FloatBorder", { "fg": s:colors.diffdel, "bg": s:colors.editor }) "Float border
highlight! link NormalFloat Normal
highlight! link Terminal Normal
highlight! link EndOfBuffer JBEditorBG
highlight! link StatusLine JBTree
highlight! link StatusLineTerm StatusLine
call s:h("StatusLineNC", { "fg": s:colors.diffdel, "bg": s:colors.folded }) "Status line inactive
highlight! link StatusLineTermNC StatusLineNC
highlight! link TabLine JBTree
highlight! link TabLineFill JBTree
highlight! link TabLineSel Cursor
highlight! link VertSplit JBDivider
highlight! link WinSeparator VertSplit
highlight! link ToolbarButton Cursor

" Visual mode
call s:h("Visual", { "bg": s:colors.folded }) "Visual selection
call s:h("VisualNOS", { "bg": s:colors.folded, "gui": "underline", "cterm":  "underline" }) "Visual selection
call s:h("QuickFixLine", { "fg": s:colors.link, "gui": "bold", "cterm": "bold" }) "Quickfix selected line
highlight! link Debug Tag
call s:h("debugBreakpoint", { "fg": s:colors.text, "bg": s:colors.err1 }) "Debug

" === LANGUAGE SPECIFIC HIGHLIGHTS ====================================================

" --- Go (vim-go/polyglot) ---
call s:h("goPackage", { "fg": s:colors.tag })
highlight! link goBuiltins Type
call s:h("goField", { "fg": s:colors.struct })

" --- JSON (vim-json/polyglot) ---

highlight! link jsonKeyword Constant
highlight! link jsonBoolean Keyword

" --- Markdown ---
highlight! link markdownCode String
highlight! link markdownCodeBlock String
highlight! link markdownCodeDelimiter String
highlight! link markdownBlockQuote String
highlight! link markdownListMarker Keyword
highlight! link markdownOrderedListMarker Keyword
highlight! link markdownRule Comment
highlight! link markdownH1 Const
highlight! link markdownH2 Const
highlight! link markdownH3 Const
highlight! link markdownH4 Const
highlight! link markdownH5 Const
highlight! link markdownH6 Const
highlight! link markdownHeadingRule Const
highlight! link markdownUrl JBHyperlink
highlight! link markdownUrlDelimiter JBHyperlink

" --- Markdown (vim-markdown/polyglot) ---
highlight! link mkdCode String
highlight! link mkdSnippetSHELL String
highlight! link mkdURL JBHyperlink
highlight! link mkdHeading Const

" --- HTML ---
highlight! link htmlTag Tag
highlight! link htmlEndTag Tag
highlight! link htmlTagN Tag
highlight! link htmlTagName Tag
highlight! link htmlArg Normal
highlight! link htmlScriptTag Const
highlight! link htmlString String

" --- Vim ---
highlight! link vimLet Keyword
highlight! link vimFunction Function
highlight! link vimIsCommand Normal
highlight! link vimUserFunc Function
highlight! link vimFuncName Function

" === PLUGIN SPECIFIC HIGHLIGHTS (NON-LANGUAGE) ======================================================

" --- GitGutter ---
highlight! link GitGutterAdd JBGutterAddedLine
highlight! link GitGutterChange JBGutterChangedLine
highlight! link GitGutterDelete JBGutterDeletedLine

" --- Fugitive ---
highlight! link diffAdded DiffAdd
highlight! link diffRemoved DiffDelete
highlight! link gitDiff Comment

" --- FZF ---
let g:fzf_colors = {
      \ 'fg': ['fg', 'Normal'],
      \ 'hl': ['fg', 'Search'],
      \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+': ['fg', 'Cursor'],
      \ 'info': ['fg', 'Comment'],
      \ 'gutter': ['bg', 'JBEditorBG'],
      \ 'border':  ['fg', 'VertSplit'],
      \ 'prompt': ['fg', 'ModeMsg'],
      \ 'pointer': ['fg', 'Function'],
      \ 'marker': ['fg', 'Function'],
      \ 'spinner': ['fg', 'Warning'],
      \ 'header': ['fg', 'Const']
      \ }


" --- MistFly ---
call s:h("MistflyNormal", { "fg": s:colors.text, "bg": s:colors.commentref }) " Normal text
call s:h("MistflyCommand", { "fg": s:colors.editor, "bg": s:colors.warning }) " Command text
call s:h("MistflyInsert", { "fg": s:colors.editor, "bg": s:colors.function }) " Insert text
call s:h("MistflyVisual", { "fg": s:colors.editor, "bg": s:colors.keyword }) " Visual text
call s:h("MistflyReplace", { "fg": s:colors.editor, "bg": s:colors.err1 }) " Replace text

" --- Fern ---
highlight! link FernRootSymbol String
highlight! link FernRootText String
highlight! link FernBranchSymbol String
highlight! link FernBranchText ModeMsg
highlight! link FernLeafSymbol Function 
highlight! link FernGitStatusIndex DiffAdd
highlight! link FernGitStatusWorktree DiffText
highlight! link FernGitStatusUntracked DiffAdd

" Must appear at the end of the file to work around this oddity:
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark

