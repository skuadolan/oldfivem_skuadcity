fx_version "bodacious"
games {"gta5"}

client_script {
    'config.lua',
    'aim/client.lua',
    'autohelm/client.lua',
    'barhud/client.lua',
    'carry/client.lua',
    'crouchprone/client.lua',
    'fingerpoint/client.lua',
    'handsup/client.lua',
    'helicam/client.lua',
    'HideInTrunk/client.lua',
    'injury/client.lua',
    'jatuh/client.lua',
    'nonpc/client.lua',
    'piggyback/client.lua',
    'surrender/client.lua',
    'th/client.lua',
    'titlepause/client.lua',
}

server_script {
    'config.lua',
    'carry/server.lua',
    'helicam/server.lua',
    'piggyback/server.lua',
    'surrender/server.lua',
    'th/server.lua',
}

dependency 'es_extended'