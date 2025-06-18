local M = {}

M.url = "https://github.com/echasnovski/mini.surround"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    MiniSurround = { bg = c.orange, fg = c.black },
  }
end

return M
