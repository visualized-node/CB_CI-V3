local CommandBuilder = {}

CommandBuilder.__index = CommandBuilder

local CB_CI = script.Parent.Parent

local Types = require(CB_CI.Types)
local Logger, Thread, CEnum = require(CB_CI.internals.Logger), require(CB_CI.internals.Thread), require(CB_CI.interfaces.CommandEnums)

function CommandBuilder.new(CommandName: string | Types.TStrings, MinPermission: Types.GenericPermission, Callback: Types.CommandCallback)
    local ThisCommand = {}

    setmetatable(ThisCommand, CommandBuilder)

    ThisCommand.CommandName = CommandName
    ThisCommand.MinPermission = MinPermission
    ThisCommand.Callback = Callback

    return ThisCommand
end

function CommandBuilder:Run(Sender: Player, Args: Types.TStrings)
    local CommandThread = Thread.RegisterRoutineThread(self.Callback, Sender, Args):Run()

    return CommandThread
end

return CommandBuilder