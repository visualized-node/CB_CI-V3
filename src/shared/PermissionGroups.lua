local PermissionGroup = {}

local Permission = require(script.Parent.Permission)

PermissionGroup.__index = PermissionGroup

function PermissionGroup.new(name: string, holders: {number}?, permissions: {number}, groupidentifier: number? | string?)
    local tPermissionGroup = {}

    setmetatable(tPermissionGroup, PermissionGroup)

    tPermissionGroup.Name = name
    tPermissionGroup.Permissions = permissions
    tPermissionGroup.CanRunAdmin = table.find(permissions, Permission.RUNS_ADMIN_COMMANDS) and true or false
    tPermissionGroup.CanRunFun = table.find(permissions, Permission.RUNS_FUN_COMMANDS) and true or false
    tPermissionGroup.CanRunNormal = table.find(permissions, Permission.RUNS_NORMAL_COMMANDS) and true or false
    tPermissionGroup.CanRunHandler = table.find(permissions, Permission.RUNS_SERVERHANDLER_COMMANDS) and true or false
    tPermissionGroup.IfGroupUsesRank = false
    tPermissionGroup.Identifier = nil
    tPermissionGroup.Holders = holders or {}

    if groupidentifier then
        tPermissionGroup.IfGroupUsesRank = type(groupidentifier) == "number"
        tPermissionGroup.Identifier = groupidentifier
    end

    return tPermissionGroup
end

function PermissionGroup:Destruct()
    self:Destroy()
end

local PermissionGroups = {
    Owner = PermissionGroup.new("Owner", nil, {Permission.RUNS_ADMIN_COMMANDS, Permission.RUNS_FUN_COMMANDS, Permission.RUNS_NORMAL_COMMANDS, Permission.RUNS_SERVERHANDLER_COMMANDS }),
    Admin = PermissionGroup.new("Admin", nil, {Permission.RUNS_ADMIN_COMMANDS, Permission.RUNS_FUN_COMMANDS, Permission.RUNS_NORMAL_COMMANDS }),
    Moderator = PermissionGroup.new("Moderator", nil, {Permission.RUNS_RESTRICTED_ADMIN_COMMANDS, Permission.RUNS_FUN_COMMANDS, Permission.RUNS_NORMAL_COMMANDS }),
    Vip = PermissionGroup.new("VIP", nil, { Permission.RUNS_FUN_COMMANDS, Permission.RUNS_NORMAL_COMMANDS }),
    GenericPlayer = PermissionGroup.new("Generic", nil, { Permission.RUNS_NORMAL_COMMANDS })
}

return {PermissionGroups, PermissionGroup}