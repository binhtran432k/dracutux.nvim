local M = {}

---@param p dracutux.Palete
---@return string[]
function M.headings(p)
	return { p.purple, p.pink, p.orange, p.yellow, p.green, p.cyan }
end

---@type dracutux.HighlightsFn
function M.get(p)
	local ret = {
		["@constant.macro"] = "Define",
		["@constructor"] = { fg = p.cyan }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.

		["@function.macro"] = "Macro",

		["@markup.strong"] = { fg = p.orange, bold = true },
		["@markup.italic"] = { fg = p.yellow, italic = true },

		["@markup.link"] = { fg = p.blue },
		["@markup.link.label"] = { fg = p.pink },
		["@markup.link.url"] = { fg = p.blue, underline = true },

		["@markup.raw"] = "String",

		["@markup.list"] = { fg = p.teal }, -- For special punctutation that does not fall in the catagories before.
		["@markup.list.checked"] = { fg = p.green }, -- For brackets and parens.
		["@markup.list.unchecked"] = { fg = p.cyan }, -- For brackets and parens.

		["@module"] = { fg = p.purple }, -- modules or namespace
		["@module.builtin"] = { fg = p.purple, italic = true }, -- built-in modules or namespaces

		["@property"] = { fg = p.teal },

		["@string.escape"] = { fg = p.cyan }, -- For escape characters within a string.
		["@string.regexp"] = { fg = p.red }, -- For regexes.

		["@tag.attribute"] = { fg = p.teal, italic = true },
		["@tag.delimiter"] = "Delimiter",

		["@type.builtin"] = { fg = p.cyan, italic = true },

		["@variable"] = { fg = p.text }, -- Any variable name that does not have another highlight.
		["@variable.member"] = { fg = p.teal }, -- For fields.
		["@variable.parameter"] = { fg = p.orange, italic = true }, -- For parameters of a function.

		["@attribute.builtin"] = { fg = p.purple, italic = true },
		["@constant.builtin"] = "@constant",
		["@function.builtin"] = { fg = p.green, italic = true },
		["@tag.builtin"] = "@tag",
		["@variable.builtin"] = { fg = p.purple, italic = true }, -- Variable names that are defined by the languages, like `this` or `self`.
		["@variable.parameter.builtin"] = "@variable.parameter", -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
	}
	for i, color in ipairs(M.headings(p)) do
		ret["@markup.heading." .. i] = { fg = color, bold = true }
	end
	return ret
end

return M
