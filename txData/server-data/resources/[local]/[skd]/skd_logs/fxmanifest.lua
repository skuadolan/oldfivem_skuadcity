fx_version 'cerulean'
games { 'gta5' }
description 'Discord Bot and Precense' 			-- Resource Description
shared_script 'config.lua'
client_script {
    'config.lua',
    'client/precense.lua',
    'client/weapons.lua',
	'client/client.lua',
}
server_script{
    'config.lua',
    'server/server.lua',
}

dependency 'es_extended'