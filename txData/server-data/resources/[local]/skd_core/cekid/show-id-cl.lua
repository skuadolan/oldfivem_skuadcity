Citizen.CreateThread(function()
    Wait(50)
    while true do
        miid(0.35, 1.435, 1.0,1.0,0.45, "~b~ID ~w~[".. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. "]", 255, 255, 255, 255)
        Citizen.Wait(1)
    end
end)

function miid(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
	SetTextColour( 0,0,0, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/5.89, y - height/2 + 0.03)
end