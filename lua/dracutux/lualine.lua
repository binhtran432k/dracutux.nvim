local M = {}

---@param style? dracutux.Style
function M.get(style)
	local palette = require("dracutux.palette").setup({ style = style })

	local hl = {}

	hl.normal = {
		a = { bg = palette.purple, fg = palette.ui_base },
		b = { bg = palette.ui_base, fg = palette.purple },
		c = { bg = palette.ui_base, fg = palette.purple },
	}

	hl.insert = {
		a = { bg = palette.green, fg = palette.ui_base },
		b = { bg = palette.ui_base, fg = palette.green },
	}

	hl.command = {
		a = { bg = palette.cyan, fg = palette.ui_base },
		b = { bg = palette.ui_base, fg = palette.cyan },
	}

	hl.visual = {
		a = { bg = palette.pink, fg = palette.ui_base },
		b = { bg = palette.ui_base, fg = palette.pink },
	}

	hl.replace = {
		a = { bg = palette.red, fg = palette.ui_base },
		b = { bg = palette.ui_base, fg = palette.red },
	}

	hl.terminal = {
		a = { bg = palette.yellow, fg = palette.ui_base },
		b = { bg = palette.ui_base, fg = palette.yellow },
	}

	hl.inactive = {
		a = { bg = palette.ui_base, fg = palette.purple },
		b = { bg = palette.ui_base, fg = palette.subtle_text, gui = "bold" },
		c = { bg = palette.ui_base, fg = palette.subtle_text },
	}

	return hl
end

return M
