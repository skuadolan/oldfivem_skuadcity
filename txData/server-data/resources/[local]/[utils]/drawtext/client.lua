--TOKO START
Config = {}


Config.Zones = {
    Location = {
        Pos = {
            --EMS
            vector3(311.72, -562.65, 43.28),
            --PEDAGANG
            vector3(-629.28, 223.93, 81.88),
            --MECHANIC
            vector3(-310.8, -137.55, 39.01),

            vector3(1272.85, -1711.89,54.77),
            vector3(61.04, -1726.92, 29.46),
            vector3(2751.0, 3471.74,  55.7)
        }
    }
}


--end
function DrawText3Ds(Pos, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(Pos, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.028+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local distance = 25

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local sleep = true
        local player = PlayerPedId()
        local getentity = GetEntityCoords

        for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				local distance = Vdist2(getentity(player, false), v.Pos[i])

				if distance < 25 then
                    sleep = false
                    DrawText3Ds(v.Pos[i], "TEKAN [E] UNTUK MEMBELI")
				end
			end
		end
        
        --end
        if sleep then
			Citizen.Wait(50)
		end
    end
end)