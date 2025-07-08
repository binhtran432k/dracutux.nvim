local M = {}

---@type dracutux.HighlightsFn
function M.get(p)
	---@type dracutux.Highlights
	return {
		["@lsp.type.builtinType"] = "@type.builtin",
		["@lsp.type.deriveHelper"] = "@attribute",
		["@lsp.type.escapeSequence"] = "@string.escape",
		["@lsp.type.formatSpecifier"] = "@markup.list",
		["@lsp.type.generic"] = "@variable",
		["@lsp.type.lifetime"] = "@keyword.storage",
		["@lsp.type.variable"] = {},
		["@lsp.type.selfKeyword"] = "@variable.builtin",
		["@lsp.type.selfTypeKeyword"] = "@variable.builtin",
		["@lsp.type.unresolvedReference"] = { sp = p.red, undercurl = true },
		["@lsp.typemod.class.defaultLibrary"] = "@type.builtin",
		["@lsp.typemod.enum.defaultLibrary"] = "@type.builtin",
		["@lsp.typemod.enumMember.defaultLibrary"] = "@constant.builtin",
		["@lsp.typemod.function.defaultLibrary"] = "@function.builtin",
		["@lsp.typemod.keyword.async"] = "@keyword.coroutine",
		["@lsp.typemod.keyword.injected"] = "@keyword",
		["@lsp.typemod.macro.defaultLibrary"] = { fg = p.purple, italic = true },
		["@lsp.typemod.method.defaultLibrary"] = "@function.builtin",
		["@lsp.typemod.operator.injected"] = "@operator",
		["@lsp.typemod.string.injected"] = "@string",
		["@lsp.typemod.struct.defaultLibrary"] = "@type.builtin",
		["@lsp.typemod.variable.callable"] = "@function",
		["@lsp.typemod.variable.defaultLibrary"] = "@variable.builtin",
		["@lsp.typemod.variable.injected"] = "@variable",
		["@lsp.typemod.variable.readonly"] = "@constant",
		["@lsp.typemod.variable.static"] = "@constant",
	}
end

return M
