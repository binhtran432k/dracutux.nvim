local util = require("dracutux.util")

local M = {}

---@param style dracutux.Style
---@return dracutux.Palete
local function get_palette(style)
  return util.mod("dracutux.palette." .. style)
end

---@param opts? dracutux.Config
---@return dracutux.Palete, dracutux.Config
function M.setup(opts)
  opts = require("dracutux.config").extend(opts)
  local palette = get_palette(opts.style)
  opts.on_palette(palette)
  return palette, opts
end

return M
