local M = {}

M.scheme_name = "github_light"

M.type = "light"

M.base30 = {
    white = "#24292e",
    darker_black = "#f3f5f7",
    black = "#ffffff", --  nvim bg
    black2 = "#eaecee",
    one_bg = "#eaecee",
    one_bg2 = "#e1e3e5", -- StatusBar (filename)
    one_bg3 = "#d7d9db",
    grey = "#c7c9cb", -- Line numbers )
    grey_fg = "#bcbec0",
    grey_fg2 = "#b1b3b5",
    light_grey = "#a6a8aa",
    red = "#DE2C2E", -- StatusBar (username)
    baby_pink = "#ea4aaa",
    pink = "#b93a86",
    line = "#eaecee", -- for lines like vertsplit
    green = "#18654B",
    vibrant_green = "#28a745",
    nord_blue = "#0366d6", -- Mode indicator
    blue = "#0D7FDD",
    yellow = "#dbab09",
    sun = "#f9c513",
    purple = "#8263EB",
    dark_purple = "#5a32a3",
    teal = "#22839b",
    orange = "#d15704",
    cyan = "#0598bc",
    statusline_bg = "#eaecee",
    lightbg = "#e1e3e5",
    pmenu_bg = "#8263EB",
    folder_bg = "#6a737d",
}

M.base16 = {
    color00 = "#ffffff", -- Default bg
    color01 = "#eaecee", -- Lighter bg (status bar, line number, folding mks)
    color02 = "#e1e3e5", -- Selection bg
    color03 = "#d7d9db", -- Comments, invisibles, line hl
    color04 = "#c7c9cb", -- Dark fg (status bars)
    color05 = "#383d42", -- Default fg (caret, delimiters, Operators)
    color06 = "#2e3338", -- Light fg (not often used)
    color07 = "#24292e", -- Light bg (not often used)
    color08 = "#5a32a3", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    color09 = "#b93a86", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
    color0A = "#b08800", -- Classes, Markup Bold, Search Text Background
    color0B = "#4c2889", -- Strings, Inherited Class, Markup Code, Diff Inserted
    color0C = "#8263EB", -- Support, regex, escape chars
    color0D = "#005cc5", -- Function, methods, headings
    color0E = "#DE2C2E", -- Keywords
    color0F = "#044289", -- Deprecated, open/close embedded tags
}

M.polishhl = {
    treesitter = {
        ["@punctuation.bracket"] = { fg = M.base30.blue },
        ["@field.key"] = { fg = M.base30.white },
        ["@constructor"] = { fg = M.base30.vibrant_green },
        ["@operator"] = { fg = M.base30.orange },
    },

    syntax = {
        Constant = { fg = M.base16.color07 },
        Tag = { fg = M.base30.vibrant_green },
    },
}

return M
