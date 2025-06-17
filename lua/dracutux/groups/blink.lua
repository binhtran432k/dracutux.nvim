local M = {}

M.url = "https://github.com/Saghen/blink.cmp"

---@type dracutux.HighlightsFn
function M.get(c)
  local ret = {
    BlinkCmpKindCodeium = { fg = c.teal },
    BlinkCmpKindCopilot = { fg = c.teal },
    BlinkCmpKindDefault = { fg = c.subtle_text },
    BlinkCmpKindSupermaven = { fg = c.teal },
    BlinkCmpKindTabNine = { fg = c.teal },

    BlinkCmpLabelDeprecated = "DiagnosticDeprecated",
    BlinkCmpLabelMatch = "Special",

    BlinkCmpDocBorder = "FloatBorder",
    BlinkCmpMenuBorder = { fg = c.subtle_text, bg = c.ui_base },
    BlinkCmpSignatureHelpBorder = "BlinkCmpDocBorder",
  }
  require("dracutux.groups.kinds").kinds(ret, "BlinkCmpKind%s")
  return ret
end

return M
