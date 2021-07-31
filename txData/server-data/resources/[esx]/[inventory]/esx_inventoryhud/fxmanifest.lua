fx_version 'adamant'
game 'gta5'

description "ESX Inventory HUD"

version "1.1"

ui_page "html/ui.html"

client_scripts {
  "@es_extended/locale.lua",
  "client/motels.lua",
  "client/beds.lua",
  "client/main.lua",
  "client/shop.lua",
  "client/police.lua",
  "client/trunk.lua",
  "client/glovebox.lua",
  "client/cartel.lua",
  "client/vault.lua",
  "client/mafia.lua",
  "client/property.lua",
  "client/player.lua",
  "client/weapons.lua",
  "locales/id.lua",
  "config.lua"
}

server_scripts {
  "@mysql-async/lib/MySQL.lua",
  "@es_extended/locale.lua",
  "server/main.lua",
  "locales/id.lua",
  "config.lua"
}

files {
  "html/ui.html",
  "html/css/ui.css",
  "html/css/jquery-ui.css",
  "html/css/bootstrap.min.css",
  "html/js/inventory.js",
  "html/js/config.js",
  "html/js/inventory.js",
  "html/js/jquery-3.3.1.min.js",
  "html/js/jquery-ui.min.js",
  -- JS LOCALES
  "html/locales/id.js",
  -- IMAGES
  "html/img/bullet.png",
  -- ICONS
  "html/img/items/*.png",
}


exports	{
  "refreshPropertyMotelBedInventory",
  "refreshPropertyMotelInventory"
}


dependency 'es_extended'