AddEventHandler('onClientMapStart', function()
  exports.spawnmanager:setAutoSpawn(true) --default true
  exports.spawnmanager:forceRespawn()
end)
