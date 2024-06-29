-- basics
require("user.opts")
require("user.autocmds")
require("user.maps")
require("user.scope")
require("user.themer")

-- can be loaded asynchronously
vim.defer_fn(function()
    require("user.bufdel")
    require("user.ui")
end, 100)

-- other plugin stuff
require("user.plug")
