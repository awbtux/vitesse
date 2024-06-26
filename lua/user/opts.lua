-- options/globals

local globals = {
    mapleader = " ",
    maplocalleader = " ",
    termgui = false,
    cmp_border_color = "grey_fg",
    cmp_icons = true,
    cmp_lspkind_text = true,
    cmp_selection_bg = "colored",
    cmp_style = "default",
    telescope_style = "bordered",
}

local settings = {
    autoindent = true,
    autoread = true,
    autowrite = true,
    background = "dark",
    backspace = {
        "indent",
        "eol",
        "start",
    },
    backup = false,
    clipboard = "unnamedplus",
    compatible = false,
    completeopt = {
        "menuone",
        "noselect",
    },
    cmdheight = 1,
    conceallevel = 0,
    cursorline = true,
    encoding = "UTF-8",
    errorbells = false,
    expandtab = true,
    exrc = true,
    fileencoding = "UTF-8",
    fileformat = "unix",
    foldenable = false,
    foldlevel = 0,
    foldmethod = "indent",
    foldnestmax = 16,
    guifont = "monospace:h9",
    hidden = true,
    history = 1024,
    hlsearch = true,
    incsearch = true,
    laststatus = 3,
    lazyredraw = true,
    list = true,
    listchars = "tab:>-,trail:.,extends:>,precedes:<,nbsp:+",
    magic = true,
    mouse = "a",
    number = true,
    numberwidth = 4,
    pumheight = 10,
    relativenumber = true,
    ruler = true,
    scrolloff = 24,
    sessionoptions = {
        "curdir",
        "folds",
        "globals",
        "help",
        "buffers",
        "tabpages",
        "terminal",
        "winsize",
    },
    shell = vim.fn.getenv("SHELL"),
    shiftround = true,
    shiftwidth = 4,
    shortmess = "atI",
    showmode = false,
    showtabline = 2,
    sidescrolloff = 12,
    signcolumn = "yes",
    smartcase = true,
    smarttab = true,
    softtabstop = 4,
    spelllang = "en_us",
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    termguicolors = false,
    timeoutlen = 300,
    ttimeoutlen = 300,
    undofile = true,
    undolevels = 1024,
    updatetime = 256,
    viminfo = "",
    visualbell = true,
    wildmenu = true,
    wildmode = {
        "longest",
        "list",
        "full",
    },
    wrap = false,
    writebackup = true,
}

-- parse settings/globals
for k, v in pairs(settings) do vim.opt[k] = v end
for k, v in pairs(globals) do vim.g[k] = v end

-- use unix path delimiter on windows
if vim.fn.exists("+shellslash") == 1 then
    vim.opt.shellslash = true
end

-- decide how to set up colors
if vim.fn.getenv('DISPLAY') ~= vim.NIL or vim.fn.getenv('WAYLAND_DISPLAY') ~= vim.NIL then
    vim.opt.termguicolors = true
    vim.g.termgui = true
end
