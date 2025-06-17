local M = {}

---@param opts? dracutux.Config
function M.setup(opts)
  opts = require("dracutux.config").extend(opts)
  local palette = require("dracutux.palette").setup(opts)
  local groups = require("dracutux.groups").setup(palette, opts)

  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = require("dracutux.util").get_style_name(opts)

  for group, hl in pairs(groups) do
    hl = type(hl) == "string" and { link = hl } or hl
    vim.api.nvim_set_hl(0, group, hl --[[@as dracutux.Highlight]])
  end

  M.terminal(palette)

  return palette, groups, opts
end

---@param colors dracutux.Palete
function M.terminal(colors)
  -- dark
  vim.g.terminal_color_0 = colors.base
  vim.g.terminal_color_8 = colors.comment

  -- light
  vim.g.terminal_color_7 = colors.text
  vim.g.terminal_color_15 = colors.text

  -- colors
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = colors.red

  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = colors.teal

  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_11 = colors.orange

  vim.g.terminal_color_4 = colors.purple
  vim.g.terminal_color_12 = colors.purple

  vim.g.terminal_color_5 = colors.pink
  vim.g.terminal_color_13 = colors.pink

  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_14 = colors.blue
end

return M
