local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type dracutux.HighlightsFn
function M.get(c)
  return {
    LazyButtonActive = { bg = c.ui_selection },
    LazyH1 = { fg = c.ui_base, bg = c.pink },
    LazyProgressDone = { bold = true, fg = c.pink },
    LazyProgressTodo = { bold = true, fg = c.subtle_text },
  }
end

return M
