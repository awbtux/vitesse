-- automatically run commands on certain events

local autocmd = vim.api.nvim_create_autocmd

-- don't automatically continue commments
autocmd("FileType", { pattern = "*", command = "setlocal formatoptions-=cro" })

-- automatically close these windows with 'q'
autocmd("FileType", { pattern = { "netrw", "Jaq", "qf", "git", "help", "man", "lspinfo", "spectre_panel", "lir", "DressingSelect", "tsplayground", "" }, callback = function() vim.cmd("nnoremap <silent> <buffer> q :close<LF>") vim.opt.buflisted = false end, })

-- close cmd windows (they're useless)
autocmd("CmdWinEnter", { callback = function() vim.cmd("quit") end })

-- disable line numbers for terminal buffers
autocmd("TermOpen", { pattern = 'term://*', callback = function() vim.cmd("sil! NvimTreeClose") vim.cmd("setlocal nonu nornu scl=no") vim.cmd("startinsert") end, })

-- display yanked text briefly
autocmd("TextYankPost", { callback = function() if vim.highlight.on_yank then vim.highlight.on_yank { higroup = "Visual", timeout = 50 } end end })

-- keys that can wrap to the next line
autocmd("FileType", { pattern = "*", command = "set whichwrap+=<,>,[,],h,l iskeyword+=-" })

-- splits stay equal
autocmd("VimResized", { command = "tabdo wincmd =" })

-- remove trailing whitespaces from the end of lines
autocmd("BufWritePre", { pattern = "*", command = ":%s/\\s\\+$//e" })

-- create nonexistent path components
autocmd("BufWritePre", { pattern = "*", callback = function() if vim.fn.isdirectory(vim.fn.expand('%:p:h')) ~= 1 then vim.fn.system({ "mkdir", "-p", "--", vim.fn.expand('%:p:h') }) end end })

-- when Xresources is modified, update it
autocmd("BufWritePost", { pattern = { "*Xresources", "*Xdefaults", "*xresources", "*xdefaults" }, command = "silent! !xrdb %" })
