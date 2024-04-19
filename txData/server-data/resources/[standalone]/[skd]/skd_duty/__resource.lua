resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Police Job'

version '1.0.0'

shared_script '@es_extended/imports.lua'

server_scripts {
  '@es_extended/locale.lua',
  'translation/id.lua',
  'config.lua',
  'server/main.lua',
}

client_scripts {
  '@es_extended/locale.lua',
  'translation/id.lua',
  'config.lua',
  'client/main.lua',
}

dependency 'es_extended'