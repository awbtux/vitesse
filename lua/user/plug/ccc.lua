local ccc_status_ok, ccc = pcall(require, "ccc")
if not ccc_status_ok then
    return
end

local opts = {
    win_opts = {
        relative = "cursor",
        row = 1,
        col = 1,
        style = "minimal",
        border = "single",
    },
    mappings = {
        w = ccc.mapping.increase5,
        W = ccc.mapping.increase10,
        b = ccc.mapping.decrease5,
        B = ccc.mapping.decrease10
    }
}

ccc.setup(opts)
