-- This resource is part of the default Cfx.re asset pack (cfx-server-data)
-- Altering or recreating for local use only is strongly discouraged.

author 'dianadi021'

fx_version 'adamant'

game 'gta5'

description 'BASE ON ESX CHAT'

shared_script '@es_extended/imports.lua'

server_script {
  '@es_extended/locale.lua',
  'locale/en.lua',
  'config.lua',
  'sv_chat.lua'
}

client_script {
  '@es_extended/locale.lua',
  'locale/en.lua',
  'config.lua',
  'cl_chat.lua',
}

files {
  'dist/index.css',
}

chat_theme 'chat' {
  styleSheet = 'dist/index.css',
}

dependency 'es_extended'