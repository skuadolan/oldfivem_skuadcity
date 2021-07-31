fx_version 'adamant'

game 'gta5'

description 'ESX Job Listing'

version '1.1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'locales/id.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'locales/id.lua',
	'client/main.lua'
}

dependency 'es_extended'