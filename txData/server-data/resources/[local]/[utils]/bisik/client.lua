
RegisterNetEvent('bisik:allPlayer')
AddEventHandler('bisik:allPlayer', function(text, sourceId)
    local source = GetPlayerFromServerId(sourceId)
    local sourcePed = GetPlayerPed(source)
    local targetPed = PlayerPedId()

    local sourceCoords = GetEntityCoords(sourcePed)
    local targetCoords = GetEntityCoords(targetPed)
    local distance = #(targetCoords - sourceCoords)

    if distance < 10.0 then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message-tni"><b>{0}</div>',
            args = {text}
          })
    end
end)