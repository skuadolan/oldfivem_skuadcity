fx_version 'adamant'

game 'gta5'

description 'ESX Banker job'

version '1.6.0'

shared_script '@es_extended/imports.lua'

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/styles.css',
	'html/apps.js',
}

shared_script '@es_extended/imports.lua'

server_scripts {
	'@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'locales/en.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'locales/en.lua',
	'client/main.lua'
}
