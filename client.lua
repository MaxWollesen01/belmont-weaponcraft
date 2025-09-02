RegisterNetEvent('belmont-weaponcraft:progress', function(weapon, label, time)
    local success = lib.progressBar({
        duration = time,
        label = 'Manufacturer: ' .. label,
        useWhileDead = false,
        canCancel = false,
        disable = { move = true, car = true, combat = true }
    })
    if success then
        TriggerServerEvent('belmont-weaponcraft:giveitem', weapon, label)
    end
end)

RegisterNetEvent('belmont-weaponcraft:receive', function(weapon, label)
    lib.notify({type = 'success', description = 'You have crafted ' .. label .. '!'})
end)

local cfg = require 'config'

local function getMaterialString(items)
    local str = ""
    for i, item in ipairs(items) do
        str = str .. (i > 1 and ", " or "") .. (item.count .. "x " .. item.name)
    end
    return str
end

local function openCraftMenu()
    local options = {}
    for _,v in ipairs(cfg.recipes) do
        table.insert(options, {
            title = v.label,
            description = 'Materials: ' .. getMaterialString(v.items),
            icon = v.icon or 'fa-solid fa-gun',
            onSelect = function()
                TriggerServerEvent('belmont-weaponcraft:craft', v.name)
            end
        })
    end
    lib.registerContext({
        id = 'weapon_crafting',
        title = 'Manufacturing',
        options = options
    })
    lib.showContext('weapon_crafting')
end

for _,station in ipairs(cfg.craftingStations) do
    exports.ox_target:addSphereZone({
        coords = station.coords,
        radius = 2.0,
        debug = false,
        options = {
            {
                name = 'craft_weapon',
                icon = station.icon,
                label = station.label,
                onSelect = openCraftMenu,
                canInteract = function(entity, distance, coords, name, bone)
                    if not station.jobs then return true end
                    local player = exports.ox_core:GetPlayer()
                    if not player or not player.job then return false end
                    for _,j in ipairs(station.jobs) do
                        if player.job.name == j then return true end
                    end
                    return false
                end
            }
        }
    })
end
