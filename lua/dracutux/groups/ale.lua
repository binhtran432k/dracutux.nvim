local M = {}

M.url = "https://github.com/dense-analysis/ale"

---@type dracutux.HighlightsFn
function M.get(c)
	return {
		ALEErrorSign = { fg = c.red },
		ALEWarningSign = { fg = c.yellow },
	}
end

return M
