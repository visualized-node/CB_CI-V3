local Permission = require(script.Parent.Permission)
local Errors = require(script.Parent.Errors)
local Settings = require(script.Parent.Settings)

local Commands = {
	["ping"] = {
		Permission.RUNS_NORMAL_COMMANDS,
		function(Player: Player, Args: {string}) 
			print("Pong!")

			return Errors.SUCCESS
		end
	}
}

local CommandBuilder = {}

function CommandBuilder.new(name: string, permission: number, callback: any)
	-- it doesn't really matter what callback is since when running it's more secure than area 51
	-- it automatically adds it to commands

	if #name < Settings.MinimumCommandLength or #name > Settings.MaximumCommandLength then
		return Errors.CMDTOOBIG
	end
end

return {Commands, CommandBuilder}