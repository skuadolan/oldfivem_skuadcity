AddEventHandler('chatMessage', function(playerId, playerName, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		playerName = GetRealPlayerName(playerId)
		--disini bisa custom output untuk input tanpa slash /
	end
end)

RegisterCommand('msg', function(source, args, user)

	if GetPlayerName(tonumber(args[1])) then
		local player = tonumber(args[1])
		table.remove(args, 1)

		TriggerClientEvent('chat:addMessage', player, {args = {"^1PM from "..GetPlayerName(source).. "[" .. source .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}})
		TriggerClientEvent('chat:addMessage', source, {args = {"^1PM SEND TO "..GetPlayerName(player).. "[" .. player .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}})
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "ID de jugador incorrecta!")
	end

    SetResourceKvp('hideState', tostring(chatHideState))
end,false)

ESX.RegisterServerCallback('skd_rpchat:getIdPlayer', function(source, cb)
	cb(source)
end)

ESX.RegisterServerCallback('skd_rpchat:getPlayerJob', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(xPlayer.job.name)
end)

function GetRealPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		return xPlayer.getName()
	else
		return GetPlayerName(playerId)
	end
end

RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text, type)
	TriggerClientEvent('3dme:triggerDisplay', -1, text, type, source)
end)

RegisterServerEvent('skd_send:welcomer')
AddEventHandler('skd_send:welcomer', function()
	local adstext = 'Selamat Datang di kota SKUAD CITY! Nikmatilah seluruh fasilitas yang terdapat didalam kota, respectlah kepada sesama pemain. Jika ada kesalahan segera hubungi Admin.'
	TriggerClientEvent('chat:addMessage', -1, {template = '<div id="chat-message-ads"><i class="fa-solid fa-bullhorn"></i><b>SYSTEM: </b>'..adstext..' </div>'})
end)




--DISCORD WEBHOOK
-- PLAYER JOINING
-- player join messages

-- GET REQUEST
--[[RegisterCommand("getspace", function(source, args)
    PerformHttpRequest("http://api.open-notify.org/astros.json" --[[ this url is a free api that will tell you how many people are in space , 
    function(err, text, header) 
        local data = json.decode(text)
        print(text)
        TriggerClientEvent("chat:addMessage", source, { args = {string.format("There are currently %s people in space", data.number)} })
    end, 
    'GET', 
    json.encode({}), {['Content-Type'] = 'application/json'})
end)
]]

RegisterNetEvent('skd_rpchat:postToDCJoining', function(source)
	local dataObject = {}
    dataObject.playerName = GetRealPlayerName(source)..' - '..source
    dataObject.content = " Masuk kedalam kota."
	TriggerEvent('skd_DC:postToDC', dataObject, true)
	TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. dataObject.playerName .. ' joined.')
end)

RegisterNetEvent('skd_rpchat:postToDCDisconnect', function(source, reason)
	local dataObject = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    dataObject.playerName = GetRealPlayerName(source)..' - '..source..' | '..xPlayer.identifier
    dataObject.content = " Keluar kota."
	TriggerEvent('skd_DC:postToDC', dataObject, true)
	TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. dataObject.playerName ..' left (' .. reason .. ')')
end)

--RPCHAT
RegisterCommand('twt', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('skd_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		--[[PerformHttpRequest(Config.twtLogs.url, function(err, args, header) end,
        'POST',
        json.encode({username = playerName, content = args, avatar_url = Config.twtLogs.img }), {['Content-Type'] = 'application/json'}) ]]
		local embed = {
			{
				["color"] = 65535,
				["title"] = "**".. playerName .."**",
				["description"] = args,
				["footer"] = {
					["text"] = '#skuadcity',
				},
			}
		}

		TriggerEvent('skd_DC:postToDCWithEmbed', embed, 'twt')
		TriggerClientEvent('chat:addMessage', -1, {template = '<div id="chat-message-twt"><i class="fa-brands fa-square-twitter"></i> <b>'..playerName..': </b>'..args..'</div>'})
	end
end, false)

RegisterCommand('ooc', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('skd_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		--[[PerformHttpRequest(Config.twtLogs.url, function(err, args, header) end,
        'POST',
        json.encode({username = playerName, content = args, avatar_url = Config.twtLogs.img }), {['Content-Type'] = 'application/json'}) ]]
		local embed = {
			{
				["color"] = 0,
				["title"] = "**".. playerName .."**",
				["description"] = args,
				["footer"] = {
					["text"] = '#skuadcity',
				},
			}
		}

		TriggerEvent('skd_DC:postToDCWithEmbed', embed, 'ooc')
		TriggerClientEvent('chat:addMessage', -1, {template = '<div id="chat-message-ooc"><i class="fa-solid fa-globe"></i> <b>'..playerName..': </b>'..args..'</div>'})
	end
end, false)

RegisterCommand('report', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('skd_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		--[[PerformHttpRequest(Config.oocLogs.url, function(err, args, header) end,
        'POST',
        json.encode({username = playerName, content = args, avatar_url = Config.oocLogs.img }), {['Content-Type'] = 'application/json'}) ]]
		local embed = {
			{
				["color"] = 16711680,
				["title"] = "**".. playerName .. " - ID: " .. playerId .."**",
				["description"] = args,
				["footer"] = {
					["text"] = '#skuadcity',
				},
			}
		}

		TriggerEvent('skd_DC:postToDCWithEmbed', embed, 'report')
		TriggerClientEvent('mythic_notify:client:SendAlert', -1, { type = 'inform', text = "Anda sudah mengitim !Report kepada Admin."})
	end
end, false)