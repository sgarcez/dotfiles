-- https://github.com/RRethy/base16-nvim/blob/master/lua/base16-colorscheme.lua

local colorschemes = {
    ["default"] = {
        -- darkest grey
        base00 = "#2b303b",
        -- very dark grey
        base01 = "#343d46",
        -- dark blueish grey
        base02 = "#4f5b66",
        -- dark grey
        base03 = "#65737e",
        -- mid grey
        base04 = "#a7adba",
        -- light grey
        base05 = "#c0c5ce",
        -- lighter grey
        base06 = "#dfe1e8",
        -- lightest grey
        base07 = "#eff1f5",
        -- orange / grey
        base08 = "#a7adba",
        -- orange
        base09 = "#d08770",
        -- yellow
        base0A = "#ebcb8b",
        -- light olive green
        base0B = "#a3be8c",
        -- light blue
        base0C = "#96b5b4",
        -- light blue grey
        base0D = "#8fa1b3",
        -- light pink violet
        base0E = "#b48ead",
        -- light red brown / brick
        base0F = "#ab7967",

        red = "#bf616a",
    },
}

local c = colorschemes["default"]

local highlight = setmetatable({}, {
    __newindex = function(_, hlgroup, args)
        if "string" == type(args) then
            vim.api.nvim_set_hl(0, hlgroup, { link = args })
            return
        end

        local guifg, guibg, gui, guisp = args.guifg or nil, args.guibg or nil, args.gui or nil, args.guisp or nil
        local ctermfg, ctermbg = args.ctermfg or nil, args.ctermbg or nil
        local val = {}
        if guifg then
            val.fg = guifg
        end
        if guibg then
            val.bg = guibg
        end
        if ctermfg then
            val.ctermfg = ctermfg
        end
        if ctermbg then
            val.ctermbg = ctermbg
        end
        if guisp then
            val.sp = guisp
        end
        if gui then
            for x in string.gmatch(gui, "([^,]+)") do
                if x ~= "none" then
                    val[x] = true
                end
            end
        end
        vim.api.nvim_set_hl(0, hlgroup, val)
    end,
})
local hi = highlight

vim.cmd("syntax reset")

