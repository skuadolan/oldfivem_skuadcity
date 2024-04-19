RegisterServerEvent('skd_duty:overall')
AddEventHandler('skd_duty:overall', function(onDuty, setJob)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerName = xPlayer.getName()

    if xPlayer.job.name == onDuty then
        xPlayer.setJob(setJob, xPlayer.job.grade)
    elseif onDuty then
        sendEmbedDC(setJob, playerName)
    end
end)

function sendEmbedDC(jobName, playerName)
    local embed = {}
    local whatJob = 'jobName'
    local colorOn = 65535
    local colorOff = 16711680

    if jobName == 'offambulance' then
        whatJob = 'ems'
        embed = formatEmbedDC(colorOff, playerName, "Off Duty", "🚑 EMS Di Kota: ", 'ambulance')
    end
    if jobName == 'ambulance' then
        whatJob = 'ems'
        embed = formatEmbedDC(colorOn, playerName, "On Duty", "🚑 EMS Di Kota: ", 'ambulance')
    end
    if jobName == 'offpolice' then
        whatJob = 'police'
        embed = formatEmbedDC(colorOff, playerName, "Off Duty", "👮 Polisi Di Kota: ", 'police')
    end
    if jobName == 'police' then
        whatJob = 'police'
        embed = formatEmbedDC(colorOn, playerName, "On Duty", "👮 Polisi Di Kota: ", 'police')
    end
    if jobName == 'offmechanic' then
        whatJob = 'mech'
        embed = formatEmbedDC(colorOff, playerName, "Off Duty", "🔧 Mekanik Di Kota: ", 'mechanic')
    end
    if jobName == 'mechanic' then
        whatJob = 'mech'
        embed = formatEmbedDC(colorOn, playerName, "On Duty", "🔧 Mekanik Di Kota: ", 'mechanic')
    end
    if jobName == 'offbanker' then
        whatJob = 'banker'
        embed = formatEmbedDC(colorOff, playerName, "Off Duty", "💰 Banker Di Kota: ", 'banker')
    end
    if jobName == 'banker' then
        whatJob = 'banker'
        embed = formatEmbedDC(colorOn, playerName, "On Duty", "💰 Banker Di Kota: ", 'banker')
    end

    TriggerEvent('skd_DC:postToDCWithEmbed', embed, whatJob)
end

function formatEmbedDC(color, playerName, duty, message, job)
    return { {
        ["color"] = color,
        ["title"] = "**" .. playerName .. "** - " .. duty,
        ["description"] = message .. getAllPLayersJob(job),
        ["footer"] = {
            ["text"] = '#skuadcity'
        }
    } }
end

function getAllPLayersJob(whatJob)
    local xAll = ESX.GetPlayers()
    local onDuty = 0
    for i = 1, #xAll, 1 do
        local xPlayer = ESX.GetPlayerFromId(xAll[i])
        if xPlayer.job.name == whatJob then
            onDuty = onDuty + 1
        end
    end
    return onDuty
end
