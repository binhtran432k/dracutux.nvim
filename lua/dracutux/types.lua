---@class dracutux.Config
---@field style? dracutux.Style
---@field on_palette? fun(palette: dracutux.Palete)
---@field on_highlights? fun(highlights: dracutux.Highlights, colors: dracutux.Palete)
---@field cache? boolean
---@field plugins_auto? boolean
---@field plugins_all? boolean
---@field plugins? table<string, boolean>

---@class dracutux.Palete
---@field base string
---@field ui_base string
---@field text string
---@field subtle_text string
---@field selection string
---@field ui_selection string
---@field comment string
---@field cyan string
---@field blue string
---@field green string
---@field teal string
---@field pink string
---@field purple string
---@field red string
---@field yellow string
---@field orange string

---@alias dracutux.Style "default" | "day" | "soft"

---@class dracutux.Highlight: vim.api.keyset.highlight

---@alias dracutux.Highlights table<string, dracutux.Highlight | string>

---@alias dracutux.HighlightsFn fun(palette: dracutux.Palete, opts: dracutux.Config): dracutux.Highlights

---@class dracutux.Cache
---@field groups dracutux.Highlights
---@field inputs table
