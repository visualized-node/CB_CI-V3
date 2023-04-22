local Commands = {}

local CB_CI = script.Parent.Parent
local CommandBuilder, CEnum = require(CB_CI.builders.CommandBuilder), require(CB_CI.interfaces.CommandEnums)

Commands["ping"] = CommandBuilder.new("ping", CEnum.Permissions.NORMAL, function(Player, Sender) 
    print("Pong!")

    return CEnum.Errors.SUCCESS
end)

return Commands