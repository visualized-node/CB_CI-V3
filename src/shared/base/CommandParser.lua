local CommandParser = {}

local CB_CI = script.Parent.Parent
local ParsedMessageBuilder = require(CB_CI.builders.ParsedMessageBuilder)

function CommandParser.Parse(Sender: Player, Message: string)
    local ParsedMessage = ParsedMessageBuilder.new(Sender, Message)
end

return CommandParser