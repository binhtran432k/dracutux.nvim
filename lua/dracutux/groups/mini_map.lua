local M = {}

M.url = "https://github.com/echasnovski/mini.map"

---@type dracutux.HighlightsFn
function M.get()
	return {
		MiniMapNormal = "NormalFloat",
		MiniMapSymbolCount = "Special",
		MiniMapSymbolLine = "Title",
		MiniMapSymbolView = "Delimiter",
	}
end

return M
