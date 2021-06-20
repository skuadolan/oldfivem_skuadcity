fx_version 'adamant'

game 'gta5'

author 'dianadi021'
description 'SKUAD skd_starterpack'

version 'final'

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'*/id.lua',
	'/*/id.lua',
	'*/client.lua',
	'/*/client.lua',
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'*/id.lua',
	'/*/id.lua',
	'*/server.lua',
	'/*/server.lua',
}


dependencies {
	'skd_logs'
}