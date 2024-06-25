local resession_status_ok, resession = pcall(require, "resession")
if not resession_status_ok then
    return
end

local opts = {
    autosave = {
        enabled = false,
        interval = 60,
        notify = true,
    },
    options = {
        "binary",
        "bufhidden",
        "buflisted",
        "cmdheight",
        "diff",
        "filetype",
        "modifiable",
        "previewwindow",
        "readonly",
        "scrollbind",
        "winfixheight",
        "winfixwidth",
    },
    buf_filter = function(bufnr)
        local buftype = vim.bo[bufnr].buftype
        if buftype == 'help' then
            return true
        end
        if buftype ~= "" and buftype ~= "acwrite" then
            return false
        end
        if vim.api.nvim_buf_get_name(bufnr) == "" then
            return false
        end
        return true
    end,
    dir = "session",
    load_detail = true,  -- disable if it causes lag
    load_order = "modification_time",  -- ["modification_time", "creation_time", "filename"]
    extensions = {
        scope = {},
    },
}

resession.setup(opts)

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc(-1) == 0 then
            resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
        end
    end,
    nested = true,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
    end,
})
