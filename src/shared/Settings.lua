local Settings = {
    -- Important
    Prefix = "/", -- Defines the Prefix of a command (ex. /kick)
    ArgumentSeparator = " ", -- Defines the character used to separate arguments in a command (ex. Sep = ".", /kick.Hello.World)
    HasAccessToStore = false, -- If the module has access to the DataStoreService service in roblox
    FollowPermissionGroups = true, -- Uses the Permission Groups such as Member, Admin, Owner
    
    -- Groups

    PermissionGroupsUseGroup = false,
    GroupId = 0, -- 0 if the value above is false

    -- Permissions

    PlayerCanRunCommands = true, -- players without a PermissionGroup correlation automatically have access to Normal level commands

    -- Command

    MinimumCommandLength = 2,
    MaximumCommandLength = 15
}

return Settings