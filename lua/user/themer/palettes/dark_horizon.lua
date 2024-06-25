local M = {}

M.scheme_name = "dark_horizon"

M.type = "dark"

M.base30 = {
    white = "#FFFFFF",
    darker_black = "#080808",
    black = "#0e0e0e", --  nvim bg
    black2 = "#1a1a1a",
    one_bg = "#1c1c1c",
    one_bg2 = "#212121",
    one_bg3 = "#292929",
    grey = "#363636",
    grey_fg = "#404040",
    grey_fg2 = "#4a4a4a",
    light_grey = "#525252",
    red = "#db627e",
    baby_pink = "#a72e5b",
    pink = "#ff75a0",
    line = "#1d1d1d", -- for lines like vertsplit
    green = "#AAD84C",
    vibrant_green = "#b9e75b",
    nord_blue = "#18a3af",
    blue = "#25B0BC",
    seablue = "#169AC9",
    yellow = "#fdb830",
    sun = "#ffc038",
    purple = "#da70d6",
    dark_purple = "#c65cc2",
    teal = "#749689",
    orange = "#FFA500",
    cyan = "#6BE4E6",
    statusline_bg = "#1a1a1a",
    lightbg = "#292929",
    pmenu_bg = "#15bf84",
    folder_bg = "#07929e",
}

M.base16 = {
    color00 = "#0e0e0e",
    color01 = "#1a1a1a",
    color02 = "#292929",
    color03 = "#363636",
    color04 = "#3f4248",
    color05 = "#c9c7be",
    color06 = "#E6E1CF",
    color07 = "#D9D7CE",
    color08 = "#db627e", -- Confirmed: Variables Confirmed
    color09 = "#eaa273", -- Confirmed: Integers, Booleans
    color0A = "#169AC9", -- Classes
    color0B = "#E3A587", -- Confirmed: Strings
    color0C = "#F09483", -- Escape characters, Regular expressions
    color0D = "#32d5e3", -- Functions, Methods
    color0E = "#6BE4E6", -- Confirmed: Keywords, Storage, Selector, Markup
    color0F = "#d75271", -- Deprecated, Opening/Closing embedded language tags
}

M.polishhl = {
    syntax = {
        Include = { fg = M.base16.color0E, bold = true },
    },

    treesitter = {
        ["@property"] = { fg = M.base16.color0E },
        ["@tag.delimiter"] = { fg = M.base16.color05 },
        ["@punctuation.bracket"] = { fg = M.base30.yellow },
        ["@punctuation.delimiter"] = { fg = M.base30.yellow },
    },
}

return M
