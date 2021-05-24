DiscordWebhookSystemInfos = 'https://discord.com/api/webhooks/827157977067946045/aN9ho2K8IHtwIFaHDjt1ra0Sq9TKCqrs6EDItNPGkLc_X56oRGvNLt_grKhgk-bhera8'
DiscordWebhookKillinglogs = 'https://discord.com/api/webhooks/827157977067946045/aN9ho2K8IHtwIFaHDjt1ra0Sq9TKCqrs6EDItNPGkLc_X56oRGvNLt_grKhgk-bhera8'
DiscordWebhookChat = 'https://discord.com/api/webhooks/817653173614936065/-uj0exaUwn_ktEjFP5-QqBVwaCyHA1FmzteTvpqRTpA5uqoVsgHciJXhnofhWyQKIvR-'

SystemAvatar = 'https://media.discordapp.net/attachments/797857470897848360/827171596808617994/SKUAD_CITY_DISCORD.png'

UserAvatar = 'https://media.discordapp.net/attachments/797857470897848360/827171596808617994/SKUAD_CITY_DISCORD.png'

SystemName = ''


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/911E', '**[EMS]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				   {'/911P', '**[POLICE]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/ooc', 'https://discordapp.com/api/webhooks/637253780450181130/SrC0CfvV6JiLmBNnCeRad85TMOgrXjvdN7sEcD8EY3qyJ6sK3EHxvPU1IO7GVqtoDlRO'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

