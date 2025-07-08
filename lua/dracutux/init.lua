local M = {}

---@param opts? dracutux.Config
function M.load(opts)
	opts = require("dracutux.config").extend(opts)

	local bg = vim.o.background
	local style_bg = opts.style == "day" and "light" or "dark"
	local colors_name = require("dracutux.util").get_style_name(opts)
	if bg ~= style_bg then
		if vim.g.colors_name == colors_name then
			opts.style = bg == "light" and "day" or "default"
		else
			vim.o.background = style_bg
		end
	end

	return require("dracutux.theme").setup(opts)
end

M.setup = require("dracutux.config").setup

return M
