local CommandBuilder = require(script.Parent.builders.CommandBuilder)
local Permission = require(script.Parent.Permission)
local Errors = require(script.Parent.types.Errors)
local Settings = require(script.Parent.Settings)
local AddonAPI = require(script.Parent.AddonAPI)
local Utils = require(script.Parent.InternalUtils)

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

CommandBuilder.new(Commands, "reset", Permission.RUNS_NORMAL_COMMANDS, function(Player: Player, Args: {string})
	Player:LoadCharacter()

	return Errors.SUCCESS
end)

CommandBuilder.new(Commands, "end", Permission.RUNS_NORMAL_COMMANDS, function(Player: Player, Args: {string})
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local Humanoid: Humanoid = Character:FindFirstChild("Humanoid")

	if not Humanoid then return Errors.GENERIC_ERROR end

	Humanoid.Health = 0

	return Errors.SUCCESS
end)

CommandBuilder.new(Commands, "morph", Permission.RUNS_FUN_COMMANDS, function(Player: Player, Args: {string}) 
	if not Args[2] then return Errors.INVALIDARG end

	local MorphOwner = Utils.GetPlayerFromString(Args[2])

	if not MorphOwner then return Errors.NOPLAYER end

	local Description = game.Players:GetHumanoidDescriptionFromUserId(MorphOwner.UserId)
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local Humanoid: Humanoid = Character:FindFirstChild("Humanoid")

	Humanoid:ApplyDescription(Description)

	return Errors.SUCCESS
end)

return Commands