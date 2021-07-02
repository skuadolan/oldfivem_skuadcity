fx_version 'adamant'

game 'gta5'

description 'ESX Vehicle Lock'

version '1.0.0'

server_script {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

client_scripts {
	'main.lua'
}

dependencies {
    'es_extended'
}
