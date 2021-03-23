--[[ COMMANDS ]]--
--[[ COMMANDS ]]--
Config        = {}

Config.EnableESXIdentity = true
Config.OnlyFirstname     = true




RegisterCommand('clear', function(source, args, rawCommand)
    TriggerClientEvent('chat:client:ClearChat', source)
end, false)

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

--[[
RegisterCommand('twt', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    if player ~= false then
        local name = GetCharacterName(src)
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message"><b>Twitter @{0}:</b> {1}</div>',
            args = { name, msg }
        })
    end
end, false)
]]--
--[[
RegisterCommand('atwt', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    if player ~= false then
        local name = GetCharacterName(src)
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message"><b>Anonymous @{0}:</b> {1}</div>',
            args = { name, msg }
        })
    end
end, false)
]]--
--[[

RegisterCommand('adv', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    if player ~= false then
        local name = GetCharacterName(src)
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message-ad"><b>AD from @{0}:</b> {1}</div>',
            args = { name, msg }
        })
    end
end, false)

RegisterCommand('vpn', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    if player ~= false then
        local name = ""
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message-vpn"><b>VPN {0}:</b> {1}</div>',
            args = { name, msg }
        })
    end
end, false)

RegisterCommand('ems', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    if player ~= false then
        local name = ""
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message-ems"><b>🚑 Rumah Sakit {0}:</b> {1}</div>',
            args = { name, msg }
        })
    end
end, false)

RegisterCommand('pol', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    if player ~= false then
        local name = ""
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message-pol"><b>👮 LSPD {0}:</b> {1}</div>',
            args = { name, msg }
        })
    end
end, false)

RegisterCommand('taxi', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(6)
    if player ~= false then
        local name = ""
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message-taxi"><b>🚕 Taxi {0}:</b> {1}</div>',
            args = { name, msg }
        })
    end
end, false)

RegisterCommand('mecha', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(7)
    if player ~= false then
        local name = ""
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message-meca"><b>🛠 Mechanic {0}:</b> {1}</div>',
            args = { name, msg }
        })
    end
end, false)

RegisterCommand('pdg', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    if player ~= false then
        local name = ""
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message-pedagang"><b>📦 PEDAGANG {0}:</b> {1}</div>',
            args = { name, msg }
        })
    end
end, false)

RegisterCommand('bn', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(4)
    if player ~= false then
        local name = ""
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message-bn"><b>📢 BERITA {0}:</b> {1}</div>',
            args = { name, msg }
        })
    end
end, false)
]]--


function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end