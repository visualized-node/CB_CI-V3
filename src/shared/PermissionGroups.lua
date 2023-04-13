local PermissionGroup = require(script.Parent.builders.PermissionGroupBuilder)

local Permission = require(script.Parent.Permission)

local PermissionGroups = {
    Owner = PermissionGroup.new("Owner", nil, {Permission.RUNS_ADMIN_COMMANDS, Permission.RUNS_FUN_COMMANDS, Permission.RUNS_NORMAL_COMMANDS, Permission.RUNS_SERVERHANDLER_COMMANDS }),
    Admin = PermissionGroup.new("Admin", nil, {Permission.RUNS_ADMIN_COMMANDS, Permission.RUNS_FUN_COMMANDS, Permission.RUNS_NORMAL_COMMANDS }),
    Moderator = PermissionGroup.new("Moderator", nil, {Permission.RUNS_RESTRICTED_ADMIN_COMMANDS, Permission.RUNS_FUN_COMMANDS, Permission.RUNS_NORMAL_COMMANDS }),
    Vip = PermissionGroup.new("VIP", nil, { Permission.RUNS_FUN_COMMANDS, Permission.RUNS_NORMAL_COMMANDS }),
    GenericPlayer = PermissionGroup.new("Generic", nil, { Permission.RUNS_NORMAL_COMMANDS })
}

return PermissionGroups