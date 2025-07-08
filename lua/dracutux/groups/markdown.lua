local util = require("dracutux.util")

local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

---@type dracutux.HighlightsFn
function M.get(p)
	local ret = {
		RenderMarkdownBullet = { fg = p.orange }, -- horizontal rule
		RenderMarkdownCode = { bg = p.ui_base },
		RenderMarkdownDash = { fg = p.orange }, -- horizontal rule
		RenderMarkdownTableHead = { fg = p.red },
		RenderMarkdownTableRow = { fg = p.orange },
		RenderMarkdownCodeInline = { fg = p.green, bg = p.ui_base },
	}
	for i, color in ipairs(require("dracutux.groups.treesitter").headings(p)) do
		ret["RenderMarkdownH" .. i .. "Bg"] = { bg = util.blend(color, p.base, 0.1) }
		ret["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = true }
	end
	return ret
end

return M
