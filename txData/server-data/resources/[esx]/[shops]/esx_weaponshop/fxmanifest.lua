fx_version 'adamant'

game 'gta5'

description 'ESX Weapon Shop'

version '1.1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/id.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/id.lua',
	'config.lua',
	'client/main.lua'
}

dependency 'es_extended'