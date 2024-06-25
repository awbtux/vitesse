local M = {}

function M.set(scheme)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        TelescopeBorder             = { link = "FloatBorder" },
        TelescopeMatching           = { bg = col30.one_bg, fg = col30.blue, ctermfg = 4 },
        TelescopeNormal             = { fg = col30.white, bg = col30.black, ctermfg = 7 },
        TelescopePreviewTitle       = { fg = col30.black, bg = col30.blue, ctermfg = 0, ctermbg = 4 },
        TelescopePromptBorder       = { link = "FloatBorder" },
        TelescopePromptNormal       = { bg = col30.black },
        TelescopePromptPrefix       = { fg = col30.red, bg = col30.black, ctermfg = 1 },
        TelescopePromptTitle        = { fg = col30.black, bg = col30.red, ctermfg = 0, ctermbg = 1 },
        TelescopeResultsDiffAdd     = { fg = col30.green, ctermfg = 2 },
        TelescopeResultsDiffChange  = { fg = col30.yellow, ctermfg = 11 },
        TelescopeResultsDiffDelete  = { fg = col30.red, ctermfg = 1 },
        TelescopeResultsTitle       = { fg = col30.black, bg = col30.green, ctermfg = 0, ctermbg = 2 },
        TelescopeSelection          = { fg = col30.white, bg = col30.black2, ctermfg = 15 },
    }
end

return M
