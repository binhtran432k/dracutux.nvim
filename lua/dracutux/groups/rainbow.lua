local M = {}

M.url = "https://github.com/HiPhish/rainbow-delimiters.nvim"

---@param p dracutux.Palete
function M.get_rainbows(p)
  return { p.red, p.orange, p.yellow, p.green, p.cyan, p.purple, p.pink }
end

---@type dracutux.HighlightsFn
function M.get(c)
  return {
    RainbowDelimiterRed = { fg = c.red },
    RainbowDelimiterOrange = { fg = c.orange },
    RainbowDelimiterYellow = { fg = c.yellow },
    RainbowDelimiterGreen = { fg = c.green },
    RainbowDelimiterCyan = { fg = c.cyan },
    RainbowDelimiterBlue = { fg = c.purple },
    RainbowDelimiterViolet = { fg = c.pink },
  }
end

return M
