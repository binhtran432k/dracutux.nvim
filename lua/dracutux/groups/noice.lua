local M = {}

M.url = "https://github.com/folke/noice.nvim"

---@type dracutux.HighlightsFn
function M.get(c)
	local ret = {
		NoiceCmdlineIconLua = { fg = c.cyan },
		NoiceCmdlinePopupBorderLua = "NoiceCmdlineIconLua",
		NoiceCmdlinePopupTitleLua = "NoiceCmdlineIconLua",

		NoiceCmdlineIconInput = { fg = c.yellow },
		NoiceCmdlinePopupBorderInput = "NoiceCmdlineIconInput",
		NoiceCmdlinePopupTitleInput = "NoiceCmdlineIconLua",

		NoicePopupmenuSelected = { bg = c.ui_selection, bold = true },

		NoiceCompletionItemKindDefault = { fg = c.subtle_text },
	}
	require("dracutux.groups.kinds").kinds(ret, "NoiceCompletionItemKind%s")
	return ret
end

return M
