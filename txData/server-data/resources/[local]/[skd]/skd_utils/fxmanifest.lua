fx_version 'adamant'

game 'gta5'

author 'dianadi021'
description 'SKUAD skd_starterpack'

version 'final'

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'locales/id.lua',
	'client/client.lua',
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'locales/id.lua',
	'server/server.lua',
}


dependencies {
	'skd_logs'
}