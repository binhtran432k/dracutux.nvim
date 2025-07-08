local M = {}

M.url = "https://github.com/nvim-lualine/lualine.nvim"

---@type dracutux.HighlightsFn
function M.get()
	---@type dracutux.Highlights
	return {
		LuaLineDiffAdd = "Added",
		LuaLineDiffChange = "Changed",
		LuaLineDiffDelete = "Removed",
	}
end

return M
