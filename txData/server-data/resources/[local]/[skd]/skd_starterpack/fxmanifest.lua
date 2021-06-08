fx_version 'adamant'

game 'gta5'

author 'dianadi021'
description 'SKUAD skd_starterpack'

version 'final'

client_scripts {
	'@es_extended/locale.lua',
	'locales/id.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/id.lua',
	'config.lua',
	'server/main.lua'
}


dependencies {
	'skd_logs'
}