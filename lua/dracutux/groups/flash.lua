local M = {}

M.url = "https://github.com/folke/flash.nvim"

---@type dracutux.HighlightsFn
function M.get(p)
  return {
    FlashBackdrop = { fg = p.comment },
    FlashLabel = { fg = p.ui_base, bg = p.pink, bold = true },
  }
end

return M
