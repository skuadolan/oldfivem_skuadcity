fx_version 'adamant'

game 'gta5'

description 'Inventory HUD Glovebox'

version '1.2.1'

server_scripts {
  "@async/async.lua",
  "@mysql-async/lib/MySQL.lua",
  "@es_extended/locale.lua",
  "locales/id.lua",
  "config.lua",
  "server/classes/c_glovebox.lua",
  "server/glovebox.lua",
  "server/esx_glovebox-sv.lua"
}

client_scripts {
  "@es_extended/locale.lua",
  "locales/id.lua",
  "config.lua",
  "client/esx_glovebox-cl.lua"
}

dependency 'es_extended'