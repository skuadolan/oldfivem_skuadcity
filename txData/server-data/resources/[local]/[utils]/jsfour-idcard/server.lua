local ESX = nil
-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Open ID card
RegisterServerEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function(ID, targetID, type)
	local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source 	 = ESX.GetPlayerFromId(targetID).source
	local show       = false

	MySQL.Async.fetchAll('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier', {['@identifier'] = identifier},
	function (user)
		if (user[1] ~= nil) then
			MySQL.Async.fetchAll('SELECT type, expired FROM user_licenses WHERE owner = @identifier', {['@identifier'] = identifier},
			function (licenses)
				if type ~= 'ktp' then
					for i=1, #licenses, 1 do
						if type == 'driver' then
							if licenses[i].type == 'drive' or licenses[i].type == 'drive_bike' or licenses[i].type == 'drive_truck' then
								show = true
							end
						elseif type =='weapon' then
							if licenses[i].type == 'weapon' then
								show = true
							end
						end
					end
				else
					show = true
				end

				local xPlayer = ESX.GetPlayerFromId(ID)
				local items = xPlayer.getInventoryItem(type)

				MySQL.Async.fetchAll('SELECT name FROM owned_properties WHERE owner = @identifier', {['@identifier'] = identifier},
				function (address)
					local tempAddress = nil
					for i=1, #address, 1 do
						tempAddress = address[i].name
						break
					end
					if address ~= nil then
						if show then
							if items.count > 0 then
								local array = {
									user = user,
									licenses = licenses,
									address = tempAddress
								}
								TriggerClientEvent('jsfour-idcard:open', _source, array, type)
							else
								TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', 'Tidak bawa lisensi')
							end
						else
							TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', 'Kamu tidak punya lisensi')
							--TriggerClientEvent('esx:showNotification', _source, "You don't have that type of license..")
						end
					end
				end)

			end)
		end
	end)
end)
