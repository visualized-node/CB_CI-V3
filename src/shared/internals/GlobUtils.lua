local Utils = {}

local CB_CI = script.Parent.Parent

function Utils.GetAddons()
    local addonsfolder = CB_CI.addons
    local AddonsList = {}

    --[[
        a little of Addons structural design

        so an addon is inside a folder
        an addon folder must have a file named Manifest that connects everything kinda like init.lua in the case of base CB_CI
        the rest is up to the creator of the addon
    ]]

    for i, v in addonsfolder:GetChildren() do
        if not v:IsA("Folder") or not v:FindFirstChild("Manifest") then
            continue
        end

        table.insert(AddonsList, v)
    end

    return AddonsList
end

return Utils