local M = {}

local lighten = require("user.themer.colconv").lighten_hex

function M.set(scheme)
    local col16 = scheme.base16
    local col30 = scheme.base30

    local statusbg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1)
    local modebg = lighten(statusbg, scheme.type == "light" and -10 or 6)

    return {
        StatuslineBackground = { bg = statusbg, ctermbg = 8 },
        StatuslineActive = { fg = col30.white, bg = statusbg, ctermfg = 7, ctermbg = 8 },
        StatuslineInactive = { fg = col30.grey_fg2, bg = statusbg, ctermfg = 7, ctermbg = 8 },
        StatuslineFilename = { fg = col30.white, bg = statusbg, ctermfg = 15, ctermbg = 8 },
        StatuslineMiscBuffer = { fg = lighten(col30.white, scheme.type == "light" and 10 or -10), bg = statusbg, ctermfg = 15, ctermbg = 8 },
        StatuslineGitdiff = { fg = col30.grey_fg2, ctermfg = 7, bg = statusbg, ctermbg = 8 },
        StatuslineModeNormal = { fg = col30.black, bg = col16.color0B, ctermfg = 0, ctermbg = 2 },
        StatuslineModeInsert = { fg = col30.black, bg = col16.color0D, ctermfg = 0, ctermbg = 12 },
        StatuslineModeVisual = { fg = col30.black, bg = col16.color0E, ctermfg = 0, ctermbg = 13 },
        StatuslineModeReplace = { fg = col30.black, bg = col16.color0F, ctermfg = 0, ctermbg = 9 },
        StatuslineModeCommand = { fg = col30.black, bg = col16.color0F, ctermfg = 0, ctermbg = 9 },
        StatuslineModeOther = { fg = col30.black, bg = col16.color09, ctermfg = 0, ctermbg = 3 },
        --StatuslineModeNormal = { fg = col16.color07, bg = modebg, ctermfg = 0, ctermbg = 2 },
        --StatuslineModeInsert = { fg = col16.color07, bg = modebg, ctermfg = 0, ctermbg = 12 },
        --StatuslineModeVisual = { fg = col16.color07, bg = modebg, ctermfg = 0, ctermbg = 13 },
        --StatuslineModeReplace = { fg = col16.color07, bg = modebg, ctermfg = 0, ctermbg = 9 },
        --StatuslineModeCommand = { fg = col16.color07, bg = modebg, ctermfg = 0, ctermbg = 9 },
        --StatuslineModeOther = { fg = col16.color07, bg = modebg, ctermfg = 0, ctermbg = 3 },
    }
end

return M
