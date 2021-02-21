--------------------------------------------------------------------------------
--------------------------- Completed by JalalLinuX ----------------------------
--------------------------------------------------------------------------------

-- new resource manifest https://docs.fivem.net/docs/scripting-reference/resource-manifest/resource-manifest/
fx_version 'bodacious'
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
-- https://docs.fivem.net/docs/scripting-reference/resource-manifest/resource-manifest/#fx-version-bodacious-2020-02
games {"gta5"}

description 'JL Discord'

version '1.0'

server_script {
	"bot.js",
	'config.lua',
	'server/main.lua'
}

client_script {
	'config.lua',
	'client/weapons.lua',
	'client/main.lua'
}

