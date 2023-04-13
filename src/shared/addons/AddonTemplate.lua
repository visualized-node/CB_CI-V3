local Addon = {}

Addon.__index = Addon

-- THIS IS AN EARLY STAGE ADDON, AND IT'S NOT IMPLEMENTED YET. IT HAS NO SENSE TO EDIT THIS

function Addon.Make(Player: Player, DestroyOnStop: boolean?)
    local nAddon = {}

    setmetatable(nAddon, Addon)

    nAddon.Player = Player
    nAddon.RanInstance = nil
    nAddon.DestroyOnStop = DestroyOnStop or true

    return nAddon
end

function Addon:Run()
    if self.RanInstance then return end

    self.RanInstance = coroutine.resume(coroutine.create(function()
        print("Something")
    end))
end

function Addon:Stop()
    if not self.RanInstance then return end

    coroutine.close(self.RanInstance)
end

return Addon