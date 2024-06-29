local M = {}

local lighten = require("user.themer.colconv").lighten_hex
local saturate = require("user.themer.colconv").saturate_hex

function M.set(scheme)
    local col16 = scheme.base16
    local col30 = scheme.base30

    local statusbg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1)
    local modebg = lighten(statusbg, scheme.type == "light" and -10 or 6)

    return {
        -- basic vim status line
        StatusLine = { fg = col30.white, bg = statusbg, ctermfg = 15, ctermbg = 8 },
        StatusLineNC = { fg = col30.grey_fg, bg = statusbg, ctermfg = 239, ctermbg = 8 },

        -- mini.statusline
        StatusLineFilename = { fg = col30.white, bg = statusbg, ctermfg = 15, ctermbg = 8 },
        StatusLineNonFilename = { fg = lighten(col30.white, scheme.type == "light" and 10 or -10), bg = statusbg, ctermfg = 7, ctermbg = 8 },
        StatusLineFileinfo = { fg = col30.white, bg = statusbg, ctermfg = 7, ctermbg = 8 },
        StatusLineGit = { fg = saturate(lighten(col30.light_grey, scheme.type == "light" and -10 or 10), 5), bg = statusbg, ctermfg = 7, ctermbg = 8 },
        StatusLineDiff = { fg = col30.white, bg = statusbg, ctermfg = 7, ctermbg = 8 },
        StatusLineDiffAdded = { fg = col30.green, bg = statusbg, ctermfg = 10, ctermbg = 8 },
        StatusLineDiffChanged = { fg = col30.yellow, bg = statusbg, ctermfg = 11, ctermbg = 8 },
        StatusLineDiffRemoved = { fg = col30.red, bg = statusbg, ctermfg = 9, ctermbg = 8 },
        StatusLineDiagnostics = { fg = col30.white, bg = statusbg, ctermfg = 7, ctermbg = 8 },
        StatusLineLSP = { fg = col30.white, bg = statusbg, ctermfg = 7, ctermbg = 8 },
        StatusLineModeNormal = { fg = col16.color0B, bg = statusbg, ctermfg = 2, ctermbg = 8 },
        StatusLineModeInsert = { fg = col16.color0D, bg = statusbg, ctermfg = 12, ctermbg = 8 },
        StatusLineModeVisual = { fg = col16.color0E, bg = statusbg, ctermfg = 13, ctermbg = 8 },
        StatusLineModeReplace = { fg = col16.color0F, bg = statusbg, ctermfg = 9, ctermbg = 8 },
        StatusLineModeCommand = { fg = col16.color0F, bg = statusbg, ctermfg = 9, ctermbg = 8 },
        StatusLineModeOther = { fg = col16.color09, bg = statusbg, ctermfg = 3, ctermbg = 8 },

        --StatusLineModeNormal = { fg = col30.black, bg = col16.color0B, ctermfg = 0, ctermbg = 2 },
        --StatusLineModeInsert = { fg = col30.black, bg = col16.color0D, ctermfg = 0, ctermbg = 12 },
        --StatusLineModeVisual = { fg = col30.black, bg = col16.color0E, ctermfg = 0, ctermbg = 13 },
        --StatusLineModeReplace = { fg = col30.black, bg = col16.color0F, ctermfg = 0, ctermbg = 9 },
        --StatusLineModeCommand = { fg = col30.black, bg = col16.color0F, ctermfg = 0, ctermbg = 9 },
        --StatusLineModeOther = { fg = col30.black, bg = col16.color09, ctermfg = 0, ctermbg = 3 },
    }
end

return M
