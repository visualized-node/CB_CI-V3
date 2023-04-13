local Commands = {}
local PermissionGroups, PermissionGroup = require(script.PermissionGroups)

function Commands.GetParser()
    return require(script.CommandParser)
end

function Commands.RegisterPermissionGroup(name: string, holders: {number}?, permissions: {number}, groupidentifier: number? | string?)
    PermissionGroup.new(name, holders, permissions, groupidentifier)
end

function Commands.GetPermissionGroups()
    return PermissionGroups
end

return Commands