-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    DiffAdd = {
      bg = "#005f00",
      fg = "NONE",
    },
    DiffAdded = {
      bg = "#005f00",
      fg = "NONE",
    },
    DiffText = {
      bg = "#4C566A",
      fg = "NONE",
    },
    DiffDelete = {
      bg = "#5f0000",
      fg = "NONE",
    },
    DiffRemoved = {
      bg = "#5f0000",
      fg = "NONE",
    },
    DiffChange = {
      bg = "#4C566A",
      fg = "NONE",
    },
    DiffModified = {
      bg = "#4C566A",
      fg = "NONE",
    },
    DiffChangeDelete = {
      bg = "#5f0000",
      fg = "NONE",
    },
    DiffNewFile = {
      bg = "#005f00",
      fg = "NONE",
    },
    TelescopeSelection = {
      fg = "#61afef",
    },
  },
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
    Winbar = { bg = "NONE" },
    WinBarNC = { fg = "NONE", bg = "NONE" },
  },
  -- telescope = { style = "bordered" },
  lsp = {
    signature = false,
    semantic_tokens = false,
  },
  nvdash = {
    load_on_startup = true,
    header = {
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    },
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    separator_style = "round",
    overriden_modules = function(modules)
      modules[5] = (function()
        return ""
      end)()
    end,
  },
}

M.term = {
  -- hl = "Normal:term,WinSeparator:WinSeparator",
  sizes = { sp = 0.3, vsp = 0.5 },
  float = {
    relative = "editor",
    row = 0.3,
    col = 0.25,
    width = 0.5,
    height = 0.4,
    border = "single",
  },
}

M.base46 = {
  integrations = {
    "hop",
    "todo",
    "rainbowdelimiters",
    "notify",
    "codeactionmenu",
    "semantic_tokens",
    "neogit",
  },
}

return M
