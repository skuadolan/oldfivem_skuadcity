Citizen.CreateThread(function()
	while true do
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(769841088419987487)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('indodream')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('#INDODREAM ROLEPLAY | STARTER PACK | JOB WHITELISTED/NON WHITELISTED | BADSIDE | ADMIN RAMAH | FUN SERVER')
       
        --Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('#INDODREAM')

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)