fx_version 'adamant'

game 'gta5'

description 'ESX Mechanic Job'

version '1.6.0'

shared_script '@es_extended/imports.lua'

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua'
}