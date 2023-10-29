local root = script.Parent.Parent
local Fusion = require(root.Packages.Fusion)
local Cleanup = Fusion.Cleanup
local Hydrate = Fusion.Hydrate
local Observer = Fusion.Observer
local unwrap = require(root.unwrap)

local function ToolbarButton(id: string)
    return function(props: {[string]: any})
        props = props or {}
        
        return function(toolbar: PluginToolbar)
            local button = toolbar:CreateButton(id, unwrap(props.Tooltip), unwrap(props.Icon), unwrap(props.Text))
            
            local active = props.Active
            if unwrap(active) ~= active then
                props[Cleanup] = {
                    Observer(active):onChange(function()
                        button:SetActive(active:get() or false)
                    end)
                }
            end

            props.Tooltip = nil
            props.Text = nil
            props.Active = nil
            return Hydrate(button)(props)
        end
    end
end

return ToolbarButton