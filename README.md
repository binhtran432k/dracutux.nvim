# 🧛 dracutux.nvim 🐧

A Dracutux theme theme written in [Lua](https://www.lua.org) for
[Neovim](https://github.com/neovim/neovim).

## Preview

### Default

![image](https://github.com/user-attachments/assets/0da1156b-daf7-45a0-9188-c46800378d49)

### Soft

![image](https://github.com/user-attachments/assets/432f1892-026e-4d5a-80b3-31867da7ef3e)

### Day

![image](https://github.com/user-attachments/assets/f642ec1e-436c-4275-b519-90530796c232)

## ✨ Features

- Supports the latest [Neovim](https://github.com/neovim/neovim)
  [0.10.0](https://github.com/neovim/neovim/releases/tag/v0.10.0) features.
- Enhances terminal colors.
- Supports all major plugins.

## ⚡️ Requirements

- [Neovim](https://github.com/neovim/neovim) >=
  [0.10.0](https://github.com/neovim/neovim/releases/tag/v0.10.0)

## 📦 Installation

Install the theme with your preferred package manager, such as
[folke/lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "binhtran432k/dracutux.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

## 🚀 Usage

### Vim Script

```vim
colorscheme dracutux

" There are also color-schemes for the different styles.
colorscheme dracutux-soft
colorscheme dracutux-day
```

### [Lua](https://www.lua.org)

```lua
vim.cmd[[colorscheme dracutux]]
```

#### External Plugins

##### [Lualine](https://github.com/nvim-lualine/lualine.nvim)

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'dracutux'
    -- ... your lualine config
  }
}
```

## ⚙️ Configuration

> ❗️ Set the configuration **BEFORE** loading the color scheme with
> `colorscheme dracutux`.

The theme offers four styles: [default](#default), [soft](#soft)
and [day](#day).

The [day](#day) style is used when `{ style = "day" }` is passed to
`setup(options)` or when `vim.o.background = "light"`.

[dracutux](https://github.com/binhtran432k/dracutux.nvim) uses the default options,
unless `setup` is explicitly called.

```lua
---@type dracutux.Config
require("dracutux").setup({
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
})
```

## 🪓 Overriding Colors & Highlight Groups

How the highlight groups are calculated:

1. `colors` are determined based on your configuration, with the ability to
   override them using `config.on_colors(colors)`.
1. These `colors` are utilized to generate the highlight groups.
1. `config.on_highlights(highlights, colors)` can be used to override highlight
   groups.

### Settings and color alteration demonstration

```lua
---@type dracutux.Config
require("dracutux").setup({
  style = "soft",
  on_palette = function(p)
    p.hint = colors.orange
    p.error = "#ff0000"
  end
})
```

## 🔥 Contributing

Pull requests are welcome.

## 🤝 Inspirations

- Tokyonight: <https://github.com/folke/tokyonight.nvim>
- Dracula: <https://github.com/Mofiqul/dracula.nvim>
