local CommandBuilder = require(script.Parent.builders.CommandBuilder)
local Permission = require(script.Parent.Permission)
local Errors = require(script.Parent.types.Errors)
local Settings = require(script.Parent.Settings)

local Commands = {
	["test"] = {
		"test",
		Permission.RUNS_SERVERHANDLER_COMMANDS,
		function() end
	}
}

CommandBuilder.new(Commands, "ping", Permission.RUNS_NORMAL_COMMANDS, function(Player: Player, Args: {string}) 
	print("Pong!")

	return Errors.SUCCESS
end)

return Commands