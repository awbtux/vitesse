-- some plugin-specific binds located in their respective files

local opts = { noremap = true, silent = true }
local bind = vim.api.nvim_set_keymap

-- leader is mapped to space
bind("", "<Space>", "<Nop>", opts)

-- don't overwrite the yank buffer when pasting over selected text
bind("v", "p", '"_dp', opts)

-- don't overwrite the yank buffer when deleting text
bind("", "x", '"_x', opts)
bind("", "X", '"_X', opts)
bind("", "<Del>", '"_x', opts)

-- better split management
bind("", "<S-Up>", ":resize +2<LF>", opts)
bind("", "<S-Down>", ":resize -2<LF>", opts)
bind("", "<S-Right>", ":vertical resize +2<LF>", opts)
bind("", "<S-Left>", ":vertical resize -2<LF>", opts)

-- navigate buffers/tabs
bind("", "<S-l>", ":bnext<LF>", opts)
bind("", "<S-h>", ":bprevious<LF>", opts)
bind("", "<M-l>", ":tabnext<LF>", opts)
bind("", "<M-h>", ":tabprevious<LF>", opts)

-- easier moving on wrapped lines
bind("", "j", "gj", opts)
bind("", "k", "gk", opts)

-- arrow keys use this behavior
bind("", "<Down>", "gj", opts)
bind("", "<Up>", "gk", opts)

-- use this behavior in insert mode
bind("i", "<Down>", "<C-o>gj", opts)
bind("i", "<Up>", "<C-o>gk", opts)

-- re-select vmode text after indent
bind("v", "<", "<gv", opts)
bind("v", ">", ">gv", opts)

-- move text up and down in visual / vblock
bind("v", "J", ":move '>+1<LF>gv-gv", opts)
bind("v", "K", ":move '<-2<LF>gv-gv", opts)

-- better multiline insert
bind("v", "i", "<S-i>", opts)
bind("v", "<S-i>", "^<S-i>", opts)
bind("v", "a", "<S-a>", opts)
bind("v", "<S-a>", "$<S-a>", opts)

-- ctrl-s to save
bind("n", "<C-s>", ":w<LF>", opts)
bind("i", "<C-s>", "<C-o>:w<LF>", opts)

-- misc. leader keymaps
bind("n", "<leader>q", ":qa!<LF>", opts)
bind("n", "<leader>w", ":wa!<LF>:qa!<LF>", opts)

-- unmap standard keys if they are annoying
bind("i", "kj", "<ESC><C-l>", opts)
--bind("v", "kj", "<ESC><C-l>", opts)
--bind("x", "kj", "<ESC><C-l>", opts)

-- force the user to use these alternatives
bind("i", "<ESC>", "<C-o>:echo \"Press \'k\' and \'j\' in quick succession to exit insert mode.\"<LF>", opts)
--bind("v", "<ESC>", ":<C-u>echo \"Press \'k\' and \'j\' in quick succession to exit visual mode.\"<LF>gv", opts)
--bind("x", "<ESC>", ":<C-u>echo \"Press \'k\' and \'j\' in quick succession to exit visual-block mode.\"<LF>gv", opts)

-- redraw screen, just like in bash
bind("n", "<C-l>", ":nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<LF><LF><C-l>", opts)

-- split movement
bind("n", "<M-S-h>", "<C-w>h", opts)
bind("n", "<M-S-j>", "<C-w>j", opts)
bind("n", "<M-S-k>", "<C-w>k", opts)
bind("n", "<M-S-l>", "<C-w>l", opts)

-- fold shortcut
bind("n", "zz", "zA", opts)

-- plugins
bind("n", "<leader>p", ":Lazy<LF>", opts)
bind("n", "<leader>ff", ":Telescope find_files find_command=find,-xdev,-maxdepth,4<LF>", opts)
bind("n", "<leader>fd", ":Telescope lsp_definitions<LF>", opts)
bind("n", "<leader>fg", ":Telescope live_grep<LF>", opts)
bind("n", "<leader>fb", ":Telescope scope buffers<LF>", opts)
bind("n", "<leader>fh", ":Telescope help_tags<LF>", opts)
bind("n", "<leader>fs", ":Telescope lsp_document_symbols<LF>", opts)
bind("n", "<leader>fo", ":Telescope oldfiles<LF>", opts)
bind("n", "<leader>fw", ":Telescope grep_string<LF>", opts)
bind("n", "<leader>gc", ":Telescope git_commits<LF>", opts)
bind("n", "<leader>gb", ":Telescope git_bcommits<LF>", opts)
--bind("n", "<leader>t", ":ToggleTerm<LF>", opts)
bind("n", "<leader>t", ":terminal<LF>", opts)
bind("n", "<leader>T", ":vsplit | terminal<LF>", opts)
bind("n", "Q", ':Bdelete!<LF>', opts)

-- nvim tree keybinds
bind("n", "<leader>n", ":NvimTreeToggle<LF>", opts)
bind("n", "<C-n>", ":NvimTreeToggle<LF>", opts)
