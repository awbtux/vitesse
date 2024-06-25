local M = {}

M.scheme_name = "decay"

M.type = "dark"

M.base30 = {
    white = "#dee1e6",
    darker_black = "#111519",
    black = "#171B20", --  nvim bg
    black2 = "#1e2227",
    one_bg = "#262a2f",
    one_bg2 = "#2f3338",
    one_bg3 = "#373b40",
    grey = "#41454a",
    grey_fg = "#494d52",
    grey_fg2 = "#505459",
    light_grey = "#5a5e63",
    red = "#e26c7c",
    baby_pink = "#c79bf0",
    pink = "#c296eb",
    line = "#282d35", -- for lines like vertsplit
    green = "#78DBA9",
    vibrant_green = "#87eab8",
    blue = "#86aaec",
    nord_blue = "#96b5ee",
    yellow = "#ecd3a0",
    sun = "#f1d8a5",
    purple = "#c68aee",
    dark_purple = "#b77bdf",
    teal = "#7ddac5",
    orange = "#e9a180",
    cyan = "#98d3ee",
    statusline_bg = "#1e2228",
    lightbg = "#2b3038",
    pmenu_bg = "#7ddac5",
    folder_bg = "#78DBA9",
}

M.base16 = {
    color00 = "#171B20",
    color01 = "#21262e",
    color02 = "#242931",
    color03 = "#485263",
    color04 = "#485263",
    color05 = "#b6beca",
    color06 = "#dee1e6",
    color07 = "#dee1e6",
    color08 = "#70A5EB",
    color09 = "#e9a180",
    color0A = "#f1cf8a",
    color0B = "#78DBA9",
    color0C = "#e26c7c",
    color0D = "#86aaec",
    color0E = "#c68aee",
    color0F = "#9cd1ff",
}

M.polishhl = {
    treesitter = {
        ["@constant"] = { fg = M.base30.yellow },
    },
}

return M
