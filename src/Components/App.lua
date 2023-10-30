local root = script.Parent.Parent
local Fusion = require(root.Packages.Fusion)
local New = Fusion.New
local Provider = require(root.Provider)
local useTheme = require(root.Theme).useTheme

local function App(props)
    local theme = useTheme()
    
    return New "ImageLabel" {
        Size = UDim2.fromScale(1, 1),
        Image = "rbxassetid://15212230250",
        ScaleType = Enum.ScaleType.Crop,
    }
end

return function(props) -- Provider wrapper
    return Provider(App, props)
end