local Permission = require(script.Parent.Parent.Permission)
local Errors = require(script.Parent.Parent.types.Errors)
local Settings = require(script.Parent.Parent.Settings)

local CommandBuilder = {}

function CommandBuilder.new(Commands: {}, name: string, permission: number, callback: any)
	-- it doesn't really matter what callback is since when running it's more secure than area 51
	-- it automatically adds it to commands

	if #name < Settings.MinimumCommandLength or #name > Settings.MaximumCommandLength then
		return Errors.CMDTOOBIG
	end

	if type(callback) ~= "function" then return Errors.NOTFNC end

	Commands[name] = {
		name,
		permission,
		callback
	}

	return Errors.SUCCESS
end

return CommandBuilder