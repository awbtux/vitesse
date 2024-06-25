-- buffers per tab

M = {
    cache = {},
    last_tab = 0,
    config = {
        restore_state = false,
        hooks = {
            pre_tab_enter = nil,
            post_tab_enter = nil,
            pre_tab_leave = nil,
            post_tab_leave= nil,
            pre_tab_close= nil,
            post_tab_close= nil,
        }
    }
}

function M.on_tab_new_entered()
    vim.api.nvim_buf_set_option(0, "buflisted", true)
end

function M.on_tab_enter()
    if M.config.hooks.pre_tab_enter ~= nil then
        M.config.hooks.pre_tab_enter()
    end
    local tab = vim.api.nvim_get_current_tabpage()
    local buf_nums = M.cache[tab]
    if buf_nums then
        for _, k in pairs(buf_nums) do
            vim.api.nvim_buf_set_option(k, "buflisted", true)
        end
    end
    if M.config.hooks.post_tab_enter ~= nil then
        M.config.hooks.post_tab_enter()
    end
end

function M.on_tab_leave()
    if M.config.hooks.pre_tab_leave ~= nil then
        M.config.hooks.pre_tab_leave()
    end
    local tab = vim.api.nvim_get_current_tabpage()
    local buf_nums = M.get_valid_buffers()
    M.cache[tab] = buf_nums
    for _, k in pairs(buf_nums) do
        vim.api.nvim_buf_set_option(k, "buflisted", false)
    end
    last_tab = tab
    if M.config.hooks.post_tab_leave ~= nil then
        M.config.hooks.post_tab_leave()
    end
end

function M.on_tab_closed()
    if M.config.hooks.pre_tab_close ~= nil then
        M.config.hooks.pre_tab_close()
    end
    M.cache[last_tab] = nil
    if M.config.hooks.post_tab_close ~= nil then
        M.config.hooks.post_tab_close()
    end
end

function M.revalidate()
    local tab = vim.api.nvim_get_current_tabpage()
    local buf_nums = M.get_valid_buffers()
    M.cache[tab] = buf_nums
end

function M.print_summary()
    print("tab" .. " " .. "buf" .. " " .. "name")
    for tab, buf_item in pairs(M.cache) do
        for _, buf in pairs(buf_item) do
            local name = vim.api.nvim_buf_get_name(buf)
            print(tab .. " " .. buf .. " " .. name)
        end
    end
end

function M.move_current_buf(opts)
    -- ensure current buflisted
    local buflisted = vim.api.nvim_buf_get_option(0, "buflisted")
    if not buflisted then
        return
    end

    local target = tonumber(opts.args)
    if target == nil then
        -- invalid target tab, get input from user
        local input = vim.fn.input("ve buf to: ")
        if input == "" then -- user cancel
            return
        end

        target = tonumber(input)
    end

    -- bufferline always display  tab number, not the handle. When scope use tab handle to store buffer info. So need to convert
    local target_handle = vim.api.nvim_list_tabpages()[target]

    if target_handle == nil then
        vim.api.nvim_err_writeln("Invalid target tab")
        return
    end

    M.move_buf(vim.api.nvim_get_current_buf(), target_handle)
end

function M.move_buf(bufnr, target)
    local target_bufs = M.cache[target] or {}
    target_bufs[#target_bufs + 1] = bufnr

    -- remove current buf from current tab if it is not the last one in the tab
    local buf_nums = M.get_valid_buffers()
    if #buf_nums > 1 then
        vim.api.nvim_buf_set_option(bufnr, "buflisted", false)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.cmd("bprevious")
        end
    end
end

function M.deserialize_state(state)
    local buf_nums = M.get_valid_buffers()
    for _, k in pairs(buf_nums) do --FIX: this might not be required
        vim.api.nvim_buf_set_option(k, "buflisted", false)
    end
    local scope_state = vim.json.decode(state)
    local cache = {}
    for _, table in pairs(scope_state.cache) do
        cache[#cache + 1] = M.get_buffer_ids(table)
    end
    require("scope").cache = cache
    require("scope").last_tab = scope_state.last_tab
    require("scope").on_tab_enter()
end

function M.serialize_state()
    local core = require("scope")
    local scope_cache = {}
    for _, table in pairs(M.cache) do
        scope_cache[#scope_cache + 1] = M.get_buffer_names(table)
    end
    local state = {
        cache = scope_cache,
        last_tab = M.last_tab,
    }
    return vim.json.encode(state)
end

function M.load_state()
    if vim.g.ScopeState ~= nil then
        M.deserialize_state(vim.g.ScopeState)
    end
end

function M.save_state()
    vim.g.ScopeState = M.serialize_state()
end

function is_valid(buf_num)
    if not buf_num or buf_num < 1 then
        return false
    end
    local exists = vim.api.nvim_buf_is_valid(buf_num)
    return vim.bo[buf_num].buflisted and exists
end

function M.get_valid_buffers()
    local buf_nums = vim.api.nvim_list_bufs()
    local ids = {}
    for _, buf in ipairs(buf_nums) do
        if is_valid(buf) then
            ids[#ids + 1] = buf
        end
    end
    return ids
end

function M.get_buffer_names(buf_nums)
    local buf_names = {}
    for _, buf in pairs(buf_nums) do
        buf_names[#buf_names + 1] = vim.api.nvim_buf_get_name(buf)
    end
    return buf_names
end

function M.get_buffer_ids(buf_names)
    local buf_ids = {}
    local buf_nums = vim.api.nvim_list_bufs()
    for _, buf_name in pairs(buf_names) do
        for _, buf_num in pairs(buf_nums) do
            if buf_name ~= "" and buf_name == vim.api.nvim_buf_get_name(buf_num) then
                buf_ids[#buf_ids + 1] = buf_num
            end
        end
    end
    return buf_ids
end

local group = vim.api.nvim_create_augroup("ScopeAU", {})
vim.api.nvim_create_autocmd("TabEnter", { group = group, callback = M.on_tab_enter })
vim.api.nvim_create_autocmd("TabLeave", { group = group, callback = M.on_tab_leave })
vim.api.nvim_create_autocmd("TabClosed", { group = group, callback = M.on_tab_closed })
vim.api.nvim_create_autocmd("TabNewEntered", { group = group, callback = M.on_tab_new_entered })
vim.api.nvim_create_user_command("ScopeSaveState", function() M.on_tab_leave() M.on_tab_enter() M.save_state() end, {})
vim.api.nvim_create_user_command("ScopeLoadState", M.load_state, {})
vim.api.nvim_create_user_command("ScopeList", M.print_summary, {}) --TODO: improve this
if M.config.restore_state then
    vim.api.nvim_create_autocmd("SessionLoadPost", { group = group, callback = M.load_state }) --TODO: implement event behavior
end
vim.api.nvim_create_user_command("ScopeveBuf", M.move_current_buf, { nargs = "?" }) --TODO: improve this

return M
