ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getBlackMoneyFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('black_money')
	return account.money

end

local function getBankFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('bank')
	return account.money
end

RegisterCommand('ooc', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    if player ~= false then
        local user = GetPlayerName(src)
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message-ooc"><b>OOC | {0}:</b> {1}</div>',
            args = { user, msg }
        })
    end
end, false)

RegisterCommand('showid', function(source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'ID: ' .. source}) 
end)

RegisterCommand('infojob', function(source)
	  local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    local jobgrade = xPlayer.job.grade_label
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Job anda adalah ' .. job .. ' ' .. jobgrade}) 
end, false)

RegisterCommand('infoduit', function(source)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local wallet 		= getMoneyFromUser(_source)
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You currently have Rp.' .. wallet .. ' in your wallet'})
end, false)

RegisterCommand('infobank', function(source)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local bank 			= getBankFromUser(_source)
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You currently have Rp.' .. bank .. ' in your bank'})
end, false)

RegisterCommand('infosemua', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    local jobgrade = xPlayer.job.grade_label
    local wallet 		= getMoneyFromUser(_source)
    local bank 			= getBankFromUser(_source)
    local black_money 	= getBlackMoneyFromUser(_source)
    if  xPlayer.job.grade_name == 'boss' or xPlayer.job.grade_name == 'jendral' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end	
    else
      TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You are working as: ' .. job .. ' - ' .. jobgrade})
      Citizen.Wait(1500)
      TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You currently have Rp.' .. wallet .. ' in your wallet'})
      Citizen.Wait(1500)
      TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You currently have Rp.' .. bank .. ' in your bank'})
      Citizen.Wait(1500)
      TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You currently have Rp.' .. black_money .. ' dirty money in your wallet'})
      Citizen.Wait(1500)
      TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Access not granted!'})
	  end
  end, 
false)

RegisterCommand('infosociety', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.job.grade_name == 'boss' or xPlayer.job.grade_name == 'jendral' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end
		
                --TriggerClientEvent('esx:showNotification', _source, 'You currently have ~g~$~g~' .. money .. ' ~s~in the society account~g~ ')
	        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You currently have Rp.' .. money .. ' in the society account'})
																	
	else

	        --TriggerClientEvent('esx:showNotification', _source, '~r~Access not granted!')
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Access not granted!'})
																			
	end
end, false)

TriggerEvent('esx_society:getSocieties', function(societies) 
	RegisteredSocieties = societies
end)

function GetSociety(name)
  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      return RegisteredSocieties[i]
    end
  end
end


AddEventHandler('chatMessage', function(playerId, playerName, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		playerName = GetRealPlayerName(playerId)
		TriggerClientEvent('chat:addMessage', -1, {args = {_U('ooc_prefix', playerName), message}, color = {128, 128, 128}})
	end
end)

RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text)
	TriggerClientEvent('3dme:triggerDisplay', -1, text, source)
end)

-- ############################################
-- --------------------------------------------
-- 3dme : /me command but its 3D printed
-- Author : Elio
-- Server side
-- --------------------------------------------
-- ############################################

-- --------------------------------------------
-- Functions
-- --------------------------------------------

-- OBJ : transform a table into a string (using spaces)
-- PARAMETERS :
--		- tab : the table to transform
local function TableToString(tab)
	local str = ""
	for i = 1, #tab do
		str = str .. " " .. tab[i]
	end
	return str
end

-- --------------------------------------------
-- Commands
-- --------------------------------------------

RegisterCommand('do', function(source, args)
    local text = " " .. TableToString(args) .. " "
    TriggerClientEvent('3dme:shareDisplay', -1, text, source)
end)




--[[RegisterCommand('twt', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)
		TriggerClientEvent('chat:addMessage', -1, {args = {_U('twt_prefix', playerName), args}, color = {0, 153, 204}})
	end
end, false)
RegisterCommand('anontwt', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)
		TriggerClientEvent('chat:addMessage', -1, {args = {_U('twt_prefix', "Anonymous"), args}, color = {0, 153, 204}})
	end
end, false)
RegisterCommand('me', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)
		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('me_prefix', playerName), args, {255, 0, 0})
	end
end, false)]]

--[[RegisterCommand('do', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)
		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('do_prefix', playerName), args, {0, 0, 255})
	end
end, false)]]

RegisterCommand('msg', function(source, args, user)

	if GetPlayerName(tonumber(args[1])) then
		local player = tonumber(args[1])
		table.remove(args, 1)

		TriggerClientEvent('chat:addMessage', player, {args = {"^1PM from "..GetPlayerName(source).. "[" .. source .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}})
		TriggerClientEvent('chat:addMessage', source, {args = {"^1PM SEND TO "..GetPlayerName(player).. "[" .. player .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}})
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "ID de jugador incorrecta!")
	end

end,false)

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






--JOBS CHAT
RegisterCommand('info', function(playerId, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	msg = table.concat(args, ' ')
	local playerName = GetRealPlayerName(playerId)

	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	elseif xPlayer.job.name == "ambulance" then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message-ems"><b>🚑 EMS | {0}: </b> {1}</div>',
			args = { xPlayer.name, msg }
		})
	elseif xPlayer.job.name == "police" then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message-pol"><b>👮 POLISI | {0}: </b> {1}</div>',
            args = { xPlayer.name, msg }
		})
	elseif xPlayer.job.name == "taxi" then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message-taxi"><b>🚕 TAKSI |  @{0}: <br></b> {1}</div>',
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