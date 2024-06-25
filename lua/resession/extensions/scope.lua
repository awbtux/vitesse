local scope = require("user.scope")

local M = {}

M.on_save = function()
    scope.revalidate()
    return { state = scope.serialize_state() }
end

M.on_load = function(data)
    scope.deserialize_state(data.state)
end

return M
