local M = {}

local lighten = require("user.themer.colconv").lighten_hex
local saturate = require("user.themer.colconv").saturate_hex

function M.set(scheme)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        -- diff syntax
        Added = { fg = col30.green, ctermfg = 2 },
        Changed = { fg = col30.yellow, ctermfg = 3 },
        Removed = { fg = col30.red, ctermfg = 1 },
        DiffAdd = { link = "Added" },
        DiffChange = { link = "Changed" },
        DiffDelete = { link = "Removed" },
        DiffText = { link = "Comment" },
        diffAdded = { link = "Added" },
        diffBDiffer = { link = "Removed" },
        diffChanged = { link = "Changed" },
        diffComment = { link = "Comment" },
        diffCommon = { link = "Comment" },
        diffDiffer = { link = "Changed" },
        diffFile = { link = "Comment" },
        diffLine = { fg = col30.blue, ctermfg = 4 },
        diffSubname = { fg = col30.blue, ctermfg = 4 },
        diffIndex = { fg = col30.dark_purple, ctermfg = 13 },
        diffIndexLine = { link = "diffIndex" },

        -- gitsigns
        GitSignsAdd = { fg = lighten(col30.green, vim.opt.background == "light" and 20 or -5), ctermfg = 10 },
        GitSignsChange = { fg = lighten(col30.yellow, vim.opt.background == "light" and 20 or -5), ctermfg = 11 },
        GitSignsDelete = { fg = col30.red, ctermfg = 9 },
        GitSignsChangedelete = { link = "GitSignsChange" },
        GitSignsTopdelete = { link = "GitSignsDelete" },
        GitSignsUntracked = { link = "NonText" },
        GitSignsAddNr = { link = "GitSignsAdd" },
        GitSignsChangeNr = { link = "GitSignsChange" },
        GitSignsDeleteNr = { link = "GitSignsDelete" },
        GitSignsChangedeleteNr = { link = "GitSignsChangedelete" },
        GitSignsTopdeleteNr = { link = "GitSignsTopdelete" },
        GitSignsUntrackedNr = { link = "GitSignsUntracked" },
        GitSignsAddLn = { link = "DiffAdd" },
        GitSignsChangeLn = { link = "DiffChange" },
        GitSignsDeleteLn = { link = "DiffDelete" },
        GitSignsChangedeleteLn = { link = "DiffChange" },
        GitSignsTopdeleteLn = { link = "DiffDelete" },
        GitSignsUntrackedLn = { link = "DiffText" },
        GitSignsAddPreview = { link = "DiffAdd" },
        GitSignsDeletePreview = { link = "DiffDelete" },
        GitSignsCurrentLineBlame = { link = "NonText" },
        GitSignsAddInline = { link = "TermCursor" },
        GitSignsDeleteInline = { link = "TermCursor" },
        GitSignsChangeInline = { link = "TermCursor" },
        GitSignsAddLnInline = { link = "GitSignsAddInline" },
        GitSignsDeleteLnInline = { link = "GitSignsDeleteInline" },
        GitSignsChangeLnInline = { link = "GitSignsChangeInline" },
        GitSignsDeleteVirtLn = { link = "GitSignsDeleteLn" },
        GitSignsDeleteVirtLnInline = { link = "GitSignsDeleteVirtLn" },
        GitSignsDeleteVirtLnum = { link = "GitSignsDeleteVirtLn" },
    }
end

return M
