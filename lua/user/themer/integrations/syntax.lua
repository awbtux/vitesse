local M = {}

function M.set(scheme)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        ["Boolean"]                 = { fg = col16.color09, ctermfg = 3 },
        ["Character"]               = { fg = col16.color08, ctermfg = 9 },
        ["Conditional"]             = { fg = col16.color0E, ctermfg = 5 },
        ["Constant"]                = { fg = col16.color08, ctermfg = 9 },
        ["Define"]                  = { fg = col16.color0E, ctermfg = 5, sp = "none" },
        ["Delimiter"]               = { fg = col16.color0F, ctermfg = 1 },
        ["Float"]                   = { fg = col16.color09, ctermfg = 3 },
        ["Variable"]                = { fg = col16.color05, ctermfg = 7 },
        ["Function"]                = { fg = col16.color0D, ctermfg = 4 },
        ["Identifier"]              = { fg = col16.color08, ctermfg = 9, sp = "none" },
        ["Include"]                 = { fg = col16.color0D, ctermfg = 4 },
        ["Keyword"]                 = { fg = col16.color0E, ctermfg = 5 },
        ["Label"]                   = { fg = col16.color0A, ctermfg = 11 },
        ["Number"]                  = { fg = col16.color09, ctermfg = 3 },
        ["Operator"]                = { fg = col16.color05, ctermfg = 7, sp = "none" },
        ["PreProc"]                 = { fg = col16.color0A, ctermfg = 11 },
        ["Repeat"]                  = { fg = col16.color0A, ctermfg = 11 },
        ["Special"]                 = { fg = col16.color0C, ctermfg = 6 },
        ["SpecialChar"]             = { fg = col16.color0F, ctermfg = 1 },
        ["Statement"]               = { fg = col16.color08, ctermfg = 9 },
        ["StorageClass"]            = { fg = col16.color0A, ctermfg = 11 },
        ["String"]                  = { fg = col16.color0B, ctermfg = 2 },
        ["Structure"]               = { fg = col16.color0E, ctermfg = 5 },
        ["Tag"]                     = { fg = col16.color0A, ctermfg = 11 },
        ["Todo"]                    = { fg = col16.color0A, ctermfg = 11, bg = col16.color01 },
        ["Type"]                    = { fg = col16.color0A, ctermfg = 11, sp = "none" },
        ["Typedef"]                 = { fg = col16.color0A, ctermfg = 11 },
        ["TypeDef"]                 = { link = "Typedef" },
        ["@annotation"]             = { fg = col16.color0F, ctermfg = 1 },
        ["@attribute"]              = { fg = col16.color0A, ctermfg = 11 },
        ["@character"]              = { fg = col16.color08, ctermfg = 9 },
        ["@comment"]                = { fg = col30.grey_fg, ctermfg = 8 },
        ["@conditional"]            = { fg = col16.color0E, ctermfg = 5 },
        ["@conditional.ternary"]    = { fg = col16.color0E, ctermfg = 5 },
        ["@constant"]               = { fg = col16.color08, ctermfg = 9 },
        ["@constant.builtin"]       = { fg = col16.color09, ctermfg = 3 },
        ["@constant.macro"]         = { fg = col16.color08, ctermfg = 9 },
        ["@constructor"]            = { fg = col16.color0C, ctermfg = 6 },
        ["@definition"]             = { sp = col16.color04, underline = true },
        ["@error"]                  = { fg = col16.color08, ctermfg = 9 },
        ["@exception"]              = { fg = col16.color08, ctermfg = 9 },
        ["@field"]                  = { fg = col16.color08, ctermfg = 9 },
        ["@field.key"]              = { fg = col16.color08, ctermfg = 9 },
        ["@float"]                  = { fg = col16.color09, ctermfg = 3 },
        ["@function"]               = { fg = col16.color0D, ctermfg = 12 },
        ["@function.builtin"]       = { fg = col16.color0D, ctermfg = 12 },
        ["@function.call"]          = { fg = col16.color0D, ctermfg = 4 },
        ["@function.macro"]         = { fg = col16.color08, ctermfg = 9 },
        ["@include"]                = { link = "Include" },
        ["@keyword"]                = { fg = col16.color0E, ctermfg = 5 },
        ["@keyword.function"]       = { fg = col16.color0E, ctermfg = 5 },
        ["@keyword.operator"]       = { fg = col16.color0E, ctermfg = 5 },
        ["@keyword.return"]         = { fg = col16.color0E, ctermfg = 5 },
        ["@macro"]                  = { fg = col16.color08, ctermfg = 9 },
        ["@method"]                 = { fg = col16.color0D, ctermfg = 4 },
        ["@method.call"]            = { fg = col16.color0D, ctermfg = 4 },
        ["@namespace"]              = { fg = col16.color08, ctermfg = 9 },
        ["@none"]                   = { fg = col16.color05, ctermfg = 7 },
        ["@operator"]               = { fg = col16.color05, ctermfg = 7 },
        ["@parameter"]              = { fg = col16.color08, ctermfg = 9 },
        ["@property"]               = { fg = col16.color08, ctermfg = 9 },
        ["@punctuation.bracket"]    = { fg = col16.color0F, ctermfg = 1 },
        ["@punctuation.delimiter"]  = { fg = col16.color0F, ctermfg = 1 },
        ["@punctuation.special"]    = { fg = col16.color08, ctermfg = 9 },
        ["@reference"]              = { fg = col16.color05, ctermfg = 7 },
        ["@scope"]                  = { bold = true },
        ["@string"]                 = { fg = col16.color0B, ctermfg = 2 },
        ["@string.escape"]          = { fg = col16.color0C, ctermfg = 14 },
        ["@string.regex"]           = { fg = col16.color0C, ctermfg = 6 },
        ["@string.special"]         = { fg = col16.color0C, ctermfg = 14 },
        ["@symbol"]                 = { fg = col16.color0B, ctermfg = 2 },
        ["@tag"]                    = { fg = col16.color0A, ctermfg = 11 },
        ["@tag.attribute"]          = { fg = col16.color08, ctermfg = 9 },
        ["@tag.delimiter"]          = { fg = col16.color0F, ctermfg = 1 },
        ["@text"]                   = { fg = col16.color05, ctermfg = 7 },
        ["@text.emphasis"]          = { fg = col16.color09, ctermfg = 3 },
        ["@text.literal"]           = { fg = col16.color09, ctermfg = 3 },
        ["@text.strike"]            = { fg = col16.color0F, ctermfg = 1, strikethrough = true },
        ["@text.strong"]            = { bold = true },
        ["@text.uri"]               = { fg = col16.color09, ctermfg = 3, underline = true },
        ["@type.builtin"]           = { fg = col16.color0A, ctermfg = 11 },
        ["@type"]                   = { link = "Type" },
        ["@variable"]               = { fg = col16.color05, ctermfg = 7 },
        ["@variable.builtin"]       = { fg = col16.color09, ctermfg = 3 },
        ["@lsp.type.class"]         = { link = "Structure" },
        ["@lsp.type.decorator"]     = { link = "Function" },
        ["@lsp.type.enum"]          = { link = "Type" },
        ["@lsp.type.enumMember"]    = { link = "Constant" },
        ["@lsp.type.function"]      = { link = "@function" },
        ["@lsp.type.interface"]     = { link = "Structure" },
        ["@lsp.type.macro"]         = { link = "@macro" },
        ["@lsp.type.method"]        = { link = "@method" },
        ["@lsp.type.namespace"]     = { link = "@namespace" },
        ["@lsp.type.parameter"]     = { link = "@parameter" },
        ["@lsp.type.property"]      = { link = "@property" },
        ["@lsp.type.struct"]        = { link = "Structure" },
        ["@lsp.type.type"]          = { link = "@type" },
        ["@lsp.type.typeParamater"] = { link = "TypeDef" },
        ["@lsp.type.variable"]      = { link = "@variable" },
    }
end

return M
