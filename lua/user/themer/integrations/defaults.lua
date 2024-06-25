local M = {}

local lighten = require("user.themer.colconv").lighten_hex

function M.set(scheme)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        Empty                  = { fg = "none", bg = "none", ctermfg = "none", ctermbg = "none" },

        Normal                 = { fg = col16.color05, bg = col16.color00 },
        NormalFloat            = { bg = col30.darker_black },
        StatusLine             = { fg = col30.white, bg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), ctermfg = 15, ctermbg = 8 },
        StatusLineNC           = { fg = col30.grey_fg2, bg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), ctermfg = 7, ctermbg = 8 },

        Cursor                 = { fg = col16.color00, bg = col16.color05 },
        CursorColumn           = { bg = col16.color01, sp = "none" },
        SignColumn             = { fg = col16.color03, sp = "none" },
        ColorColumn            = { bg = col30.black2 },

        LineNr                 = { fg = col30.grey, ctermfg = 8 },
        CursorLine             = { bg = col30.black2 },
        CursorLineSign         = { bg = col30.black2 },
        CursorLineNr           = { fg = col30.white, bg = col30.black2 },

        UnderLined             = { underline = true },
        Bold                   = { bold = true },
        Italic                 = { italic = true },
        Conceal                = { bg = "none" },

        TabLine                = { fg = col30.grey_fg2, bg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), ctermfg = 7, ctermbg = 8 },
        TabLineFill            = { link = "TabLine" },
        TabLineSel             = { fg = col16.white, bg = col30.black, ctermfg = 15, bold = true },
        TabLineDelim           = { fg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), bg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), ctermfg = 8, ctermbg = 8 },
        TabLineDelimSel        = { fg = col30.black, bg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), ctermfg = 0, ctermbg = 8 },
        TabLineClose           = { fg = col30.grey_fg2, ctermfg = 8 },
        TabLineCloseSel        = { fg = col30.red, ctermfg = 1 },

        Pmenu                  = { bg = col30.one_bg, ctermbg = 8 },
        PmenuSbar              = { bg = col30.one_bg, ctermbg = 8 },
        PmenuSel               = { fg = col30.black, bg = col30.pmenu_bg, ctermfg = 0, ctermbg = 2 },
        PmenuThumb             = { bg = col30.grey },
        WildMenu               = { fg = col16.color08, bg = col16.color0A, ctermfg = 9, ctermbg = 11 },

        MatchWord              = { bg = col30.grey, fg = col30.white },
        MatchParen             = { link = "MatchWord" },

        MsgArea                = { link = "Normal" },
        MsgSeparator           = { link = "StatusLine" },

        Comment                = { fg = col30.grey_fg, ctermfg = 8 },
        NonText                = { fg = col16.color01, ctermfg = 8 },

        FloatBorder            = { fg = col30.grey, ctermfg = 8 },
        WinSeparator           = { fg = col30.line, ctermfg = 8 },
        VertSplit              = { link = "WinSeparator" },
        ToggleTerm1FloatBorder = { link = "FloatBorder" },

        Error                  = { fg = col16.color00, bg = col16.color08, ctermfg = 0, ctermbg = 1 },
        ErrorMsg               = { fg = col16.color08, bg = col16.color00, ctermfg = 1 },
        NvimInternalError      = { fg = col30.red, ctermfg = 1 },
        WarningMsg             = { fg = col16.color0A, ctermfg = 3 },
        Question               = { fg = col16.color0D, ctermfg = 4 },

        SpellBad               = { undercurl = true, sp = col16.color08 },
        SpellLocal             = { undercurl = true, sp = col16.color0C },
        SpellCap               = { undercurl = true, sp = col16.color0D },
        SpellRare              = { undercurl = true, sp = col16.color0E },

        Debug                  = { fg = col16.color08, ctermfg = 1 },
        Exception              = { fg = col16.color08, ctermfg = 1 },

        ModeMsg                = { fg = col30.grey_fg2, ctermfg = 7 },
        MoreMsg                = { fg = col30.grey_fg2, ctermfg = 7 },

        IncSearch              = { fg = col16.color01, bg = col16.color09, ctermfg = 0, ctermbg = 3 },
        Search                 = { fg = col16.color01, bg = col16.color0A, ctermfg = 0, ctermbg = 3 },

        Visual                 = { fg = col16.color05, bg = col16.color02, ctermfg = 7, ctermbg = 8 },
        VisualNOS              = { fg = col16.color08, ctermfg = 1 },

        Directory              = { fg = col16.color0D, ctermfg = 4 },

        FoldColumn             = { fg = col30.light_grey, bg = col16.color01, ctermfg = 0, ctermbg = 8 },
        Folded                 = { fg = col30.light_grey, bg = col16.color01, ctermfg = 0, ctermbg = 8 },
        CursorLineFold         = { link = "FoldColumn" },

        Macro                  = { fg = col16.color08, ctermfg = 1 },
        Substitute             = { fg = col16.color01, bg = col16.color0A, ctermfg = 0, ctermbg = 3, sp = "none" },
        SpecialKey             = { fg = col16.color03, ctermfg = 8 },
        TooLong                = { fg = col16.color08, ctermfg = 1 },
        Title                  = { fg = col16.color0D, ctermfg = 4, sp = "none" },
        QuickFixLine           = { bg = col16.color01, sp = "none" },

        healthSuccess          = { fg = col30.black, bg = col30.green, ctermfg = 0, ctermbg = 2 },
    }
end

return M
