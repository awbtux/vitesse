local M = {}

local lighten = require("user.themer.colconv").lighten_hex

function M.set(scheme)
    local col16 = scheme.base16
    local col30 = scheme.base30

    local statusbg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1)
    local modebg = lighten(statusbg, scheme.type == "light" and -10 or 6)

    return {
        MiniStatuslineFileinfo = { fg = col30.white, bg = statusbg, ctermfg = 7, ctermbg = 8 },
        MiniStatuslineDevinfo = { fg = col30.white, bg = statusbg, ctermfg = 7, ctermbg = 8 },
        MiniStatuslineFilename = { fg = col30.white, bg = statusbg, ctermfg = 15, ctermbg = 8 },
        MiniStatuslineNonFilename = { fg = lighten(col30.white, scheme.type == "light" and 10 or -10), bg = statusbg, ctermfg = 7, ctermbg = 8 },
        MiniStatuslineModeNormal = { fg = col30.black, bg = col16.color0B, ctermfg = 0, ctermbg = 2 },
        MiniStatuslineModeInsert = { fg = col30.black, bg = col16.color0D, ctermfg = 0, ctermbg = 12 },
        MiniStatuslineModeVisual = { fg = col30.black, bg = col16.color0E, ctermfg = 0, ctermbg = 13 },
        MiniStatuslineModeReplace = { fg = col30.black, bg = col16.color0F, ctermfg = 0, ctermbg = 9 },
        MiniStatuslineModeCommand = { fg = col30.black, bg = col16.color0F, ctermfg = 0, ctermbg = 9 },
        MiniStatuslineModeOther = { fg = col30.black, bg = col16.color09, ctermfg = 0, ctermbg = 3 },
    }
end

return M
