local Commands = {}
local PermissionGroups = require(script.PermissionGroups)
local CommandParser = require(script.CommandParser)

function Commands.FastParse(Player: Player, Message: string)
    CommandParser.Parse(Player, Message)
end

function Commands.GetParser()
    return CommandParser
end

function Commands.GetPermissionGroups()
    return PermissionGroups
end

return Commands