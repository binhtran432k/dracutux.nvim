local config = require("dracutux.config")
local util = require("dracutux.util")

local M = {}

---@type table<string, string[]>
M.plugins = {
  ["blink.cmp"] = { "blink" },
  ["bufferline.nvim"] = { "bufferline" },
  ["flash.nvim"] = { "flash" },
  ["lazy.nvim"] = { "lazy" },
  ["lualine.nvim"] = { "lualine" },
  ["mason.nvim"] = { "mason" },
  ["mini.icons"] = { "mini_icons" },
  ["mini.nvim"] = { "mini_icons" },
  ["noice.nvim"] = { "noice" },
  ["rainbow-delimiters.nvim"] = { "rainbow" },
  ["snacks.nvim"] = { "snacks" },
  ["render-markdown.nvim"] = { "markdown" },
}

---@param name string
---@return {get: dracutux.HighlightsFn, url: string}
function M.get_group(name)
  return util.mod("dracutux.groups." .. name)
end

---@param name string
---@param palette dracutux.Palete
---@param opts dracutux.Config
function M.get(name, palette, opts)
  local mod = M.get_group(name)
  return mod.get(palette, opts)
end

---@param palette dracutux.Palete
---@param opts dracutux.Config
function M.setup(palette, opts)
  local groups = {
    base = true,
    kinds = true,
    semantic_tokens = true,
    treesitter = true,
  }

  if opts.plugins_all then
    for _, group in pairs(M.plugins) do
      groups[group] = true
    end
  elseif opts.plugins_auto and package.loaded.lazy then
    local plugins = require("lazy.core.config").plugins
    for plugin, plugin_groups in pairs(M.plugins) do
      if plugins[plugin] then
        for _, group in ipairs(plugin_groups) do
          groups[group] = true
        end
      end
    end
  end

  -- manually enable/disable plugins
  for plugin, group in pairs(M.plugins) do
    local use = opts.plugins[group]
    use = use == nil and opts.plugins[plugin] or use
    if use ~= nil then
      if type(use) == "table" then
        use = use.enabled
      end
      groups[group] = use or nil
    end
  end

  local names = vim.tbl_keys(groups)
  table.sort(names)

  ---@type string
  local cache_key = util.get_style_name(opts)
  local cache = opts.cache and util.cache.read(cache_key)

  local inputs = {
    palette = palette,
    plugins = names,
    version = config.version,
  }

  ---@type dracutux.Highlights|false|nil
  local ret = cache and vim.deep_equal(inputs, cache.inputs) and cache.groups

  if not cache then
    util.cache.clear()
  end

  if not ret then
    ret = {}
    -- merge highlights
    for group in pairs(groups) do
      for k, v in pairs(M.get(group, palette, opts)) do
        ret[k] = v
      end
    end
    if opts.cache then
      util.cache.write(cache_key, { groups = ret, inputs = inputs })
    end
  end

  opts.on_highlights(ret --[[@as dracutux.Highlights]], palette)

  return ret, groups
end

return M
