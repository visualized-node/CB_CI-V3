local CommandParser = {}

local Commands = require(script.Parent.Commands)
local Errors, Settings = require(script.Parent.types.Errors), require(script.Parent.Settings)
local Utils = require(script.Parent.InternalUtils)

function CommandParser.Parse(Sender: Player, Message: string)
    if Message:sub(1, 1) ~= Settings.Prefix then return end

    local CommandBody = Message:sub(2, #Message)
    local Args = CommandBody:split(Settings.ArgumentSeparator)

    if not Args[1] then return Errors.CMDNONAME end

    local Command = Commands[Args[1]:lower()] or nil

    if not Command then return Errors.DOESNTEXIST end
    if not Utils.HasPermission(Sender, Command) then return Errors.NOPERMISSION end

    pcall(function()
        -- Output run success and 

        print(string.format("CommandParser ~ Success running command '%s'", Command[1]))

        coroutine.resume(coroutine.create(Command[3]))
    end)

    return Errors.SUCCESS
end

return CommandParser