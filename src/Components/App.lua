local root = script.Parent.Parent
local Fusion = require(root.Packages.Fusion)
local New = Fusion.New
local Provider = require(root.Provider)
local Style = require(root.Style)

local function Button(props)
    local style = Style()
    return New "TextButton" {
        Text = "click me to randomize the oclor",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = style.Color,
        [Fusion.OnEvent "Activated"] = function()
            props.onclick()
        end
    }
end

local function App(props)
    local style = Style({
        Color = Fusion.Value(Color3.fromRGB(255, 0, 0)),
    })
    
    return Button {
        onclick = function()
            style.Color:set(Color3.new(math.random(), math.random(), math.random()))
        end
    }
end

print("provider " .. tostring(getmetatable(Provider).__call))
return function(props) -- Provider wrapper
    return Provider(App, props)
end