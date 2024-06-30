local M = {}

function M.set(scheme)
    return {
        MiniFilesBorder = { link = 'FloatBorder' },
        MiniFilesBorderModified = { link = 'DiagnosticFloatingWarn' },
        MiniFilesCursorLine = { link = 'CursorLine' },
        MiniFilesDirectory = { link = 'Directory' },
        MiniFilesFile = {},
        MiniFilesNormal = { link = 'NormalFloat' },
        MiniFilesTitle = { link = 'FloatTitle' },
        MiniFilesTitleFocused = { link = 'FloatTitle' },
    }
end

return M
