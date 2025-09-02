fx_version 'cerulean'
game 'gta5'

author 'Belmont'
description 'Weapon Crafting'

shared_scripts {
    '@ox_lib/init.lua',
    '@ox_inventory/imports.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

dependency 'ox_inventory'
dependency 'ox_lib'
dependency 'ox_target'
