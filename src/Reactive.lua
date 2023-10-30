local root = script.Parent
local Fusion = require(root.Packages.Fusion)
local Computed = Fusion.Computed
local unwrap = require(root.unwrap)

local function Reactive(value)
    return setmetatable({}, {
        __index = function(_, key)
            return Computed(function()
                return unwrap(value)[key]
            end)
        end,
        __newindex = function(_, key, newValue)
            local unwrapped = unwrap(value)
            unwrapped[key] = newValue
            value:set(unwrapped)
        end,
    })
end

return Reactive