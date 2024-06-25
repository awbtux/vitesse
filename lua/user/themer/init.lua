-- theme generator

-- dirs
local colors_dir = vim.fn.stdpath("config") .. "/colors"
local integration_path = debug.getinfo(1, "S").source:match("@?(.*/)") .. "integrations"
local palette_path = debug.getinfo(1, "S").source:match("@?(.*/)") .. "palettes"

-- highlight overrides
local hl_overrides = {}

-- redraw screen after each msg
function vimprint(...)
    local message = string.format(...)
    vim.api.nvim_out_write(message .. "\n")
    vim.api.nvim_command("redraw")
end

-- convert highlight group tables to strings
function table2string(table)
    local result = ""

    for hlgroupname, hlgroup_vals in pairs(table) do
        local hlname = "'" .. hlgroupname .. "',"
        local opts = ""
        for optName, optVal in pairs(hlgroup_vals) do
            local valueInStr = ((type(optVal)) == "boolean" or type(optVal) == "number") and tostring(optVal)
                or '"' .. optVal .. '"'
            opts = opts .. optName .. "=" .. valueInStr .. ","
        end
        result = result .. "H(0," .. hlname .. "{" .. opts .. "}) "
    end

    return result
end

-- after compile
function done(in_progress, themecount, start_time)
    vim.defer_fn(function()
        if not in_progress then
            vimprint(" ")
        end
    end, 5000)
    local elapsed_time = (vim.loop.hrtime() - start_time) / 1000000000
    print(string.format("Compiled %d themes to %s in %.3f second%s", themecount, colors_dir, elapsed_time, math.floor(elapsed_time) ~= 1 and "s" or ""))
end

-- write an individual palette file
function write(scheme, themecount, palettecount)
    local result = string.format('vim.cmd("hi clear") vim.g.colors_name = "%s" vim.opt.background = "%s" local H = vim.api.nvim_set_hl ', scheme.scheme_name, scheme.type)
    local filename = colors_dir .. "/" .. scheme.scheme_name .. ".lua"

    vimprint("Compiling (%d/%d): %s", themecount, palettecount, scheme.scheme_name .. ".lua")

    for _, integration in ipairs(vim.fn.readdir(integration_path)) do
        local stat = vim.loop.fs_stat(integration_path .. "/" .. integration)
        if not stat or stat.type == "directory" or vim.fn.filereadable(integration_path .. "/" .. integration) ~= 1 then
            goto continue
        end
        local integrationname = vim.fs.basename(integration_path .. "/" .. integration)
        integrationname = integrationname:gsub('%.lua$', '')

        local highlights = dofile(integration_path .. "/" .. integration).set(scheme)
        if scheme.polishhl and scheme.polishhl[integrationname] then
            highlights = vim.tbl_deep_extend("force", highlights, scheme.polishhl[integrationname])
        end
        if hl_overrides and hl_overrides[integrationname] then
            highlights = vim.tbl_deep_extend("force", highlights, hl_overrides[integrationname])
        end

        result = result .. table2string(highlights)
        ::continue::
    end

    if vim.loop.fs_stat(integration_path .. "/misc/term.lua") then
        local termscheme = dofile(integration_path .. "/misc/term.lua").set(scheme)
        for colname, colval in pairs(termscheme) do
            result = result .. string.format(' vim.g.%s = "%s" ', colname, colval)
        end
    end
    if vim.loop.fs_stat(integration_path .. "/misc/transparent.lua") then
        result = result .. "if vim.g.transparency then " .. table2string(dofile(integration_path .. "/misc/transparent.lua").set(scheme)) .. ' vim.g.terminal_color_0 = "" vim.g.terminal_color_8 = "" end'
    end

    local file = io.open(filename, "w") if not file then
        error(string.format("%s: Unable to open file for writing", filename))
    end
    file:write(result)
    file:close()
end

-- compile themes
function compile()
    if not vim.loop.fs_stat(colors_dir) then
        vim.fn.mkdir(colors_dir, "p")
    end
    if not vim.loop.fs_stat(palette_path) then
        error "Palette path does not exist!" return
    end
    if not vim.loop.fs_stat(integration_path) then
        error "Integration path does not exist!" return
    end

    local themecount = 1
    local palettecount = #vim.fn.readdir(palette_path)
    local in_progress = true
    local start_time = vim.loop.hrtime()

    for _, palettefile in ipairs(vim.fn.readdir(palette_path)) do
        write(dofile(palette_path .. "/" .. palettefile), themecount, palettecount)
        themecount = themecount + 1
    end
    if vim.loop.fs_stat(colors_dir .. "/theme").type == "file" then
        pcall(dofile, colors_dir .. "/theme")
    end
    vim.defer_fn(function() done(false, themecount, start_time) end, 0)
end

-- update the vim theme when it is changed by the environment
vim.defer_fn(function()
    if not vim.loop.fs_stat(colors_dir .. "/theme").type == "file" then
        return
    end
    local w = vim.loop.new_fs_event()
    function watch_file()
        w:start(colors_dir .. "/theme", {}, vim.schedule_wrap(function(...) retheme(...) end))
    end
    function retheme(err, fname, status)
        pcall(dofile, colors_dir .. "/theme")
        w:stop()
        watch_file(colors_dir .. "/theme")
    end
    watch_file()
end, 1000)

-- run
vim.api.nvim_create_user_command("ThemeCompile", compile, {})
vim.api.nvim_create_user_command("Retheme", function() pcall(dofile, colors_dir .. "/theme") end, {})
vim.defer_fn(function() if #vim.fn.readdir(colors_dir) <= 3 then compile() end end, 0)
if vim.loop.fs_stat(colors_dir .. "/theme").type == "file" then
    pcall(dofile, colors_dir .. "/theme")
end
