local util = require("dracutux.util")

local M = {}

M.url = "https://github.com/folke/snacks.nvim"

---@type dracutux.HighlightsFn
function M.get(p)
  ---@type dracutux.Highlights
  local ret = {
    -- Notifier
    SnacksNotifierDebug = { fg = p.text, bg = p.ui_base },
    SnacksNotifierBorderDebug = { fg = util.blend(p.comment, p.base, 0.4), bg = p.ui_base },
    SnacksNotifierIconDebug = { fg = p.comment },
    SnacksNotifierTitleDebug = { fg = p.comment, bg = p.ui_base },
    SnacksNotifierError = { fg = p.text, bg = p.ui_base },
    SnacksNotifierBorderError = { fg = util.blend(p.red, p.base, 0.4), bg = p.ui_base },
    SnacksNotifierIconError = { fg = p.red },
    SnacksNotifierTitleError = { fg = p.red, bg = p.ui_base },
    SnacksNotifierInfo = { fg = p.text, bg = p.ui_base },
    SnacksNotifierBorderInfo = { fg = util.blend(p.cyan, p.base, 0.4), bg = p.ui_base },
    SnacksNotifierIconInfo = { fg = p.cyan },
    SnacksNotifierTitleInfo = { fg = p.cyan, bg = p.ui_base },
    SnacksNotifierTrace = { fg = p.text, bg = p.ui_base },
    SnacksNotifierBorderTrace = { fg = util.blend(p.purple, p.base, 0.4), bg = p.ui_base },
    SnacksNotifierIconTrace = { fg = p.purple },
    SnacksNotifierTitleTrace = { fg = p.purple, bg = p.ui_base },
    SnacksNotifierWarn = { fg = p.text, bg = p.ui_base },
    SnacksNotifierBorderWarn = { fg = util.blend(p.yellow, p.base, 0.4), bg = p.ui_base },
    SnacksNotifierIconWarn = { fg = p.yellow },
    SnacksNotifierTitleWarn = { fg = p.yellow, bg = p.ui_base },
    -- Dashboard
    SnacksDashboardDesc = { fg = p.teal },
    SnacksDashboardFooter = { fg = p.purple },
    SnacksDashboardHeader = { fg = p.purple },
    SnacksDashboardIcon = { fg = p.purple },
    SnacksDashboardKey = { fg = p.pink },
    SnacksDashboardSpecial = { fg = p.green },
    SnacksDashboardDir = { fg = p.purple },
    -- Picker
    SnacksPickerCursorLine = "PmenuSel",
    SnacksPickerListCursorLine = "SnacksPickerCursorLine",
    SnacksPickerPreviewCursorLine = "SnacksPickerCursorLine",
    -- Indent
    SnacksIndentScope = { fg = p.purple },
  }

  for i, color in ipairs(require("dracutux.groups.rainbow").get_rainbows(p)) do
    ret["SnacksIndent" .. i] = { fg = color, nocombine = true }
  end

  return ret
end

return M
