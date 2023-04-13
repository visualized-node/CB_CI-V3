local Utils = {}
local PermissionGroups = require(script.Parent.PermissionGroups)
local Errors = require(script.Parent.Errors)

function Utils.GetPermissionGroupFromUserId(UserId: number)
    for i, v in ipairs(PermissionGroups) do
        if table.find(v.Holders, UserId) then
            return v 
        end
    end

    return nil
end

function Utils.GetCharacterFromName(Name: string)
    if game.Players[Name] then
        return game.Players[Name].Character or game.Players[Name].CharacterAdded:Wait()
    else
        return Errors.NOCHAR
    end
end

function Utils.RandomCharacter()
    local Player = game.Players:GetChildren()[math.random(1, #game.Players:GetChildren())]

    return Player.Character or Player.CharacterAdded:Wait()
end

function Utils.RandomPlayer()
    local Player = game.Players:GetChildren()[math.random(1, #game.Players:GetChildren())]

    return Player
end

return Utils