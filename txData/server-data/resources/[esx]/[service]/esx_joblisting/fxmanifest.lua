fx_version 'adamant'

game 'gta5'

description 'ESX Job Listing'

version '1.6.0'

shared_script '@es_extended/imports.lua'

ui_pages {
	'html/index.html'
}

files {
	"html/*.html",
	"html/*.css",
	"html/*.js"
}

server_scripts {
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

dependency 'es_extended'
