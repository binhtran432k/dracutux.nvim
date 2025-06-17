local M = {}

M.url = "https://github.com/akinsho/bufferline.nvim"

---@type dracutux.HighlightsFn
function M.get(p)
  return {
    BufferLineBackground = { bg = p.ui_base },
    BufferLineFill = "BufferLineBackground",

    BufferLineBuffer = { fg = p.comment, bg = p.ui_base },
    BufferLineBufferVisible = "BufferLineBuffer",
    BufferLineBufferSelected = { fg = p.text, bg = p.base, bold = true },

    BufferLineTab = "BufferLineBuffer",
    BufferLineTabSelected = "BufferLineBufferSelected",

    BufferLineDuplicate = { fg = p.subtle_text, bg = p.ui_base, bold = true },
    BufferLineDuplicateVisible = "BufferLineDuplicate",
    BufferLineDuplicateSelected = "BufferLineBufferSelected",

    BufferLineCloseButton = "BufferLineTab",
    BufferLineCloseButtonVisible = "BufferLineCloseButton",

    BufferLineTabClose = "BufferLineTab",

    BufferLineSeparator = { fg = p.ui_base, bg = p.ui_base },
    BufferLineSeparatorVisible = "BufferLineSeparator",
    BufferLineSeparatorSelected = { fg = p.ui_base, bg = p.base },

    BufferLineTabSeparator = "BufferLineSeparator",
    BufferLineTabSeparatorVisible = "BufferLineSeparatorVisible",
    BufferLineTabSeparatorSelected = "BufferLineSeparatorSelected",

    BufferLineIndicatorSelected = { fg = p.purple, bg = p.base },

    BufferLineError = "BufferLineBuffer",
    BufferLineErrorVisible = "BufferLineError",
    BufferLineErrorSelected = { fg = p.red, bg = p.base, bold = true },
    BufferLineErrorDiagnostic = "BufferLineError",
    BufferLineErrorDiagnosticVisible = "BufferLineErrorVisible",
    BufferLineErrorDiagnosticSelected = "BufferLineErrorSelected",

    BufferLineWarning = "BufferLineBuffer",
    BufferLineWarningVisible = "BufferLineWarning",
    BufferLineWarningSelected = { fg = p.yellow, bg = p.base, bold = true },
    BufferLineWarningDiagnostic = "BufferLineWarning",
    BufferLineWarningDiagnosticVisible = "BufferLineWarningVisible",
    BufferLineWarningDiagnosticSelected = "BufferLineWarningSelected",

    BufferLineInfo = "BufferLineBuffer",
    BufferLineInfoVisible = "BufferLineInfo",
    BufferLineInfoSelected = { fg = p.cyan, bg = p.base, bold = true },
    BufferLineInfoDiagnostic = "BufferLineInfo",
    BufferLineInfoDiagnosticVisible = "BufferLineInfoVisible",
    BufferLineInfoDiagnosticSelected = "BufferLineInfoSelected",

    BufferLineHint = "BufferLineBuffer",
    BufferLineHintVisible = "BufferLineHint",
    BufferLineHintSelected = { fg = p.teal, bg = p.base, bold = true },
    BufferLineHintDiagnostic = "BufferLineHint",
    BufferLineHintDiagnosticVisible = "BufferLineHintVisible",
    BufferLineHintDiagnosticSelected = "BufferLineHintSelected",

    BufferLineDiagnostic = "BufferLineBuffer",
    BufferLineDiagnosticVisible = "BufferLineDiagnostic",
    BufferLineDiagnosticSelected = "BufferLineDuplicate",

    BufferLineModified = { fg = p.cyan, bg = p.ui_base },
    BufferLineModifiedVisible = "BufferLineModified",
    BufferLineModifiedSelected = { fg = p.cyan, bg = p.base, bold = true },
  }
end

return M
