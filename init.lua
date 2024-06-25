-- basics
require("user.opts")
require("user.autocmds")
require("user.maps")
require("user.scope")
require("user.themer")

-- can be loaded asynchronously
vim.defer_fn(function()
    require("user.statusline").setup()
    require("user.bufdel")
end, 100)

require("user.plug")
