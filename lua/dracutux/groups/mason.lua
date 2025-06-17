local M = {}

M.url = "https://github.com/williamboman/mason.nvim"

---@type dracutux.HighlightsFn
function M.get(p)
  return {
    MasonHeader = { fg = p.ui_base, bg = p.pink },
    MasonHighlight = { fg = p.purple },
    MasonHighlightBlock = { fg = p.ui_base, bg = p.purple },
    MasonHighlightBlockBold = { fg = p.ui_base, bg = p.purple, bold = true },
    MasonMutedBlock = { bg = p.ui_selection },
    MasonMutedBlockBold = { bg = p.ui_selection, bold = true },
    MasonHeaderSecondary = { fg = p.ui_base, bg = p.purple, bold = true },
    MasonHighlightSecondary = { fg = p.pink },
    MasonHighlightBlockSecondary = { fg = p.ui_base, bg = p.pink },
    MasonHighlightBlockBoldSecondary = { fg = p.ui_base, bg = p.pink, bold = true },
  }
end

return M
