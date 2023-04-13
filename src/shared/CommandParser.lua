local CommandParser = {}

local Commands = require(script.Parent.Commands)
local Errors, Settings = require(script.Parent.types.Errors), require(script.Parent.Settings)

function CommandParser.Parse(Sender: Player, Message: string)
    if Message:sub(1, 1) ~= Settings.Prefix then return end

    local CommandBody = Message:sub(2, #Message)
    local Args = CommandBody:split(Settings.ArgumentSeparator)

    if #Args == 1 then return Errors.CMDINVALID end
    if not Args[1] then return Errors.CMDNONAME end

    local Command = Commands[Args[1]] or nil

    if not Command then return Errors.DOESNTEXIST end
end

return CommandParser