local M = {}

M.scheme_name = "penumbra_dark"

M.type = "dark"

M.base30 = {
    white = "#FFFDFB",
    darker_black = "#2b2e33",
    black = "#303338",
    black2 = "#3a3d42",
    one_bg = "#3d4045",
    one_bg2 = "#484b50",
    one_bg3 = "#515459",
    grey = "#5c5f64",
    grey_fg = "#676a6f",
    grey_fg2 = "#72757a",
    light_grey = "#7d8085",
    red = "#CA7081",
    baby_pink = "#E18163",
    pink = "#D07EBA",
    green = "#4EB67F",
    vibrant_green = "#50B584",
    nord_blue = "#6e8dd5",
    blue = "#8C96EC",
    yellow = "#c1ad4b",
    sun = "#9CA748",
    purple = "#ac78bd",
    dark_purple = "#8C96EC",
    orange = "#CE9042",
    teal = "#00a6c8",
    cyan = "#00B3C2",
    line = "#3E4044",
    statusline_bg = "#36393e",
    lightbg = "#484b50",
    pmenu_bg = "#4EB67F",
    folder_bg = "#8C96EC",
}

M.base16 = {
    color00 = "#303338",
    color01 = "#3a3d42",
    color02 = "#3d4045",
    color03 = "#484b50",
    color04 = "#515459",
    color05 = "#CECECE",
    color06 = "#F2E6D4",
    color07 = "#FFF7ED",
    color08 = "#999999",
    color09 = "#BE85D1",
    color0A = "#CA7081",
    color0B = "#4ec093",
    color0C = "#D68B47",
    color0D = "#7A9BEC",
    color0E = "#BE85D1",
    color0F = "#A1A641",
}

M.polishhl = {
    treesitter = {
        ["@field.key"] = { fg = M.base30.red },
        ["@punctuation.bracket"] = { fg = M.base16.color08 },
        ["@constructor"] = { fg = M.base30.orange },
        ["@parameter"] = { fg = M.base30.orange },
        ["@tag.delimiter"] = { fg = M.base16.color08 },
        ["@tag.attribute"] = { link = "@annotation" },
    },

    syntax = {
        Operator = { fg = M.base30.cyan },
        Constant = { fg = M.base30.red },
    },
}

return M
