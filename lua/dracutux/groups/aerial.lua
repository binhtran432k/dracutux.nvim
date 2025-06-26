local M = {}

M.url = "https://github.com/stevearc/aerial.nvim"

---@type dracutux.HighlightsFn
function M.get(c)
  local ret = {
    AerialNormal = { fg = c.text, bg = "NONE" },
    AerialGuide = { fg = c.subtle_text },
    AerialLine = "LspInlayHint",
  }
  require("dracula.groups.kinds").kinds(ret, "Aerial%sIcon")
  return ret
end

return M
