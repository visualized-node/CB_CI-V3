local ParsedMessageBuilder = {}

local CB_CI = script.Parent.Parent
local Settings = require(CB_CI.Settings)

ParsedMessageBuilder.__index = ParsedMessageBuilder

function ParsedMessageBuilder.new(Sender: Player, Message: string)
    if Message:sub(1, 1) ~= Settings.Prefix then
        return
    end

    local ThisParsedMessage = {}

    setmetatable(ThisParsedMessage, ParsedMessageBuilder)

    ThisParsedMessage.CommandName = nil
    ThisParsedMessage.Args = nil
    ThisParsedMessage.PlayerPermissionGroup = nil
    ThisParsedMessage.Player = Sender
    ThisParsedMessage.OriginalMessage = Message
    
    local OArgs = Message:sub(2, #Message):split(Settings.ARG_SEP)
    
    if not OArgs[1] then
        setmetatable(ParsedMessageBuilder, nil)
    end

    ThisParsedMessage.CommandName = OArgs[1]
    table.remove(OArgs, 1)
    ThisParsedMessage.Args = OArgs

    return ThisParsedMessage
end

return ParsedMessageBuilder