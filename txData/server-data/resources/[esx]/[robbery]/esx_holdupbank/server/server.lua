local rob = false
local robbers = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

RegisterServerEvent('esx_holdupbank:toofar')
AddEventHandler('esx_holdupbank:toofar', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Banks[robb].nameofbank)
			TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_holdupbank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Banks[robb].nameofbank)
	end
end)

RegisterServerEvent('esx_holdupbank:rob')
AddEventHandler('esx_holdupbank:rob', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local drill = xPlayer.getInventoryItem('drill')
	local xPlayers = ESX.GetPlayers()
	
	if Banks[robb] then

		local bank = Banks[robb]

		if (os.time() - bank.lastrobbed) < 1000 and bank.lastrobbed ~= 0 then

			TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (2 - (os.time() - bank.lastrobbed)) .. _U('seconds'))
			return
		end

		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end


		if rob == false then
		   
		  if xPlayer.getInventoryItem('drill').count >= 1 then
		     xPlayer.removeInventoryItem('drill', 1)

			if(cops >= Config.NumberOfCopsRequired)then

				rob = true
				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayers[i], { type = 'inform', text = 'Telah Terjadi Perampokan di ' .. bank.nameofbank .. '!', length = 5000, style = { ['background-color'] = '#bd001f', ['color'] = '#ffffff' } })
					if xPlayer.job.name == 'police' then
							TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. bank.nameofbank)
							TriggerClientEvent('esx_holdupbank:setblip', xPlayers[i], Banks[robb].position)
					end
				end

				TriggerClientEvent('esx:showNotification', source, _U('started_to_rob') .. bank.nameofbank .. _U('do_not_move'))
				TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
				TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
				TriggerClientEvent('esx_borrmaskin:startDrill', source)
				TriggerClientEvent('esx_holdupbank:currentlyrobbing', source, robb)
				Banks[robb].lastrobbed = os.time()
				robbers[source] = robb
				local savedSource = source
				SetTimeout(350000, function()

					if(robbers[savedSource])then

						rob = false
						TriggerClientEvent('esx_holdupbank:robberycomplete', savedSource, job)
						if(xPlayer)then

							xPlayer.addAccountMoney('black_money', bank.reward)
							local xPlayers = ESX.GetPlayers()
							for i=1, #xPlayers, 1 do
								local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
								if xPlayer.job.name == 'police' then
										TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at') .. bank.nameofbank)
										TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
								end
							end
						end
					end
				end)
			else
				TriggerClientEvent('esx:showNotification', xPlayer.source, 'Minimal ~r~3 police~r~ untuk rob!')
			end
		end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Sudah dirob! Coba lagi nanti!', length = 5000, style = { ['background-color'] = '#bd001f', ['color'] = '#ffffff' } })
		end
	end
end)
