local uv = vim.uv

local M = {}

---@param c string
---@return [number, number, number]
local function rgb(c)
	c = string.lower(c)
	local ret = {}
	for i = 1, 3, 1 do
		ret[i] = tonumber(c:sub(i * 2, i * 2 + 1), 16)
	end
	return ret
end

local me = string.sub(debug.getinfo(1, "S").source, 2)
M.me = vim.fn.fnamemodify(me, ":h:h")

---@param opts dracutux.Config
function M.get_style_name(opts)
	if opts.style and opts.style ~= "default" then
		return "dracutux-" .. opts.style
	end
	return "dracutux"
end

---@param modname string
function M.mod(modname)
	if package.loaded[modname] then
		return package.loaded[modname]
	end
	local ret = loadfile(M.me .. "/" .. string.gsub(modname, "%.", "/") .. ".lua")()
	package.loaded[modname] = ret
	return ret
end

---@param color1 string color 1
---@param color2 string color 2
---@param ratio? number number between 0 and 1
function M.blend(color1, color2, ratio)
	ratio = ratio or 0.5

	if ratio == 0 then
		return color1
	elseif ratio == 1 then
		return color2
	end

	local c1 = rgb(color2)
	local c2 = rgb(color1)

	local color = {}
	for i = 1, 3, 1 do
		local c = ratio * c2[i] + ((1 - ratio) * c1[i])
		color[i] = math.floor(math.min(math.max(c, 0), 255) + 0.5)
	end

	return ("#%02x%02x%02x"):format(color[1], color[2], color[3])
end

---@param group string
function M.highlight(group, hl)
	if hl.style then
		if type(hl.style) == "table" then
			hl = vim.tbl_extend("force", hl, hl.style)
		elseif hl.style:lower() ~= "none" then
			-- handle old string style definitions
			for s in string.gmatch(hl.style, "([^,]+)") do
				hl[s] = true
			end
		end
		hl.style = nil
	end
	vim.api.nvim_set_hl(0, group, hl)
end

-- Simple string interpolation.
--
-- Example template: "${name} is ${value}"
--
---@param str string template string
---@param table table key value pairs to replace in the string
function M.template(str, table)
	return (
		string.gsub(str, "($%b{})", function(w)
			return vim.tbl_get(table, unpack(vim.split(w:sub(3, -2), ".", { plain = true }))) or w
		end)
	)
end

---@param file string
function M.read(file)
	local fd = assert(io.open(file, "r"))
	---@type string
	local data = fd:read("*a")
	fd:close()
	return data
end

---@param file string
---@param contents string
function M.write(file, contents)
	vim.fn.mkdir(vim.fn.fnamemodify(file, ":h"), "p")
	local fd = assert(io.open(file, "w+"))
	fd:write(contents)
	fd:close()
end

M.cache = {}

---@param key string
function M.cache.file(key)
	return vim.fn.stdpath("cache") .. "/" .. key .. ".json"
end

---@param key string
function M.cache.read(key)
	---@type boolean, dracutux.Cache
	local ok, ret = pcall(function()
		return vim.json.decode(M.read(M.cache.file(key)), {
			luanil = {
				object = true,
				array = true,
			},
		})
	end)
	return ok and ret or nil
end

---@param key string
---@param data dracutux.Cache
function M.cache.write(key, data)
	pcall(M.write, M.cache.file(key), vim.json.encode(data))
end

function M.cache.clear()
	for _, style in ipairs({ "default", "day", "soft" }) do
		uv.fs_unlink(M.cache.file(style))
	end
end

return M
