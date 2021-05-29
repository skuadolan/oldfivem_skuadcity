description 'ESX brinks'

version '0.7'

client_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'config.lua',
  'client/esx_brinks_cl.lua',
}

server_scripts {
  "@mysql-async/lib/MySQL.lua",
  '@es_extended/locale.lua',
  'locales/en.lua',
  'config.lua',
  'server/esx_brinks_sv.lua',
}