-- Vim editor colors
hi.Normal = { guifg = c.base05, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm00 }
hi.Bold = { guifg = nil, guibg = nil, gui = "bold", guisp = nil, ctermfg = nil, ctermbg = nil }
hi.Debug = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.Directory = { guifg = c.base0D, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.Error = { guifg = c.red, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = c.cterm00 }
-- hi.Error = { guifg = c.base01, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm01, ctermbg = nil }
hi.ErrorMsg = { guifg = c.base08, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = c.cterm00 }
hi.Exception = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.FoldColumn = { guifg = c.base0C, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm0C, ctermbg = c.cterm00 }
hi.Folded = { guifg = c.base03, guibg = c.base01, gui = nil, guisp = nil, ctermfg = c.cterm03, ctermbg = c.cterm01 }
hi.IncSearch =
{ guifg = c.base01, guibg = c.base09, gui = "none", guisp = nil, ctermfg = c.cterm01, ctermbg = c.cterm09 }
hi.Italic = { guifg = nil, guibg = nil, gui = "none", guisp = nil, ctermfg = nil, ctermbg = nil }
hi.Macro = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.MatchParen = { guifg = nil, guibg = c.base03, gui = nil, guisp = nil, ctermfg = nil, ctermbg = c.cterm03 }
hi.ModeMsg = { guifg = c.base0B, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0B, ctermbg = nil }
hi.MoreMsg = { guifg = c.base0B, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0B, ctermbg = nil }
hi.Question = { guifg = c.base0D, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.Search = { guifg = c.base01, guibg = c.base0A, gui = nil, guisp = nil, ctermfg = c.cterm01, ctermbg = c.cterm0A }
hi.Substitute =
{ guifg = c.base01, guibg = c.base0A, gui = "none", guisp = nil, ctermfg = c.cterm01, ctermbg = c.cterm0A }
hi.SpecialKey = { guifg = c.base03, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm03, ctermbg = nil }
hi.TooLong = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.Underlined = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.Visual = { guifg = nil, guibg = c.base01, gui = nil, guisp = nil, ctermfg = nil, ctermbg = c.cterm02 }
hi.VisualNOS = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.WarningMsg = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.WildMenu = { guifg = c.base08, guibg = c.base0A, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = c.cterm0A }
hi.Title = { guifg = c.base0D, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.Conceal = { guifg = c.base0D, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = c.cterm00 }
hi.Cursor = { guifg = c.base00, guibg = c.base05, gui = nil, guisp = nil, ctermfg = c.cterm00, ctermbg = c.cterm05 }
hi.NonText = { guifg = c.base03, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm03, ctermbg = nil }
hi.LineNr = { guifg = c.base04, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm04, ctermbg = c.cterm00 }
hi.SignColumn = { guifg = c.base03, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm03, ctermbg = c.cterm00 }
-- hi.SignColumn = { guifg = c.base04, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm04, ctermbg = c.cterm00 }
hi.StatusLine =
{ guifg = c.base04, guibg = c.base00, gui = "none", guisp = nil, ctermfg = c.cterm04, ctermbg = c.cterm00 }
-- { guifg = c.base05, guibg = c.base02, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm02 }
hi.StatusLineNC =
{ guifg = c.base04, guibg = c.base01, gui = "none", guisp = nil, ctermfg = c.cterm04, ctermbg = c.cterm01 }
hi.WinBar = { guifg = c.base05, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = nil }
hi.WinBarNC = { guifg = c.base04, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm04, ctermbg = nil }
hi.VertSplit =
{ guifg = c.red, guibg = c.base00, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm00 }
-- { guifg = c.base05, guibg = c.base00, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm00 }
hi.ColorColumn = { guifg = nil, guibg = c.base01, gui = "none", guisp = nil, ctermfg = nil, ctermbg = c.cterm01 }
hi.CursorColumn = { guifg = nil, guibg = c.base01, gui = "none", guisp = nil, ctermfg = nil, ctermbg = c.cterm01 }
hi.CursorLine = { guifg = nil, guibg = c.base01, gui = "none", guisp = nil, ctermfg = nil, ctermbg = c.cterm01 }
hi.CursorLineNr =
{ guifg = c.base04, guibg = c.base01, gui = nil, guisp = nil, ctermfg = c.cterm04, ctermbg = c.cterm01 }
hi.QuickFixLine = { guifg = nil, guibg = c.base01, gui = "none", guisp = nil, ctermfg = nil, ctermbg = c.cterm01 }
hi.PMenu = { guifg = c.base05, guibg = c.base01, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm01 }
hi.PMenuSel = { guifg = c.base01, guibg = c.base05, gui = nil, guisp = nil, ctermfg = c.cterm01, ctermbg = c.cterm05 }
hi.TabLine = { guifg = c.base03, guibg = c.base01, gui = "none", guisp = nil, ctermfg = c.cterm03, ctermbg = c.cterm01 }
hi.TabLineFill =
{ guifg = c.base03, guibg = c.base01, gui = "none", guisp = nil, ctermfg = c.cterm03, ctermbg = c.cterm01 }
hi.TabLineSel =
{ guifg = c.base0B, guibg = c.base01, gui = "none", guisp = nil, ctermfg = c.cterm0B, ctermbg = c.cterm01 }

-- Standard syntax highlighting
hi.Boolean = { guifg = c.base09, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.Character = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.Comment = { guifg = c.base03, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm03, ctermbg = nil }
hi.Conditional = { guifg = c.base0E, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.Constant = { guifg = c.base09, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.Define = { guifg = c.base0E, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.Delimiter = { guifg = c.base0F, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0F, ctermbg = nil }
hi.Float = { guifg = c.base09, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.Function = { guifg = c.base0D, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.Identifier = { guifg = c.base08, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.Include = { guifg = c.base0D, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.Keyword = { guifg = c.base0E, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.Label = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.Number = { guifg = c.base09, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.Operator = { guifg = c.base0E, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.PreProc = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.Repeat = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.Special = { guifg = c.base0C, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0C, ctermbg = nil }
hi.SpecialChar = { guifg = c.base0F, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0F, ctermbg = nil }
hi.Statement = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.StorageClass = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.String = { guifg = c.base0B, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0B, ctermbg = nil }
hi.Structure = { guifg = c.base0E, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.Tag = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.Todo = { guifg = c.base0A, guibg = c.base01, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = c.cterm01 }
hi.Type = { guifg = c.base0A, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.Typedef = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }

-- Diff highlighting
hi.DiffAdd = { guifg = c.base0B, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm0B, ctermbg = c.cterm00 }
hi.DiffChange = { guifg = c.base03, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm03, ctermbg = c.cterm00 }
hi.DiffDelete = { guifg = c.base08, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = c.cterm00 }
hi.DiffText = { guifg = c.base0D, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = c.cterm00 }
hi.DiffAdded = { guifg = c.base0B, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm0B, ctermbg = c.cterm00 }
hi.DiffFile = { guifg = c.base08, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = c.cterm00 }
hi.DiffNewFile =
{ guifg = c.base0B, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm0B, ctermbg = c.cterm00 }
hi.DiffLine = { guifg = c.base0D, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = c.cterm00 }
hi.DiffRemoved =
{ guifg = c.base08, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = c.cterm00 }

-- Git highlighting
hi.gitcommitOverflow = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.gitcommitSummary = { guifg = c.base0B, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0B, ctermbg = nil }
hi.gitcommitComment = { guifg = c.base03, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm03, ctermbg = nil }
hi.gitcommitUntracked = { guifg = c.base03, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm03, ctermbg = nil }
hi.gitcommitDiscarded = { guifg = c.base03, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm03, ctermbg = nil }
hi.gitcommitSelected = { guifg = c.base03, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm03, ctermbg = nil }
hi.gitcommitHeader = { guifg = c.base0E, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.gitcommitSelectedType = { guifg = c.base0D, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.gitcommitUnmergedType = { guifg = c.base0D, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.gitcommitDiscardedType =
{ guifg = c.base0D, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.gitcommitBranch = { guifg = c.base09, guibg = nil, gui = "bold", guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.gitcommitUntrackedFile =
{ guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.gitcommitUnmergedFile =
{ guifg = c.base08, guibg = nil, gui = "bold", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.gitcommitDiscardedFile =
{ guifg = c.base08, guibg = nil, gui = "bold", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.gitcommitSelectedFile =
{ guifg = c.base0B, guibg = nil, gui = "bold", guisp = nil, ctermfg = c.cterm0B, ctermbg = nil }

-- GitGutter highlighting
hi.GitGutterAdd =
{ guifg = c.base0B, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm0B, ctermbg = c.cterm00 }
hi.GitGutterChange =
{ guifg = c.base0D, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = c.cterm00 }
hi.GitGutterDelete =
{ guifg = c.base08, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = c.cterm00 }
hi.GitGutterChangeDelete =
{ guifg = c.base0E, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm0E, ctermbg = c.cterm00 }

-- Spelling highlighting
hi.SpellBad = { guifg = nil, guibg = nil, gui = "undercurl", guisp = c.base08, ctermfg = nil, ctermbg = nil }
hi.SpellLocal = { guifg = nil, guibg = nil, gui = "undercurl", guisp = c.base0C, ctermfg = nil, ctermbg = nil }
hi.SpellCap = { guifg = nil, guibg = nil, gui = "undercurl", guisp = c.base0D, ctermfg = nil, ctermbg = nil }
hi.SpellRare = { guifg = nil, guibg = nil, gui = "undercurl", guisp = c.base0E, ctermfg = nil, ctermbg = nil }

hi.DiagnosticError = { guifg = c.red, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.DiagnosticWarn = { guifg = c.base0E, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.DiagnosticInfo = { guifg = c.base0D, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.DiagnosticHint = { guifg = c.base0C, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0C, ctermbg = nil }
hi.DiagnosticUnderlineError =
{ guifg = nil, guibg = nil, gui = "undercurl", guisp = c.base08, ctermfg = nil, ctermbg = nil }
hi.DiagnosticUnderlineWarning =
{ guifg = nil, guibg = nil, gui = "undercurl", guisp = c.base0E, ctermfg = nil, ctermbg = nil }
hi.DiagnosticUnderlineWarn =
{ guifg = nil, guibg = nil, gui = "undercurl", guisp = c.base0E, ctermfg = nil, ctermbg = nil }
hi.DiagnosticUnderlineInformation =
{ guifg = nil, guibg = nil, gui = "undercurl", guisp = c.base0F, ctermfg = nil, ctermbg = nil }
hi.DiagnosticUnderlineHint =
{ guifg = nil, guibg = nil, gui = "undercurl", guisp = c.base0C, ctermfg = nil, ctermbg = nil }

hi.LspReferenceText = { guifg = nil, guibg = nil, gui = "underline", guisp = c.base04, ctermfg = nil, ctermbg = nil }
hi.LspReferenceRead = { guifg = nil, guibg = nil, gui = "underline", guisp = c.base04, ctermfg = nil, ctermbg = nil }
hi.LspReferenceWrite = { guifg = nil, guibg = nil, gui = "underline", guisp = c.base04, ctermfg = nil, ctermbg = nil }
hi.LspDiagnosticsDefaultError = "DiagnosticError"
hi.LspDiagnosticsDefaultWarning = "DiagnosticWarn"
hi.LspDiagnosticsDefaultInformation = "DiagnosticInfo"
hi.LspDiagnosticsDefaultHint = "DiagnosticHint"
hi.LspDiagnosticsUnderlineError = "DiagnosticUnderlineError"
hi.LspDiagnosticsUnderlineWarning = "DiagnosticUnderlineWarning"
hi.LspDiagnosticsUnderlineInformation = "DiagnosticUnderlineInformation"
hi.LspDiagnosticsUnderlineHint = "DiagnosticUnderlineHint"

hi.TSAnnotation = { guifg = c.base0F, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0F, ctermbg = nil }
hi.TSAttribute = { guifg = c.base0A, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.TSBoolean = { guifg = c.base09, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.TSCharacter = { guifg = c.base08, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.TSComment = { guifg = c.base03, guibg = nil, gui = "italic", guisp = nil, ctermfg = c.cterm03, ctermbg = nil }
hi.TSConstructor = { guifg = c.base0D, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.TSConditional = { guifg = c.base0E, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.TSConstant = { guifg = c.base09, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.TSConstBuiltin = { guifg = c.base09, guibg = nil, gui = "italic", guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.TSConstMacro = { guifg = c.base08, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.TSError = { guifg = c.base08, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.TSException = { guifg = c.base08, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.TSField = { guifg = c.base05, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = nil }
hi.TSFloat = { guifg = c.base09, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.TSFunction = { guifg = c.base0D, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.TSFuncBuiltin = { guifg = c.base0D, guibg = nil, gui = "italic", guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.TSFuncMacro = { guifg = c.base08, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.TSInclude = { guifg = c.base0D, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.TSKeyword = { guifg = c.base0E, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.TSKeywordFunction = { guifg = c.base0E, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.TSKeywordOperator = { guifg = c.base0E, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.TSLabel = { guifg = c.base0A, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.TSMethod = { guifg = c.base0D, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.TSNamespace = { guifg = c.base08, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.TSNone = { guifg = c.base05, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = nil }
hi.TSNumber = { guifg = c.base09, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.TSOperator = { guifg = c.base05, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = nil }
hi.TSParameter = { guifg = c.base05, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = nil }
hi.TSParameterReference =
{ guifg = c.base05, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = nil }
hi.TSProperty = { guifg = c.base05, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = nil }
hi.TSPunctDelimiter = { guifg = c.base0F, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0F, ctermbg = nil }
hi.TSPunctBracket = { guifg = c.base05, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = nil }
hi.TSPunctSpecial = { guifg = c.base0F, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0F, ctermbg = nil }
hi.TSRepeat = { guifg = c.base0E, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.TSString = { guifg = c.base0B, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0B, ctermbg = nil }
hi.TSStringRegex = { guifg = c.base0C, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0C, ctermbg = nil }
hi.TSStringEscape = { guifg = c.base0C, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0C, ctermbg = nil }
hi.TSSymbol = { guifg = c.base0B, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0B, ctermbg = nil }
hi.TSTag = { guifg = c.base08, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.TSTagDelimiter = { guifg = c.base0F, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0F, ctermbg = nil }
hi.TSText = { guifg = c.base05, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = nil }
hi.TSStrong = { guifg = nil, guibg = nil, gui = "bold", guisp = nil, ctermfg = nil, ctermbg = nil }
hi.TSEmphasis = { guifg = c.base09, guibg = nil, gui = "italic", guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.TSUnderline = { guifg = c.base00, guibg = nil, gui = "underline", guisp = nil, ctermfg = c.cterm00, ctermbg = nil }
hi.TSStrike = { guifg = c.base00, guibg = nil, gui = "strikethrough", guisp = nil, ctermfg = c.cterm00, ctermbg = nil }
hi.TSTitle = { guifg = c.base0D, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.TSLiteral = { guifg = c.base09, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.TSURI = { guifg = c.base09, guibg = nil, gui = "underline", guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.TSType = { guifg = c.base0A, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.TSTypeBuiltin = { guifg = c.base0A, guibg = nil, gui = "italic", guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.TSVariable = { guifg = c.base08, guibg = nil, gui = "none", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.TSVariableBuiltin =
{ guifg = c.base08, guibg = nil, gui = "italic", guisp = nil, ctermfg = c.cterm08, ctermbg = nil }

hi.TSDefinition = { guifg = nil, guibg = nil, gui = "underline", guisp = c.base04, ctermfg = nil, ctermbg = nil }
hi.TSDefinitionUsage = { guifg = nil, guibg = nil, gui = "underline", guisp = c.base04, ctermfg = nil, ctermbg = nil }
hi.TSCurrentScope = { guifg = nil, guibg = nil, gui = "bold", guisp = nil, ctermfg = nil, ctermbg = nil }

hi.LspInlayHint = { guifg = c.base03, guibg = nil, gui = "italic", guisp = nil, ctermfg = c.cterm03, ctermbg = nil }
hi["@comment"] = "TSComment"
hi["@error"] = "TSError"
hi["@none"] = "TSNone"
hi["@preproc"] = "PreProc"
hi["@define"] = "Define"
hi["@operator"] = "TSOperator"
hi["@punctuation.delimiter"] = "TSPunctDelimiter"
hi["@punctuation.bracket"] = "TSPunctBracket"
hi["@punctuation.special"] = "TSPunctSpecial"
hi["@string"] = "TSString"
hi["@string.regex"] = "TSStringRegex"
hi["@string.escape"] = "TSStringEscape"
hi["@string.special"] = "SpecialChar"
hi["@character"] = "TSCharacter"
hi["@character.special"] = "SpecialChar"
hi["@boolean"] = "TSBoolean"
hi["@number"] = "TSNumber"
hi["@float"] = "TSFloat"
hi["@function"] = "TSFunction"
hi["@function.call"] = "TSFunction"
hi["@function.builtin"] = "TSFuncBuiltin"
hi["@function.macro"] = "TSFuncMacro"
hi["@method"] = "TSMethod"
hi["@method.call"] = "TSMethod"
hi["@constructor"] = "TSConstructor"
hi["@parameter"] = "TSParameter"
hi["@keyword"] = "TSKeyword"
hi["@keyword.function"] = "TSKeywordFunction"
hi["@keyword.operator"] = "TSKeywordOperator"
hi["@keyword.return"] = "TSKeyword"
hi["@conditional"] = "TSConditional"
hi["@repeat"] = "TSRepeat"
hi["@debug"] = "Debug"
hi["@label"] = "TSLabel"
hi["@include"] = "TSInclude"
hi["@exception"] = "TSException"
hi["@type"] = "TSType"
hi["@type.builtin"] = "TSTypeBuiltin"
hi["@type.qualifier"] = "TSKeyword"
hi["@type.definition"] = "TSType"
hi["@storageclass"] = "StorageClass"
hi["@attribute"] = "TSAttribute"
hi["@field"] = "TSField"
hi["@property"] = "TSProperty"
hi["@variable"] = "TSVariable"
hi["@variable.builtin"] = "TSVariableBuiltin"
hi["@constant"] = "TSConstant"
hi["@constant.builtin"] = "TSConstant"
hi["@constant.macro"] = "TSConstant"
hi["@namespace"] = "TSNamespace"
hi["@symbol"] = "TSSymbol"
hi["@text"] = "TSText"
hi["@text.diff.add"] = "DiffAdd"
hi["@text.diff.delete"] = "DiffDelete"
hi["@text.strong"] = "TSStrong"
hi["@text.emphasis"] = "TSEmphasis"
hi["@text.underline"] = "TSUnderline"
hi["@text.strike"] = "TSStrike"
hi["@text.title"] = "TSTitle"
hi["@text.literal"] = "TSLiteral"
hi["@text.uri"] = "TSUri"
hi["@text.math"] = "Number"
hi["@text.environment"] = "Macro"
hi["@text.environment.name"] = "Type"
hi["@text.reference"] = "TSParameterReference"
hi["@text.todo"] = "Todo"
hi["@text.note"] = "Tag"
hi["@text.warning"] = "DiagnosticWarn"
hi["@text.danger"] = "DiagnosticError"
hi["@tag"] = "TSTag"
hi["@tag.attribute"] = "TSAttribute"
hi["@tag.delimiter"] = "TSTagDelimiter"

hi["@function.method"] = "@method"
hi["@function.method.call"] = "@method.call"
hi["@comment.error"] = "@text.danger"
hi["@comment.warning"] = "@text.warning"
hi["@comment.hint"] = "DiagnosticHint"
hi["@comment.info"] = "DiagnosticInfo"
hi["@comment.todo"] = "@text.todo"
hi["@diff.plus"] = "@text.diff.add"
hi["@diff.minus"] = "@text.diff.delete"
hi["@diff.delta"] = "DiffChange"
hi["@string.special.url"] = "@text.uri"
hi["@keyword.directive"] = "@preproc"
hi["@keyword.directive.define"] = "@define"
hi["@keyword.storage"] = "@storageclass"
hi["@keyword.conditional"] = "@conditional"
hi["@keyword.debug"] = "@debug"
hi["@keyword.exception"] = "@exception"
hi["@keyword.import"] = "@include"
hi["@keyword.repeat"] = "@repeat"
hi["@variable.parameter"] = "@parameter"
hi["@variable.member"] = "@field"
hi["@module"] = "@namespace"
hi["@number.float"] = "@float"
hi["@string.special.symbol"] = "@symbol"
hi["@string.regexp"] = "@string.regex"
hi["@markup.strong"] = "@text.strong"
hi["@markup.italic"] = "@text.italic"
hi["@markup.link"] = "@text.link"
hi["@markup.strikethrough"] = "@text.strikethrough"
hi["@markup.heading"] = "@text.title"
hi["@markup.raw"] = "@text.literal"
hi["@markup.link"] = "@text.reference"
hi["@markup.link.url"] = "@text.uri"
hi["@markup.link.label"] = "@string.special"
hi["@markup.list"] = "@punctuation.special"

hi.NvimInternalError =
{ guifg = c.base00, guibg = c.base08, gui = "none", guisp = nil, ctermfg = c.cterm00, ctermbg = c.cterm08 }

hi.NormalFloat =
{ guifg = c.base03, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm00 }
-- { guifg = c.base05, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm00 }
hi.FloatBorder =
{ guifg = c.base0D, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = c.cterm00 }
-- { guifg = c.base05, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm00 }
hi.NormalNC = { guifg = c.base05, guibg = c.base00, gui = nil, guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm00 }
hi.TermCursor =
{ guifg = c.base00, guibg = c.base05, gui = "none", guisp = nil, ctermfg = c.cterm00, ctermbg = c.cterm05 }
hi.TermCursorNC =
{ guifg = c.base00, guibg = c.base05, gui = nil, guisp = nil, ctermfg = c.cterm00, ctermbg = c.cterm05 }

hi.User1 = { guifg = c.base08, guibg = c.base02, gui = "none", guisp = nil, ctermfg = c.cterm08, ctermbg = c.cterm02 }
hi.User2 = { guifg = c.base0E, guibg = c.base02, gui = "none", guisp = nil, ctermfg = c.cterm0E, ctermbg = c.cterm02 }
hi.User3 = { guifg = c.base05, guibg = c.base02, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm02 }
hi.User4 = { guifg = c.base0C, guibg = c.base02, gui = "none", guisp = nil, ctermfg = c.cterm0C, ctermbg = c.cterm02 }
hi.User5 = { guifg = c.base05, guibg = c.base02, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm02 }
hi.User6 = { guifg = c.base05, guibg = c.base01, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm01 }
hi.User7 = { guifg = c.base05, guibg = c.base02, gui = "none", guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm02 }
hi.User8 = { guifg = c.base00, guibg = c.base02, gui = "none", guisp = nil, ctermfg = c.cterm00, ctermbg = c.cterm02 }
hi.User9 = { guifg = c.base00, guibg = c.base02, gui = "none", guisp = nil, ctermfg = c.cterm00, ctermbg = c.cterm02 }

hi.TreesitterContext =
{ guifg = nil, guibg = c.base01, gui = "italic", guisp = nil, ctermfg = nil, ctermbg = c.cterm01 }

hi.TelescopeBorder = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil }
hi.TelescopePromptBorder = { guifg = c.base0A, guibg = c.base00, gui = nil, guisp = nil }
hi.TelescopePromptNormal = { guifg = c.base05, guibg = c.base00, gui = nil, guisp = nil }
hi.TelescopePromptPrefix = { guifg = c.base05, guibg = c.base00, gui = nil, guisp = nil }
hi.TelescopeNormal = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil }
hi.TelescopePreviewTitle = { guifg = c.base05, guibg = c.base00, gui = nil, guisp = nil }
hi.TelescopePromptTitle = { guifg = c.base05, guibg = c.base00, gui = nil, guisp = nil }
hi.TelescopeResultsTitle = { guifg = c.base05, guibg = c.base00, gui = nil, guisp = nil }
hi.TelescopeSelection = { guifg = nil, guibg = c.base01, gui = nil, guisp = nil }
hi.TelescopePreviewLine = { guifg = nil, guibg = c.base01, gui = "none", guisp = nil }

hi.CmpDocumentationBorder =
{ guifg = c.base05, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm00 }
hi.CmpDocumentation =
{ guifg = c.base05, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm00 }
hi.CmpItemAbbr = { guifg = c.base05, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm05, ctermbg = c.cterm01 }
hi.CmpItemAbbrDeprecated =
{ guifg = c.base03, guibg = nil, gui = "strikethrough", guisp = nil, ctermfg = c.cterm03, ctermbg = nil }
hi.CmpItemAbbrMatch = { guifg = c.base0D, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.CmpItemAbbrMatchFuzzy = { guifg = c.base0D, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.CmpItemKindDefault = { guifg = c.base05, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm05, ctermbg = nil }
hi.CmpItemMenu = { guifg = c.base04, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm04, ctermbg = nil }
hi.CmpItemKindKeyword = { guifg = c.base0E, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0E, ctermbg = nil }
hi.CmpItemKindVariable = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.CmpItemKindConstant = { guifg = c.base09, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.CmpItemKindReference = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.CmpItemKindValue = { guifg = c.base09, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm09, ctermbg = nil }
hi.CmpItemKindFunction = { guifg = c.base0D, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.CmpItemKindMethod = { guifg = c.base0D, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.CmpItemKindConstructor =
{ guifg = c.base0D, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0D, ctermbg = nil }
hi.CmpItemKindClass = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.CmpItemKindInterface = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.CmpItemKindStruct = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.CmpItemKindEvent = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.CmpItemKindEnum = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.CmpItemKindUnit = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.CmpItemKindModule = { guifg = c.base05, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm05, ctermbg = nil }
hi.CmpItemKindProperty = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.CmpItemKindField = { guifg = c.base08, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm08, ctermbg = nil }
hi.CmpItemKindTypeParameter =
{ guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.CmpItemKindEnumMember = { guifg = c.base0A, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm0A, ctermbg = nil }
hi.CmpItemKindOperator = { guifg = c.base05, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm05, ctermbg = nil }
hi.CmpItemKindSnippet = { guifg = c.base04, guibg = nil, gui = nil, guisp = nil, ctermfg = c.cterm04, ctermbg = nil }

-- lep semantic
--
-- hi["@class"] = "TSType"
-- hi["@struct"] = "TSType"
-- hi["@enum"] = "TSType"
-- hi["@enumMember"] = "Constant"
-- hi["@event"] = "Identifier"
-- hi["@interface"] = "Structure"
-- hi["@modifier"] = "Identifier"
-- hi["@regexp"] = "TSStringRegex"
-- hi["@typeParameter"] = "Type"
-- hi["@decorator"] = "Identifier"

hi.DapUINormal = "Normal"
hi.DapUINormal = "Normal"
hi.DapUIVariable = "Normal"
hi.DapUIScope = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIType = { guifg = c.base0E, ctermfg = c.cterm0E }
hi.DapUIValue = "Normal"
hi.DapUIModifiedValue = { gui = "bold", guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIDecoration = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIThread = { guifg = c.base0B, ctermfg = c.cterm0B }
hi.DapUIStoppedThread = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIFrameName = "Normal"
hi.DapUISource = { guifg = c.base0E, ctermfg = c.cterm0E }
hi.DapUILineNumber = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIFloatNormal = "NormalFloat"
hi.DapUIFloatBorder = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIWatchesEmpty = { guifg = c.base08, ctermfg = c.cterm08 }
hi.DapUIWatchesValue = { guifg = c.base0B, ctermfg = c.cterm0B }
hi.DapUIWatchesError = { guifg = c.base08, ctermfg = c.cterm08 }
hi.DapUIBreakpointsPath = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIBreakpointsInfo = { guifg = c.base0B, ctermfg = c.cterm0B }
hi.DapUIBreakpointsCurrentLine = { gui = "bold", guifg = c.base0B, ctermfg = c.cterm0B }
hi.DapUIBreakpointsLine = "DapUILineNumber"
hi.DapUIBreakpointsDisabledLine = { guifg = c.base02, ctermfg = c.cterm02 }
hi.DapUICurrentFrameName = "DapUIBreakpointsCurrentLine"
hi.DapUIStepOver = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIStepInto = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIStepBack = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIStepOut = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIStop = { guifg = c.base08, ctermfg = c.cterm08 }
hi.DapUIPlayPause = { guifg = c.base0B, ctermfg = c.cterm0B }
hi.DapUIRestart = { guifg = c.base0B, ctermfg = c.cterm0B }
hi.DapUIUnavailable = { guifg = c.base02, ctermfg = c.cterm02 }
hi.DapUIWinSelect = { gui = "bold", guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIEndofBuffer = "EndOfBuffer"
hi.DapUINormalNC = "Normal"
hi.DapUIPlayPauseNC = { guifg = c.base0B, ctermfg = c.cterm0B }
hi.DapUIRestartNC = { guifg = c.base0B, ctermfg = c.cterm0B }
hi.DapUIStopNC = { guifg = c.base08, ctermfg = c.cterm08 }
hi.DapUIUnavailableNC = { guifg = c.base02, ctermfg = c.cterm02 }
hi.DapUIStepOverNC = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIStepIntoNC = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIStepBackNC = { guifg = c.base0D, ctermfg = c.cterm0D }
hi.DapUIStepOutNC = { guifg = c.base0D, ctermfg = c.cterm0D }
