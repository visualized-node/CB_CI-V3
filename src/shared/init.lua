--[[
    https://github.com/visualized-node/CB_CI-V3

     ██████╗██████╗          ██████╗██╗    ██╗   ██╗██████╗ 
    ██╔════╝██╔══██╗        ██╔════╝██║    ██║   ██║╚════██╗
    ██║     ██████╔╝        ██║     ██║    ██║   ██║ █████╔╝
    ██║     ██╔══██╗        ██║     ██║    ╚██╗ ██╔╝ ╚═══██╗
    ╚██████╗██████╔╝███████╗╚██████╗██║     ╚████╔╝ ██████╔╝
    ╚═════╝╚═════╝ ╚══════╝ ╚═════╝╚═╝      ╚═══╝  ╚═════╝ 
                               
        This is the init.lua (Root) of CB_CI,

    aka where everything is connected together,

        like us people in real life :)

    ::FastParse() to parse without having to include CommandParser
    ::GetAddons() to get addons
    ::GetSettings() to get all the settings

    more methods to be added...

    Enjoy, :P
]]

local CB_CI = {}

local addons = script.addons
local Settings, CommandParser, Utils = require(script.Settings), require(script.base.CommandParser), require(script.internals.GlobUtils)

function CB_CI.FastParse()
    
end

function CB_CI.GetAddons()
    return Utils.GetAddons()
end

function CB_CI.GetSettings()
    return Settings
end

return CB_CI