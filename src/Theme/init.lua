local root = script.Parent
local Cascade = require(root.Cascade)

local THEME_EXTENSION = ".theme"

-- Load themes
local themes = {}
for _, descendant in ipairs(script:GetDescendants()) do
    if descendant:IsA("ModuleScript") and descendant.Name:sub(-#THEME_EXTENSION) == THEME_EXTENSION then
        local name = descendant.Name:sub(1, -#THEME_EXTENSION - 1)
        themes[name] = require(descendant)
    end
end

local Theme = Cascade("FusionDoc")

local function useTheme()
    return themes[Theme:get()]["dark"]
end

return setmetatable({
    useTheme = useTheme,
}, {
    __index = Theme,
})