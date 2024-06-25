local M = {}

M.scheme_name = "melange"

M.type = "dark"

M.base30 = {
    white = "#ECE1D7",
    darker_black = "#241f1a",
    black = "#2A2520", -- nvim bg
    black2 = "#342f2a",
    one_bg = "#39342f",
    one_bg2 = "#433e39",
    one_bg3 = "#4d4843",
    grey = "#57524d",
    grey_fg = "#605b56",
    grey_fg2 = "#6b6661",
    light_grey = "#75706b",
    red = "#B65C60",
    baby_pink = "#CE9BCB",
    pink = "#B65C60",
    line = "#39342f", -- for lines like vertsplit
    green = "#86A3A3",
    vibrant_green = "#99D59D",
    nord_blue = "#88B3B2",
    blue = "#9AACCE",
    yellow = "#e3b865",
    sun = "#EBC06D",
    purple = "#c47fd5",
    dark_purple = "#b570c6",
    teal = "#697893",
    orange = "#E49B5D",
    firered = "#F17C64",
    cyan = "#bbcdef",
    statusline_bg = "#332e29",
    lightbg = "#433e39",
    pmenu_bg = "#86A3A3",
    folder_bg = "#697893",
}

M.base16 = {
    color00 = "#2A2520",
    color01 = "#39342f",
    color02 = "#433e39",
    color03 = "#4d4843",
    color04 = "#57524d",
    color05 = "#ECE1D7",
    color06 = "#e3d8ce",
    color07 = "#d8cdc3",
    color08 = "#ECE1D7",
    color09 = "#86A3A3",
    color0A = "#99D59D",
    color0B = "#9AACCE",
    color0C = "#EBC06D",
    color0D = "#EBC06D",
    color0E = "#E49B5D",
    color0F = "#8E733F",
}

M.polishhl = {
    treesitter = {
        ["@field"] = { fg = M.base30.white },
        ["@field.key"] = { fg = M.base30.white },
        ["@function.macro"] = {
            fg = M.base30.vibrant_green,
        },
    },

    syntax = {
        Include = { fg = M.base30.vibrant_green },
        Operator = { fg = M.base30.firered },
        Boolean = { fg = M.base30.purple },
    },
}

return M
