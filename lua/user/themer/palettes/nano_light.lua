local M = {}

M.scheme_name = "nano_light"

M.type = "light"

M.base30 = {
    deep_black = "#263238",
    white = "#37474F",
    darker_black = "#f7f7f7",
    black = "#FFFfff", --  nvim bg
    black2 = "#e9ecee",
    one_bg = "#ebebeb", -- real bg of onedark
    one_bg2 = "#e0e0e0",
    one_bg3 = "#d4d4d4",
    grey = "#c4c4c4",
    grey_fg = "#b5b5b5",
    grey_fg2 = "#a3a3a3",
    light_grey = "#848484",
    faded_grey = "#8497a0",
    red = "#EF5350",
    tintred = "#BF616A",
    baby_pink = "#b55dc4",
    pink = "#AB47BC",
    line = "#e0e0e0", -- for lines like vertsplit
    green = "#66BB6A",
    vibrant_green = "#75c279",
    nord_blue = "#42A5F5",
    blue = "#42A5F5",
    yellow = "#d0b22b",
    sun = "#E2C12F",
    purple = "#673AB7",
    dark_purple = "#673AB7",
    teal = "#008080",
    orange = "#FF6F00",
    cream = "#e09680",
    clay = "#D08770",
    cyan = "#26C6DA",
    statusline_bg = "#e9ecee",
    lightbg = "#e0e0e0",
    pmenu_bg = "#673AB7",
    folder_bg = "#4C566A",
}

M.base16 = {
    color00 = M.base30.black,
    color01 = M.base30.black2,
    color02 = M.base30.one_bg,
    color03 = M.base30.grey,
    color04 = M.base30.grey_fg,
    color05 = M.base30.white,
    color06 = M.base30.folder_bg,
    color07 = M.base30.deep_black,
    color08 = M.base30.purple,
    color09 = M.base30.faded_grey,
    color0A = M.base30.purple,
    color0B = M.base30.faded_grey,
    color0C = M.base30.purple,
    color0D = M.base30.deep_black,
    color0E = M.base30.white,
    color0F = M.base30.faded_grey,
}

M.polishhl = {
    treesitter = {
        ["@function"] = { bold = true },
        ["@function.builtin"] = { bold = true },
        ["@function.call"] = { bold = true },
        ["@constructor"] = { fg = M.base30.purple },
        ["@parameter"] = { fg = M.base30.white },
        ["@namespace"] = { fg = M.base30.deep_black },
        ["@symbol"] = { fg = M.base30.purple },
        ["@keyword"] = { fg = M.base30.purple },
        ["@method.call"] = { bold = true },
    },

    telescope = {
        TelescopeMatching = { fg = M.base30.purple, bg = M.base30.one_bg2 },
    },

    nvdash = {
        NvDashAscii = { fg = M.base30.gray_fg, bg = M.base30.purple },
    },
}

return M
