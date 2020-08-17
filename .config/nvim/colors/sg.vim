" vi:syntax=vim

" no pipe char in VertSplit
set fillchars+=vert:\

let s:grey_dark_1    = "29272b" " bg
let s:grey_dark_2    = "25262B"
let s:grey_dark_3    = "2B2A2B"
let s:grey_dark_4    = "222222"

let s:grey_middle_1  = "646168" " muted fg
let s:grey_middle_2  = "76727A"
let s:grey_middle_3  = "76727A"
let s:grey_middle_4  = "87828C"

let s:grey_light_1   = "aaaaaa"
let s:grey_light_2   = "c1c1c1"
let s:pure_white     = "ffffff"

let s:red_medium_1   = "a06666"
let s:red_dark_2     = "5C3B3B"

let s:red_bright_1   = "bf7a6f"
let s:pink_bright_1  = "dd9999"

let s:rust           = "A17D6F"

" Terminal color definitions
let s:cterm00        = "00"
let s:cterm03        = "08"
let s:cterm05        = "07"
let s:cterm07        = "15"
let s:cterm08        = "01"
let s:cterm0A        = "03"
let s:cterm0B        = "02"
let s:cterm0C        = "06"
let s:cterm0D        = "04"
let s:cterm0E        = "05"
let s:cterm01        = "10"
let s:cterm02        = "11"
let s:cterm04        = "12"
let s:cterm06        = "13"
let s:cterm09        = "09"
let s:cterm0F        = "14"

hi clear
syntax reset
let g:colors_name = "sg"

fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  let l:attr = get(a:, 1, "")
  let l:guisp = get(a:, 2, "")

  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if l:attr != ""
    exec "hi " . a:group . " gui=" . l:attr . " cterm=" . l:attr
  endif
  if l:guisp != ""
    exec "hi " . a:group . " guisp=#" . l:guisp
  endif
endfun

