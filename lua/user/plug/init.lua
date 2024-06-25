local install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- install lazy.nvim if we don't have it
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print("Installing folke/lazy.nvim (plugin manager)... ")
    Bootstrapped = vim.fn.system({ "git", "clone", "--depth", "1", "--filter=blob:none", "https://github.com/folke/lazy.nvim", install_path })
end

-- add lazy.nvim to the runtime path
vim.opt.rtp:prepend(install_path)

local plugins = {
    -- session support
    { "stevearc/resession.nvim",
        lazy = false,
        config = function()
            vim.defer_fn(function()
                require "user.plug.resession"
            end, 100)
        end,
    },

    -- splash screen
    { "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            require "user.plug.alpha"
        end,
    },

    -- preview hex color codes
    { "NvChad/nvim-colorizer.lua",
        event = {
            "BufReadPost",
            "BufNewFile",
            "BufWrite",
        },
        opts = {
            user_default_options = {
                RGB      = false,
                RRGGBB   = true,
                names    = false,
                RRGGBBAA = true,
                rgb_fn   = true,
                hsl_fn   = true,
                css      = false,
                css_fn   = false,
                mode     = 'background',
            }
        },
    },

    -- language icons
    "nvim-tree/nvim-web-devicons",

    -- highlight current word
    { "RRethy/vim-illuminate",
        event = {
            "BufReadPost",
            "BufNewFile",
            "BufWrite",
        },
        config = function()
            require "user.plug.illuminate"
        end,
    },

    -- file manager pane
    { "nvim-tree/nvim-tree.lua",
        cmd = {
            "NvimTreeToggle",
            "NvimTreeOpen",
            "NvimTreeClose",
            "NvimTreeRefresh",
            "NvimTreeFindFile",
            "NvimTreeFindFileToggle",
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require "user.plug.nvimtree"
        end,
    },

    -- vscode-like indent indicator
    { "lukas-reineke/indent-blankline.nvim",
        event = {
            "BufReadPost",
            "BufNewFile",
            "BufWrite",
        },
        main = "ibl",
        config = function()
            if vim.g.termgui == true then require "user.plug.indentline" end
        end,
    },
}

local opts = {
    -- plugin install dir
    root = vim.fn.stdpath("data") .. "/lazy",
    lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json", -- lockfile generated after running update.

    defaults = {
        lazy = true,
        version = "*",
        cond = nil,
    },

    git = {
        log = { "-8" },
        timeout = 120,
        url_format = "https://github.com/%s.git",
        filter = true, -- set to false to ease  git >=2.19.0 dependency
    },

    install = {
        missing = true,
        colorscheme = { "default" },
    },

    ui = {
        size = { width = 0.8, height = 0.8 },
        wrap = true,
        border = "single",
        title_pos = "center", ---@type "center" | "left" | "right"
        pills = true, ---@type boolean
        throttle = 20, -- how frequently should the ui process render events
    },

    diff = {
        -- diff command <d> can be one of:
        -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
        --   so you can have a different command for diff <d>
        -- * git: will run git diff and open a buffer with filetype git
        -- * terminal_git: will open a pseudo terminal with git diff
        -- * diffview.nvim: will open Diffview to show the diff
        cmd = "git",
    },

    checker = {
        -- automatically check for plugin updates
        enabled = false,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = true, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
        check_pinned = false, -- check for pinned packages that can't be updated
    },

    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = false, -- get a notification when changes are found
    },

    performance = {
        cache = { enabled = true },
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
            paths = {},
            disabled_plugins = {
                "2html_plugin",
                "archlinux",
                "bugreport",
                "compiler",
                "ftplugin",
                "fzf",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "man",
                "matchit",
                "matchparen",
                "netrw",
                "netrwFileHandlers",
                "netrwPlugin",
                "netrwSettings",
                "optwin",
                "rplugin",
                "rrhelper",
                "sleuth",
                "spellfile_plugin",
                "synmenu",
                "syntax",
                "tar",
                "tarPlugin",
                "tohtml",
                "tutor",
                "tutor_mode_plugin",
                "vimball",
                "vimballPlugin",
                "vimgrep",
                "zip",
                "zipPlugin"
            },
        },
    },

    -- lazy can generate helptags from the headings in markdown readme files,
    -- so :help works even for plugins that don't have vim docs.
    -- when the readme opens with :help it will be correctly displayed as markdown
    readme = {
        enabled = false,
        root = vim.fn.stdpath("state") .. "/lazy/readme",
        files = { "README.md", "lua/**/README.md" },
        skip_if_doc_exists = true,
    },

    state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things

    build = {
        warn_on_override = true,
    },

    profiling = {
        loader = false,
        require = true,
    },
}

-- try to require lazy.nvim
local lazy_status_ok, lazy = pcall(require, "lazy")
if not lazy_status_ok then
    return
end

lazy.setup(plugins, opts)
