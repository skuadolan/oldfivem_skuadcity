RegisterCommand("cross", function(source, args, raw)
    TriggerEvent("CrossHands")
end, false)

RegisterNetEvent("CrossHands")
AddEventHandler("CrossHands", function(inputText) 
RequestAnimDict("amb@world_human_hang_out_street@female_arms_crossed@base")
TaskPlayAnim(GetPlayerPed(-1),"amb@world_human_hang_out_street@female_arms_crossed@base", "base", 1.0,-1.0, 5000, 1, 1, true, true, true)
end)