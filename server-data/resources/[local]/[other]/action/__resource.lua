resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts{
    "vk_handsup/client.lua",
    "Point-finger/client.lua",
    "korscommand/client.lua",
    "kors/client.lua",
    "crouch-n-prone/client.lua"
}

server_script{
    "vk_handsup/server.lua"
}

exports {
    'getSurrenderStatus',
}