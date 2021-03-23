ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--[[RegisterCommand('twt', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		msg = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="display: inline-block !important; padding: 0.5vw; margin: 0.5vw; box-shadow:5px 5px 11px -10px #000000; background-color: rgba(0, 153, 204, 0.4); border-radius: 3px;">Twitter: @{0} <br>{1}</div>',
			args = { playerName ,msg }
		})
	end
end, false)--]]


RegisterCommand('info', function(playerId, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	msg = table.concat(args, ' ')
	local playerName = GetRealPlayerName(playerId)

	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	elseif xPlayer.job.name == "ambulance" then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message-ems"><b>🚑 RUMAH SAKIT | {0}: </b> {1}</div>',
			args = { xPlayer.name, msg }
		})
	elseif xPlayer.job.name == "police" then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message-pol"><b>👮 POLISI | {0}: </b> {1}</div>',
            args = { xPlayer.name, msg }
		})
	elseif xPlayer.job.name == "taxi" then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message-taxi"><b>🚕 GRAB |  @{0}: <br></b> {1}</div>',
			args = { xPlayer.name, msg }
		})
	elseif xPlayer.job.name == "mechanic" then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message-meca"><b>🛠 MEKANIK | {0}: </b> {1}</div>',
			args = { xPlayer.name, msg }
		})
	elseif xPlayer.job.name == "pedagang" then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message-pdg"><b>📦 PEDAGANG | {0}: </b> {1}</div>',
			args = { xPlayer.name, msg }
		})
	elseif xPlayer.job.name == "ojek" then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(2, 173, 102, 0.5); border-radius: 3px;"><i class="fas fa-ad"></i>{1}</div>',
			args = { xPlayer.name, msg }
		})
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Lu Bukan WhiteList'})
	end
end, false)

RegisterCommand('ad', function(playerId, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	elseif xPlayer.job.name ~= 'reporter' then
		xPlayer.showNotification('Kamu bukan seorang ~r~Reporter~s~!')
	else
		msg = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.5vw; font-weight: 700; margin: 0.5vw; box-shadow:5px 5px 11px -10px #000000; background-color: rgba(255, 182, 13, 0.4); border-radius: 3px;">Iklan: <br>{0}</div>',
			args = { msg }
		})
	end
end, false)

function GetRealPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if Config.EnableESXIdentity then
			if Config.OnlyFirstname then
				return xPlayer.get('firstName')
			else
				return xPlayer.getName()
			end
		else
			return xPlayer.getName()
		end
	else
		return GetPlayerName(playerId)
	end
end