local util = require("dracutux.util")

local M = {}

---@type dracutux.HighlightsFn
function M.get(p)
  ---@type dracutux.Highlights
  return {
    Normal = { fg = p.text, bg = p.base },

    -- UI
    Added = { fg = p.green },
    Changed = { fg = p.cyan },
    ColorColumn = { bg = p.ui_base },
    Conceal = { fg = p.ui_selection },
    CursorColumn = { bg = p.ui_base },
    CursorLine = { bg = p.ui_base },
    DiffAdd = { fg = p.ui_base, bg = p.green },
    DiffChange = { fg = p.ui_base, bg = p.cyan },
    DiffDelete = { fg = p.red, bold = true },
    DiffText = { fg = p.ui_base, bg = p.comment },
    Directory = { fg = p.purple },
    ErrorMsg = { fg = p.red },
    FloatBorder = { fg = p.purple, bg = p.ui_base },
    FloatShadow = { bg = p.comment, blend = 80 },
    FloatShadowThrough = { bg = p.comment, blend = 100 },
    FloatTitle = { fg = p.subtle_text, bg = p.ui_base, bold = true },
    Folded = { fg = p.comment, bg = p.ui_base },
    LineNr = { fg = util.blend(p.comment, p.base, 0.7) },
    MatchParen = { fg = p.orange, bold = true },
    ModeMsg = { fg = p.subtle_text, bold = true },
    MoreMsg = { fg = p.purple },
    NonText = { fg = p.ui_selection },
    NormalFloat = { fg = p.text, bg = p.ui_base },
    Pmenu = { bg = p.ui_base },
    PmenuSel = { bg = p.base, bold = true },
    PmenuThumb = { bg = p.ui_selection },
    Question = { fg = p.cyan },
    QuickFixLine = { fg = p.cyan },
    RedrawDebugClear = { bg = p.yellow },
    RedrawDebugComposed = { bg = p.green },
    RedrawDebugRecompose = { bg = p.red },
    Removed = { fg = p.red },
    SignColumn = { fg = p.comment },
    SpecialKey = { fg = p.comment },
    SpellBad = { sp = p.red, undercurl = true },
    SpellCap = { sp = p.yellow, undercurl = true },
    SpellLocal = { sp = p.green, undercurl = true },
    SpellRare = { sp = p.cyan, undercurl = true },
    StatusLine = { fg = p.subtle_text, bg = p.ui_base },
    StatusLineNC = { fg = p.comment, bg = p.ui_base },
    Title = { fg = p.subtle_text, bold = true },
    Visual = { bg = p.selection },
    WarningMsg = { fg = p.yellow },
    WinBar = { fg = p.subtle_text, bg = p.ui_base, bold = true },
    WinBarNC = { fg = p.subtle_text, bg = p.ui_base },
    WinSeparator = { fg = p.ui_base },

    CurSearch = { fg = p.ui_base, bg = p.orange },
    Search = { fg = p.ui_base, bg = p.blue },

    -- Syntax
    Constant = { fg = p.purple },
    Operator = { fg = p.pink },
    PreProc = { fg = p.purple },
    Type = { fg = p.cyan },
    Delimiter = { fg = p.blue },

    Comment = { fg = p.comment, italic = true },
    String = { fg = p.yellow },
    Identifier = { fg = p.text },
    Function = { fg = p.green },
    Statement = { fg = p.pink },
    Label = { fg = p.cyan },
    Keyword = { fg = p.pink, italic = true },
    Special = { fg = p.blue },
    Tag = { fg = p.pink },
    Error = { fg = p.red },
    Todo = { fg = p.cyan },

    -- Diagnostic
    DiagnosticError = { fg = p.red },
    DiagnosticWarn = { fg = p.yellow },
    DiagnosticInfo = { fg = p.cyan },
    DiagnosticHint = { fg = p.teal },
    DiagnosticOk = { fg = p.green },
    DiagnosticDeprecated = { sp = p.comment, strikethrough = true },

    DiagnosticVirtualTextError = { fg = p.red, bg = util.blend(p.red, p.base, 0.1) },
    DiagnosticVirtualTextWarn = { fg = p.yellow, bg = util.blend(p.yellow, p.base, 0.1) },
    DiagnosticVirtualTextInfo = { fg = p.cyan, bg = util.blend(p.cyan, p.base, 0.1) },
    DiagnosticVirtualTextHint = { fg = p.teal, bg = util.blend(p.teal, p.base, 0.1) },
    DiagnosticVirtualTextOk = { fg = p.green, bg = util.blend(p.green, p.base, 0.1) },

    DiagnosticUnderlineError = { sp = p.red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = p.yellow, undercurl = true },
    DiagnosticUnderlineInfo = { sp = p.cyan, undercurl = true },
    DiagnosticUnderlineHint = { sp = p.teal, undercurl = true },
    DiagnosticUnderlineOk = { sp = p.green, undercurl = true },

    -- LSP
    LspReferenceText = { bg = p.ui_selection },

    LspSignatureActiveParameter = { bg = util.blend(p.ui_selection, p.base, 0.4), bold = true },
    LspInlayHint = { fg = p.ui_selection, bg = p.ui_base },
    LspCodeLens = "LspInlayHint",
  }
end

return M
