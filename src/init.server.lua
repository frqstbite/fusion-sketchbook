local root = script
local Fusion = require(root.Packages.Fusion)
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local Out = Fusion.Out
local Value = Fusion.Value
local Plugin = require(root.Plugin)(plugin)
local DockWidget = Plugin.DockWidget
local Toolbar = Plugin.Toolbar
local ToolbarButton = Plugin.ToolbarButton
local App = require(root.Components.App)

local PACKAGE = "frqstbite/sketchbook"

local function WidgetId(id)
    return PACKAGE .. "/widgets/" .. id
end

local open = Value(false)

Toolbar "Fusion Sketchbook" {
    ToolbarButton "sketchbook" {
        Text = "Sketchbook",
        Tooltip = "Open Sketchbook interface",
        Active = open,
        Icon = "rbxassetid://4458900760",
        ClickableWhenViewportHidden = true,

        [OnEvent "Click"] = function()
            open:set(not open:get())
        end
    },
}

DockWidget (WidgetId "sketchbook") {
    Size = Vector2.new(400, 300),
    Enabled = open,
    [Out "Enabled"] = open,
    [Children] = App {
        plugin = plugin,
    }
}