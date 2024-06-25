local M = {}

local lighten = require("user.themer.colconv").lighten_hex

function M.set(scheme)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        LazyH1                 = { fg = col30.black, bg = col30.green, ctermfg = 0, ctermbg = 2 },
        LazyButton             = { fg = lighten(col30.light_grey, scheme.type == "dark" and 10 or -20), bg = col30.one_bg, ctermfg = 7, ctermbg = 8 },
        LazyH2                 = { fg = col30.red, ctermfg = 1, bold = true, underline = true },
        LazyReasonPlugin       = { fg = col30.red, ctermfg = 1 },
        LazyValue              = { fg = col30.teal, ctermfg = 6 },
        LazyDir                = { fg = col16.color05, ctermfg = 7 },
        LazyUrl                = { fg = col16.color05, ctermfg = 7 },
        LazyCommit             = { fg = col30.green, ctermfg = 2 },
        LazyNoCond             = { fg = col30.red, ctermfg = 1 },
        LazySpecial            = { fg = col30.blue, ctermfg = 4 },
        LazyReasonFt           = { fg = col30.purple, ctermfg = 5 },
        LazyOperator           = { fg = col30.white, ctermfg = 7 },
        LazyReasonKeys         = { fg = col30.teal, ctermfg = 6 },
        LazyTaskOutput         = { fg = col30.white, ctermfg = 7 },
        LazyCommitIssue        = { fg = col30.pink, ctermfg = 13 },
        LazyReasonEvent        = { fg = col30.yellow, ctermfg = 3 },
        LazyReasonStart        = { fg = col30.white, ctermfg = 7 },
        LazyReasonRuntime      = { fg = col30.nord_blue, ctermfg = 4 },
        LazyReasonCmd          = { fg = col30.sun, ctermfg = 11 },
        LazyReasonSource       = { fg = col30.cyan, ctermfg = 14 },
        LazyReasonImport       = { fg = col30.white, ctermfg = 7 },
        LazyProgressDone       = { fg = col30.green, ctermfg = 2 },
    }
end

return M
