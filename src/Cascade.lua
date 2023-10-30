local root = script.Parent
local Symbol = require(root.Packages.Symbol)
local Provider = require(root.Provider)
local Provide = Provider.Provide
local Inject = Provider.Inject

local class = {}
class.__index = class

function class:get()
    return Inject(self.key, self.defaultValue)
end

function class:with(value, render)
    Provide(self.key, value)
    return render()
end

local function Cascade(defaultValue)
    local self = setmetatable({
        key = Symbol(),
        defaultValue = defaultValue,
    }, class)

    return self
end

return Cascade