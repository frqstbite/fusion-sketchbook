return function(plugin: Plugin)
    local root = script.Parent.Parent
    local Fusion = require(root.Packages.Fusion)
    local Hydrate = Fusion.Hydrate
    local unwrap = require(root.unwrap)

    local function DockWidget(id: string)
        return function(props: {[string]: any})
            props = props or {}
            assert(props.Size, "DockWidget requires a Size property")
            
            -- Create widget
            local size = unwrap(props.Size)
            local minimumSize = unwrap(props.MinimumSize)
            local widget = plugin:CreateDockWidgetPluginGui(id, DockWidgetPluginGuiInfo.new(
                Enum.InitialDockState.Float,
                false,
                false,
                size.X,
                size.Y,
                if minimumSize then minimumSize.X else size.X,
                if minimumSize then minimumSize.Y else size.Y
            ))
            
            props.Name = id
            props.Size = nil
            props.MinimumSize = nil
            return Hydrate(widget)(props)
        end
    end

    return DockWidget
end