local Utils = {}
local Permission = require(script.Parent.Permission)
local PermissionGroups = require(script.Parent.PermissionGroups)
local Errors = require(script.Parent.types.Errors)
local Settings = require(script.Parent.Settings)

function Utils.GetPermissionGroupFromUserId(UserId: number)
    local Player: Player = game.Players:GetPlayerByUserId(UserId)

    for i, v in ipairs(PermissionGroups) do
        if table.find(v.Holders, UserId) then
            return v 
        end

        -- I could've shortened this but there are like 3 checks to be made xd

        if v.IfGroupUsesRank then
            if Settings.RankInclusion and Player:GetRankInGroup(Settings.GroupId) >= v.Identifier or Player:GetRankInGroup(Settings.GroupId) > v.Identifier then
                return v
            end
        else
            if Player:GetRoleInGroup(Settings.GroupId) == v.Identifier then
                return v
            end
        end
    end

    return PermissionGroups.GenericPlayer
end

function Utils.GetPlayerFromString(String: string)
    -- best case: there's a player named exactly that, worst case: few letters in display name

    if game.Players[String] then
        -- :O

        return game.Players[String]
    end

    for i, v in ipairs(game.Players:GetPlayers()) do
        local ln = v.Name:lower()
        local dln = v.DisplayName:lower()

        if ln:find(String:lower()) or dln:find(String:lower()) then
            return v
        end
    end

    return nil
end

function Utils.HasPermission(Sender: Player, Command): boolean
    local PermGroup = Utils.GetPermissionGroupFromUserId(Sender.UserId)

    if not table.find(PermGroup.Permissions, Command[2]) then
        return false
    end

    if Settings.PlayerCanRunCommands and PermGroup.Name == "Generic" and not table.find(PermGroup.Permissions, Command[2]) then
        return false
    end

    return true
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