" Vim editor colors
call <sid>hi("Normal",        s:grey_light_2, s:grey_dark_1, s:cterm05, s:cterm00, "", "")
call <sid>hi("Bold",          "", "", "", "", "bold", "")
call <sid>hi("Debug",         s:red_bright_1, "", s:cterm08, "", "", "")
call <sid>hi("Directory",     s:grey_middle_2, "", s:cterm0D, "", "", "")
call <sid>hi("Error",         s:grey_dark_1, s:red_bright_1, s:cterm00, s:cterm08, "", "")
call <sid>hi("ErrorMsg",      s:red_bright_1, s:grey_dark_1, s:cterm08, s:cterm00, "", "")
call <sid>hi("Exception",     s:red_bright_1, "", s:cterm08, "", "", "")
call <sid>hi("FoldColumn",    s:grey_light_1, s:grey_dark_2, s:cterm0C, s:cterm01, "", "")
call <sid>hi("Folded",        s:grey_middle_1, s:grey_dark_2, s:cterm03, s:cterm01, "", "")
call <sid>hi("IncSearch",     s:grey_dark_2, s:grey_light_1, s:cterm01, s:cterm09, "none", "")
call <sid>hi("Italic",        "", "", "", "", "none", "")
call <sid>hi("Macro",         s:red_bright_1, "", s:cterm08, "", "", "")
call <sid>hi("MatchParen",    "", s:grey_middle_1, "", s:cterm03,  "", "")
call <sid>hi("ModeMsg",       s:pink_bright_1, "", s:cterm0B, "", "", "")
call <sid>hi("MoreMsg",       s:pink_bright_1, "", s:cterm0B, "", "", "")
call <sid>hi("Question",      s:grey_middle_2, "", s:cterm0D, "", "", "")
call <sid>hi("Search",        s:grey_dark_2, s:red_medium_1, s:cterm01, s:cterm0A,  "", "")
call <sid>hi("Substitute",    s:grey_dark_2, s:red_medium_1, s:cterm01, s:cterm0A, "none", "")
call <sid>hi("SpecialKey",    s:grey_middle_1, "", s:cterm03, "", "", "")
call <sid>hi("TooLong",       s:red_bright_1, "", s:cterm08, "", "", "")
call <sid>hi("Underlined",    s:red_bright_1, "", s:cterm08, "", "", "")
call <sid>hi("Visual",        "", s:grey_dark_4, "", s:cterm03, "", "")
call <sid>hi("VisualNOS",     s:red_bright_1, "", s:cterm08, "", "", "")
call <sid>hi("WarningMsg",    s:red_bright_1, "", s:cterm08, "", "", "")
call <sid>hi("WildMenu",      s:red_bright_1, s:red_medium_1, s:cterm08, "", "", "")
call <sid>hi("Title",         s:grey_middle_2, "", s:cterm0D, "", "none", "")
call <sid>hi("Conceal",       s:grey_middle_2, s:grey_dark_1, s:cterm0D, s:cterm00, "", "")
call <sid>hi("Cursor",        s:grey_dark_1, s:pure_white, s:cterm00, s:cterm05, "", "")
call <sid>hi("NonText",       s:grey_middle_1, "", s:cterm03, "", "", "")
call <sid>hi("LineNr",        s:grey_middle_1, s:grey_dark_2, s:cterm03, s:cterm01, "", "")
call <sid>hi("SignColumn",    s:grey_middle_1, s:grey_dark_1, s:cterm03, s:cterm01, "", "")
call <sid>hi("StatusLine",    s:grey_middle_1, s:grey_dark_3, s:cterm04, s:cterm02, "none", "")
call <sid>hi("StatusLineNC",  s:grey_middle_1, s:grey_dark_2, s:cterm03, s:cterm01, "none", "")
call <sid>hi("VertSplit",     s:grey_dark_3, s:grey_dark_1, s:cterm02, s:cterm02, "none", "")
call <sid>hi("ColorColumn",   "", s:grey_dark_2, "", s:cterm01, "none", "")
call <sid>hi("CursorColumn",  "", s:grey_dark_2, "", s:cterm01, "none", "")
call <sid>hi("CursorLine",    "", s:grey_dark_2, "", s:cterm01, "none", "")
call <sid>hi("CursorLineNr",  s:grey_middle_1, s:grey_dark_2, s:cterm04, s:cterm01, "", "")
call <sid>hi("QuickFixLine",  "", s:grey_dark_2, "", s:cterm01, "none", "")
call <sid>hi("PMenu",         s:pure_white, s:grey_dark_2, s:cterm05, s:cterm01, "none", "")
call <sid>hi("PMenuSel",      s:grey_dark_2, s:pure_white, s:cterm01, s:cterm05, "", "")
call <sid>hi("TabLine",       s:grey_middle_1, s:grey_dark_2, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineFill",   s:grey_middle_1, s:grey_dark_2, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineSel",    s:pink_bright_1, s:grey_dark_2, s:cterm0B, s:cterm01, "none", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:grey_light_1, "", s:cterm09, "", "", "")
call <sid>hi("Character",    s:grey_light_1, "", s:cterm08, "", "", "")
call <sid>hi("Comment",      s:grey_middle_1, "", s:cterm03, "", "", "")
call <sid>hi("Conditional",  s:grey_light_1, "", s:cterm0E, "", "", "")
call <sid>hi("Constant",     s:grey_light_1, "", s:cterm09, "", "", "")
call <sid>hi("Define",       s:grey_middle_3, "", s:cterm0E, "", "none", "")
call <sid>hi("Delimiter",    s:grey_middle_4, "", s:cterm0F, "", "", "")
call <sid>hi("Float",        s:grey_light_1, "", s:cterm09, "", "", "")
call <sid>hi("Function",     s:grey_light_1, "", s:cterm0D, "", "", "")
call <sid>hi("Identifier",   s:red_bright_1, "", s:cterm08, "", "none", "")
call <sid>hi("Include",      s:grey_middle_2, "", s:cterm0D, "", "", "")
call <sid>hi("Keyword",      s:grey_light_1, "", s:cterm0E, "", "", "")
call <sid>hi("Label",        s:red_medium_1, "", s:cterm0A, "", "", "")
call <sid>hi("Number",       s:grey_light_1, "", s:cterm09, "", "", "")
call <sid>hi("Operator",     s:pure_white, "", s:cterm05, "", "none", "")
call <sid>hi("PreProc",      s:grey_light_1, "", s:cterm0A, "", "", "")
call <sid>hi("Repeat",       s:grey_light_1, "", s:cterm0A, "", "", "")
call <sid>hi("Special",      s:grey_light_1, "", s:cterm0C, "", "", "")
call <sid>hi("SpecialChar",  s:red_bright_1, "", s:cterm0F, "", "", "")
call <sid>hi("Statement",    s:red_bright_1, "", s:cterm08, "", "", "")
call <sid>hi("StorageClass", s:red_medium_1, "", s:cterm0A, "", "", "")
call <sid>hi("String",       s:red_bright_1, "", s:cterm0B, "", "", "")
call <sid>hi("Structure",    s:grey_light_1, "", s:cterm0E, "", "", "")
call <sid>hi("Tag",          s:red_medium_1, "", s:cterm0A, "", "", "")
call <sid>hi("Todo",         s:red_medium_1, s:grey_dark_2, s:cterm0A, s:cterm01, "", "")
call <sid>hi("Type",         s:red_medium_1, "", s:cterm0A, "", "none", "")
call <sid>hi("Typedef",      s:red_medium_1, "", s:cterm0A, "", "", "")

