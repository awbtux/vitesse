local M = {}

M.scheme_name = "ayu_light"

M.type = "light"

M.base30 = {
    white = "#26292f",
    darker_black = "#f3f3f3",
    black = "#fafafa", --  nvim bg
    black2 = "#efefef",
    one_bg = "#ebebeb",
    one_bg2 = "#e1e1e1", -- Highlight of context
    one_bg3 = "#d7d7d7",
    grey = "#cdcdcd",
    grey_fg = "#b9b9b9",
    grey_fg2 = "#acacac", -- Highlight background
    light_grey = "#a0a0a0", -- Line numbers
    red = "#E65050",
    baby_pink = "#ff8282",
    pink = "#ffa5a5",
    line = "#e1e1e1", -- for lines like vertsplit
    green = "#6CBF43",
    vibrant_green = "#94e76b",
    blue = "#399EE6",
    nord_blue = "#2c91d9",
    yellow = "#E6BA7E",
    sun = "#f3c78b",
    purple = "#9F40FF",
    dark_purple = "#8627e6",
    teal = "#74c5aa",
    orange = "#FA8D3E",
    cyan = "#95E6CB",
    statusline_bg = "#ededed",
    lightbg = "#e6e6e6",
    pmenu_bg = "#95E6CB",
    folder_bg = "#5C6166",
}

M.base16 = {
    color00 = "#fafafa",
    color01 = "#ededed",
    color02 = "#eeeeee",
    color03 = "#dfdfdf",
    color04 = "#d2d2d2",
    color05 = "#5C6166",
    color06 = "#52575c",
    color07 = "#484d52",
    color08 = "#F07171",
    color09 = "#A37ACC",
    color0A = "#399EE6",
    color0B = "#86B300",
    color0C = "#4CBF99",
    color0D = "#55B4D4",
    color0E = "#FA8D3E",
    color0F = "#F2AE49",
}

M.polishhl = {
    treesitter = {
        luaTSField = { fg = M.base16.color0E },
        PmenuSel = { fg = M.base30.white, bg = M.base30.pmenu_bg },
        ["@tag.delimiter"] = { fg = M.base30.color0D },
        ["@parameter"] = { fg = M.base16.color09 },
        ["@constructor"] = { fg = M.base16.color0C },
        ["@tag.attribute"] = { fg = M.base30.color0F },
    },
}

return M
