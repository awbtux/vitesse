local M = {}

M.scheme_name = "palenight"

M.type = "dark"

M.base30 = {
    white = "#ffffff", -- custom
    darker_black = "#232738",
    black = "#292D3E", --  nvim bg
    black2 = "#2f3344",
    one_bg = "#333748",
    one_bg2 = "#3c4051",
    one_bg3 = "#444859",
    grey = "#515566",
    grey_fg = "#5b5f70",
    grey_fg2 = "#65697a",
    light_grey = "#6d7182",
    red = "#f07178",
    baby_pink = "#606475",
    pink = "#ff5370", -- base16
    line = "#3f4354", -- for lines like vertsplit
    green = "#c3e88d", --base16
    vibrant_green = "#96e88d", -- custom
    nord_blue = "#8fb7ff",
    blue = "#82aaff", -- base16
    yellow = "#ffcb6b", -- base16
    sun = "#ffd373",
    purple = "#c792ea", -- base16
    dark_purple = "#b383d2", --custom
    teal = "#89ffe6", -- custom
    orange = "#ffa282", -- base16
    cyan = "#89ddff", -- base16
    statusline_bg = "#2f3345",
    lightbg = "#3c4051",
    pmenu_bg = "#82aaff", -- custom
    folder_bg = "#82aaff",
}

M.base16 = {
    color00 = "#292d3e",
    color01 = "#444267",
    color02 = "#32374d",
    color03 = "#676e95",
    color04 = "#8796b0",
    color05 = "#d3d3d3",
    color06 = "#efefef",
    color07 = "#ffffff",
    color08 = "#f07178",
    color09 = "#ffa282",
    color0A = "#ffcb6b",
    color0B = "#c3e88d",
    color0C = "#89ddff",
    color0D = "#82aaff",
    color0E = "#c792ea",
    color0F = "#ff5370",
}

M.polishhl = {
    treesitter = {
        ["@include"] = { fg = M.base30.purple },
        ["@field.key"] = { fg = M.base30.orange },
    },
}

return M
