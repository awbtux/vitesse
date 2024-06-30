-- ui stuff

-- options for status line
local statusline_opts = {
    set_vim_settings = false,
    use_icons = vim.g.termgui
}

-- options for file picker
local files_opts = {
    content = {
        filter = nil,
        prefix = nil,
        sort = nil,
    },
    mappings = {
        close = 'q',
        go_in = 'l',
        go_in_plus = 'L',
        go_out = 'h',
        go_out_plus = 'H',
        reset = '<BS>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
    },
    options = {
        permanent_delete = true,
        use_as_default_explorer = true,
    },
    windows = {
        max_number = math.huge,
        preview = false,
        width_focus = 50,
        width_nofocus = 15,
        width_preview = 25,
    }
}

-- load ministatusline
require("user.ui.statusline").setup(statusline_opts)

-- load minifiles
require("user.ui.files").setup(files_opts)
