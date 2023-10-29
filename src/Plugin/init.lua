return function(plugin)
    return {
        DockWidget = require(script.DockWidget)(plugin),
        Toolbar = require(script.Toolbar)(plugin),
        ToolbarButton = require(script.ToolbarButton),
    }
end