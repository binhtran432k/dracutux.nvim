local M = {}

M.version = "0.0.0"

---@type dracutux.Config
M.defaults = {
  -- The theme comes in three styles, `default`, `soft`, and `day`
  style = "default",
  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  on_palette = function() end,
  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  on_highlights = function() end,
  -- When set to true, the theme will be cached for better performance
  cache = true,
  -- uses your plugin manager to automatically enable needed plugins
  -- currently only lazy.nvim is supported
  plugins_auto = true,
  -- enable all plugins when not using lazy.nvim
  -- set to false to manually enable/disable plugins
  plugins_all = package.loaded.lazy == nil,
  -- add any plugins here that you want to enable
  -- for all possible plugins, see:
  --   * https://github.com/binhtran432k/dracutux.nvim/tree/main/lua/dracutux/groups
  plugins = {
    -- telescope = true,
  },
}

---@type dracutux.Config
M.options = {}

---@param opts? dracutux.Config
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

---@generic T : dracutux.Config
---@param opts? T
---@return T
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

return M
