WatermarkText = "~b~ES~w~X P~b~remium~w~"
statement = 1

local logoFont

local onlinePlayers = 0
local maxPlayers = GetConvar("sv_maxclients", 64)



Citizen.CreateThread(function()
	Citizen.Wait(1000)
	RegisterFontFile('lemonmilk')

    local txd = CreateRuntimeTxd("rage")
	CreateRuntimeTextureFromImage(txd, "rage", "assets/rage.png")

	while true do
		Wait(2500)
		onlinePlayers = #GetActivePlayers()
		if statement == 1 then
			WatermarkText = ""
			statement = 0
		else
			WatermarkText = ""
			statement = 1
		end
	end

	while true do
		onlinePlayers = #GetActivePlayers()
		Citizen.Wait(20000)
	end
end)


local function drawTxt(text, thePos, scale, r, g, b)
	SetTextDropShadow(1, 5, 5, 5, 255)
	SetTextFont(1)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, 255)
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(thePos)
end

Citizen.CreateThread(function()
	Citizen.Wait(3000)
	local pos = vector2(0.9, 0.93) --vector2(0.06, 0.40) --vector2(0.03, 0.45)
	local scale = 0.9
	while true do
		-- DrawSprite("ug_logo", "ug_logo", pos, 0.06*scale, 0.1*scale, 0.0, 255, 255, 255, 255)
		-- drawTxt(svName, pos+vector2(0.025, -0.025), 0.45*scale, 255, 255, 255)
		-- drawTxt("Online: "..onlinePlayers, pos+vector2(0.053, -0.005), 0.40*scale, 255, 255, 255)

		DrawSprite("rage", "rage", pos+vector2(0.05, -0.12), 0.10*scale, 0.16*scale, 0.0, 255, 255, 255, 255)
		drawtxt(WatermarkText,1,1,1.349, 1.089,0.52,73, 13, 214,255)
		drawTxt("~b~online~w~: "..onlinePlayers.."~w~/"..maxPlayers, pos+vector2(0.05, -0.04), 0.50*scale, 255, 255, 255)

		Citizen.Wait(1)
	end
end)

function drawtxt(text,font,centre,x,y,scale,r,g,b,a)
    y = y - 0.2250
    scale = scale/1.2
    x = x + -0.400
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextFont(1)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end


local function drawTxt2(text, thePos, scale, r, g, b)
	SetTextDropShadow(1, 5, 5, 5, 255)
	SetTextFont(1)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, 255)
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(thePos)
end

function drawtxt2(text,font,centre,x,y,scale,r,g,b,a)
    y = y - 0.2250
    scale = scale/1.2
    x = x + -0.400
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextFont(1)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end