" C highlighting
call <sid>hi("cOperator",   s:grey_light_1, "", s:cterm0C, "", "", "")
call <sid>hi("cPreCondit",  s:grey_middle_3, "", s:cterm0E, "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:pure_white, "", s:cterm05, "", "", "")
call <sid>hi("cssClassName",   s:grey_middle_3, "", s:cterm0E, "", "", "")
call <sid>hi("cssColor",       s:grey_light_1, "", s:cterm0C, "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:pink_bright_1, s:grey_dark_2,  s:cterm0B, s:cterm01, "", "")
call <sid>hi("DiffChange",   s:grey_middle_1, s:grey_dark_2,  s:cterm03, s:cterm01, "", "")
call <sid>hi("DiffDelete",   s:red_bright_1, s:grey_dark_2,  s:cterm08, s:cterm01, "", "")
call <sid>hi("DiffText",     s:grey_middle_2, s:grey_dark_2,  s:cterm0D, s:cterm01, "", "")
call <sid>hi("DiffAdded",    s:pink_bright_1, s:grey_dark_1,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffFile",     s:red_bright_1, s:grey_dark_1,  s:cterm08, s:cterm00, "", "")
call <sid>hi("DiffNewFile",  s:pink_bright_1, s:grey_dark_1,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffLine",     s:grey_middle_2, s:grey_dark_1,  s:cterm0D, s:cterm00, "", "")
call <sid>hi("DiffRemoved",  s:red_bright_1, s:grey_dark_1,  s:cterm08, s:cterm00, "", "")

" Git highlighting
call <sid>hi("gitcommitOverflow",       s:red_bright_1, "", s:cterm08, "", "", "")
call <sid>hi("gitcommitSummary",        s:pink_bright_1, "", s:cterm0B, "", "", "")
call <sid>hi("gitcommitComment",        s:grey_middle_1, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitUntracked",      s:grey_middle_1, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitDiscarded",      s:grey_middle_1, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitSelected",       s:grey_middle_1, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitHeader",         s:grey_middle_3, "", s:cterm0E, "", "", "")
call <sid>hi("gitcommitSelectedType",   s:grey_middle_2, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitUnmergedType",   s:grey_middle_2, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitDiscardedType",  s:grey_middle_2, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitBranch",         s:grey_light_1, "", s:cterm09, "", "bold", "")
call <sid>hi("gitcommitUntrackedFile",  s:red_medium_1, "", s:cterm0A, "", "", "")
call <sid>hi("gitcommitUnmergedFile",   s:red_bright_1, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitDiscardedFile",  s:red_bright_1, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitSelectedFile",   s:pink_bright_1, "", s:cterm0B, "", "bold", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:pink_bright_1, s:grey_dark_1, s:cterm0B, s:cterm01, "", "")
call <sid>hi("GitGutterChange",  s:grey_middle_2, s:grey_dark_1, s:cterm0D, s:cterm01, "", "")
call <sid>hi("GitGutterDelete",  s:red_bright_1, s:grey_dark_1, s:cterm08, s:cterm01, "", "")
call <sid>hi("GitGutterChangeDelete",  s:grey_middle_3, s:grey_dark_1, s:cterm0E, s:cterm01, "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:pink_bright_1, "", s:cterm0B, "", "", "")
call <sid>hi("markdownError",             s:pure_white, s:grey_dark_1, s:cterm05, s:cterm00, "", "")
call <sid>hi("markdownCodeBlock",         s:pink_bright_1, "", s:cterm0B, "", "", "")
call <sid>hi("markdownHeadingDelimiter",  s:grey_middle_2, "", s:cterm0D, "", "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:grey_middle_2, "", s:cterm0D, "", "", "")
call <sid>hi("NERDTreeExecFile",  s:pure_white, "", s:cterm05, "", "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", "", "", "", "undercurl", s:red_bright_1)
call <sid>hi("SpellLocal",   "", "", "", "", "undercurl", s:grey_light_1)
call <sid>hi("SpellCap",     "", "", "", "", "undercurl", s:grey_middle_2)
call <sid>hi("SpellRare",    "", "", "", "", "undercurl", s:grey_middle_3)

" nvim-lsp
call <sid>hi("LspDiagnosticsError",  s:grey_light_1, s:red_dark_2, s:cterm08, s:cterm01, "", "")
call <sid>hi("LspDiagnosticsWarning",  s:grey_light_1, s:red_dark_2, s:cterm08, s:cterm01, "", "")
call <sid>hi("LspDiagnosticsInformation",  s:pure_white, s:red_medium_1, s:cterm08, s:cterm01, "", "")
call <sid>hi("LspDiagnosticsHint",  s:pure_white, s:red_medium_1, s:cterm08, s:cterm01, "", "")
call <sid>hi("LspReferenceText",  s:pure_white, s:red_medium_1, s:cterm08, s:cterm01, "", "")
call <sid>hi("LspReferenceRead",  s:pure_white, s:red_medium_1, s:cterm08, s:cterm01, "", "")
call <sid>hi("LspReferenceWrite",  s:pure_white, s:red_medium_1, s:cterm08, s:cterm01, "", "")

" Remove functions
delf <sid>hi

" Remove color variables
" unlet s:grey_dark_1 s:grey_dark_2 s:grey_dark_3 s:grey_middle_1 s:pure_white s:pure_white  s:red_bright_1  s:grey_light_1 s:red_medium_1  s:pink_bright_1  s:grey_light_1  s:grey_middle_2  s:grey_middle_3  s:grey_middle_4
" unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
