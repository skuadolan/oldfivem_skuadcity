Config = {}

-- Script locale (only .Lua)
Config.Locale = 'en'

Config.AutoFindFixePhones = true -- Automatically add pay phones as they are found by their models.

Config.FixePhone = {
  -- Mission Row
  ['911'] = { 
    name =  _U('mission_row'), 
    coords = { x = 441.2, y = -979.7, z = 30.58 } 
  },
  
  ['008-0001'] = {
    name = _U('phone_booth'),
    coords = { x = 372.25, y = -965.75, z = 28.58 } 
  },
}

Config.KeyOpenClose = 243 -- `/~
Config.KeyTakeCall  = 38  -- E

Config.UseMumbleVoIP = false -- Use Frazzle's Mumble-VoIP Resource (Recomended!) https://github.com/FrazzIe/mumble-voip
Config.UseTokoVoIP   = false

Config.ShowNumberNotification = true -- Show Number or Contact Name when you receive new SMS