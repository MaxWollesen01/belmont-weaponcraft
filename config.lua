return {
    craftingStations = {
        {
            coords = {1215.4188, -488.7106, 67.1643},
            heading = 258.3548,
            label = 'Weapon bench',
            icon = 'fa-solid fa-gun',
            jobs = false -- or { 'police', 'mechanic' } for job-lock
        }
    },
    recipes = {
        {
            name = 'WEAPON_CERAMICPISTOL',
            label = 'Ceramic Pistol',
            items = {
                { name = 'metalscrap', count = 70 },
                { name = 'bpceramicpistol', count = 1 }
            },
            time = 5000 
        },
                {
            name = 'WEAPON_HEAVYPISTOL',
            label = 'Heavy Pistol',
            items = {
                { name = 'metalscrap', count = 90 },
                { name = 'bpheavypistol', count = 1 }
            },
            time = 10000 
        },
                        {
            name = 'at_suppressor_light',
            label = 'Suppressor',
            items = {
                { name = 'metalscrap', count = 10 },
            },
            time = 10000 
        },
        -- Add more recipes here
    }
}
