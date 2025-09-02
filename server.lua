RegisterNetEvent('belmont-weaponcraft:giveitem', function(weapon, label)
    local src = source
    exports.ox_inventory:AddItem(src, weapon, 1)
    TriggerClientEvent('belmont-weaponcraft:receive', src, weapon, label)
end)

local cfg = require 'config'

RegisterNetEvent('belmont-weaponcraft:craft', function(recipeName)
    local src = source
    local recipe
    for _,v in ipairs(cfg.recipes) do
        if v.name == recipeName then recipe = v break end
    end
    if not recipe then return end
    for _,item in ipairs(recipe.items) do
        if not exports.ox_inventory:Search(src, 'count', item.name) or exports.ox_inventory:Search(src, 'count', item.name) < item.count then
            TriggerClientEvent('ox_lib:notify', src, {type='error', description='Missing materials'})
            return
        end
    end
    for _,item in ipairs(recipe.items) do
        exports.ox_inventory:RemoveItem(src, item.name, item.count)
    end
    TriggerClientEvent('belmont-weaponcraft:progress', src, recipe.name, recipe.label, recipe.time)
end)
