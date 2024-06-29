local M = {}

function M.set(scheme)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        CccFloatBorder = { link = "FloatBorder" },
        CccFloatNormal = { link = "NormalFloat" },
    }
end

return M
