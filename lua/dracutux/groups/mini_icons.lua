local M = {}

M.url = "https://github.com/echasnovski/mini.icons"

---@type dracutux.HighlightsFn
function M.get(c)
	return {
		MiniIconsAzure = "MiniIconsCyan",
		MiniIconsBlue = { fg = c.blue },
		MiniIconsCyan = { fg = c.cyan },
		MiniIconsGreen = { fg = c.green },
		MiniIconsGrey = { fg = c.subtle_text },
		MiniIconsOrange = { fg = c.orange },
		MiniIconsPurple = { fg = c.purple },
		MiniIconsRed = { fg = c.red },
		MiniIconsYellow = { fg = c.yellow },
	}
end

return M
