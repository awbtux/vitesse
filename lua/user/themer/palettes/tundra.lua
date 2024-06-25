local M = {}

M.scheme_name = "tundra"

M.type = "dark"

M.base30 = {
    white = "#FFFFFF",
    darker_black = "#0b1221",
    black = "#111827", --  nvim bg
    black2 = "#1a2130",
    one_bg = "#1e2534",
    one_bg2 = "#282f3e",
    one_bg3 = "#323948",
    grey = "#3e4554",
    grey_fg = "#4a5160",
    grey_fg2 = "#545b6a",
    light_grey = "#5f6675",
    red = "#FCA5A5",
    baby_pink = "#FECDD3",
    pink = "#ff8e8e",
    line = "#282f3e", -- for lines like vertsplit
    green = "#B5E8B0",
    vibrant_green = "#B5E8B0",
    nord_blue = "#9baaf2",
    blue = "#A5B4FC",
    yellow = "#E8D4B0",
    sun = "#f2deba",
    purple = "#BDB0E4",
    dark_purple = "#b3a6da",
    teal = "#719bd3",
    orange = "#FBC19D",
    cyan = "#BAE6FD",
    statusline_bg = "#182030",
    lightbg = "#282f3e",
    pmenu_bg = "#FCA5A5",
    folder_bg = "#A5B4FC",
}

M.base16 = {
    color00 = "#111827",
    color01 = "#1e2534",
    color02 = "#282f3e",
    color03 = "#323948",
    color04 = "#3e4554",
    color05 = "#F3F4F6",
    color06 = "#E5E7EB",
    color07 = "#D1D5DB",
    color08 = "#DDD6FE",
    color09 = "#E8D4B0",
    color0A = "#FBC19D",
    color0B = "#B5E8B0",
    color0C = "#BAE6FD",
    color0D = "#BAE6FD",
    color0E = "#FCA5A5",
    color0F = "#9CA3AF",
}

M.polishhl = {
    treesitter = {
        ["@constructor"] = { fg = M.base30.cyan },
        ["@keyword"] = { fg = M.base30.red },
        ["@method.call"] = { fg = M.base30.cyan },
        ["@function.call"] = { fg = M.base30.cyan },
        ["@function.builtin"] = { fg = M.base30.orange },
    },

    syntax = {
        Constant = { fg = M.base30.orange },
        Conditional = { fg = M.base30.baby_pink },
        Repeat = { fg = M.base30.baby_pink },
        Type = { fg = M.base30.baby_pink },
        Operator = { fg = M.base30.baby_pink },
    },
}

return M
