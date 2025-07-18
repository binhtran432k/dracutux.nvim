local M = {}

M.url = "https://github.com/echasnovski/mini.hipatterns"

---@type DraculaHighlightsFn
function M.get(c)
	return {
		MiniHipatternsFixme = { fg = c.black, bg = c.error, bold = true },
		MiniHipatternsHack = { fg = c.black, bg = c.warning, bold = true },
		MiniHipatternsNote = { fg = c.black, bg = c.hint, bold = true },
		MiniHipatternsTodo = { fg = c.black, bg = c.info, bold = true },
	}
end

return M
