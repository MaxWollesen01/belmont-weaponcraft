# belmont-weaponcraft
weapon crafting system using ox_core

make sure you have ox_core and ox_inventory, ox_lib, ox_target, oxmysql indstallet before the script

https://items.rainmad.com/ for items and images

Items

    ["bpheavypistol"] = {
        label = "Bpheavypistol",
        weight = 1,
        stack = true,
        close = true
    },

    ["bpceramicpistol"] = {
        label = "Bpceramicpistol",
        weight = 1,
        stack = true,
        close = true
    },

    ["ammocrate"] = {
        label = "Ammocrate",
        weight = 5,
    },

    ['WEAPON_CERAMICPISTOL'] = {
		label = 'Ceramic Pistol',
		weight = 1130,
		durability = 0.1,
		mmoname = 'ammocrate',
	},

	['WEAPON_HEAVYPISTOL'] = {
		label = 'Heavy Pistol',
		weight = 2000,
		durability = 0.1,
		ammoname = 'ammocrate'
	},