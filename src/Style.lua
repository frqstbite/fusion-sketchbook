local root = script.Parent
local Symbol = require(root.Packages.Symbol)
local Provider = require(root.Provider)
local Provide = Provider.Provide
local Inject = Provider.Inject

local KEY = Symbol "StyleCascade"

local function Style(value)
    if value then --Provide
        -- surprise!!! its just passed thru
        Provide(KEY, value)
        return value
    else --Inject
        return Inject(KEY)
    end
end

return Style