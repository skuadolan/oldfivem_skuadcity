fx_version 'adamant'

game 'gta5'

description 'SKD_STARTERPACK'

version '1.0'

shared_scripts {
	'@es_extended/imports.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'@oxmysql/lib/MySQL.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua'
}

ui_page 'html/ui.html'

files {
	'html/*.html',
	'html/*.js',
	'html/*.css',
	'html/*.png',
	'html/*.jpg',
	'html/*.jpeg',
}