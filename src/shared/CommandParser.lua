local CommandParser = {}

local Errors, Settings = require(script.Parent.Errors), require(script.Parent.Settings)

function CommandParser.Parse(Sender: Player, Message: string)
    if Message:sub(1, 1) ~= Settings.Prefix then return end


end

return CommandParser