local AddonAPI = {}

-- These are both-way methods, so you can call them wherever you want

local Addons = script.Parent.addons

function AddonAPI.GetAddon(name: string)
   local Addon = Addons:FindFirstChild(name)

   return require(Addon)
end

function AddonAPI.GetAddons()
    return Addons:GetChildren()
end

return AddonAPI