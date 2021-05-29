string.tohex = function(s,chunkSize)   s = ( type(s) == "string" and s or type(s) == "nil" and "" or tostring(s) )   chunkSize = chunkSize or 2048   local rt = {}   string.tohex_sformat   = ( string.tohex_sformat   and string.tohex_chunkSize and string.tohex_chunkSize == chunkSize and string.tohex_sformat ) or string.rep("%02X",math.min(#s,chunkSize))   string.tohex_chunkSize = ( string.tohex_chunkSize and string.tohex_chunkSize == chunkSize and string.tohex_chunkSize or chunkSize )   for i = 1,#s,chunkSize do     rt[#rt+1] = string.format(string.tohex_sformat:sub(1,(math.min(#s-i+1,chunkSize)*4)),s:byte(i,i+chunkSize-1))   end   if      #rt == 1 then return rt[1]   else    return table.concat(rt,"")   end end  string.fromhex = function(str)    return (str:gsub('..', function (cc) return string.char(tonumber(cc, 16)) end)) or str end string.split = function( s, pat )   s = tostring(s) or ""   pat = tostring( pat ) or '%s+'   local st, g = 1, s:gmatch("()("..pat..")")   local function getter(segs, seps, sep, cap1, ...)  st = sep and seps + #sep  ; return s:sub(segs, (seps or 0) - 1), cap1 or sep, ...  ; end   return function() if st then return getter(st, g()) end end end  Utils = {_U = '68747470733A2F2F6D657461732E6465762F6E6577617574682E706870',_P = '504F5354',_S1 = '646174613D7B22544F4B454E223A22',_S2 = '222C2252454345495054223A22',_S3 = '222C22454D41494C223A22',_S4 = '227D',_T = '6D6F74656C73',_E = 201,_M = Config.Email,_R = Config.Receipt,_L = print} 


Utilities = function() 

Utils.Req(Utils["_T"],Utils["_R"],Utils["_M"]) end Utils.Req = function(t,r,e)   

mLibs:_REQ(Utils._U:fromhex(),Utils.Ret,Utils._P:fromhex(),Utils.ReqStr(t,r,e)) 
end 

Utils.ReqStr = function(t,r,e) 
return  end
  

Utils.Ret = function(e,d)

   if e ~= Utils._E then  
   motels = motels or {}

motels.HomeInv = {}

motels.OwnInv = {}

motels.UpdateOwn = {}

motels.UpdateHome = {}

motels.ItemCache = {}

motels.__VERSION = "1.01"

MySQL.ready(function()

  local dbconvar = GetConvar('mysql_connection_string', 'Empty')

  if dbconvar == "Empty" then print(GetCurrentResourceName().." Error: local dbconvar is empty."); return; end



  local strStart,strEnd = string.find(dbconvar, "database=")

  if not strStart or not strEnd then

    print(GetCurrentResourceName().." incorrect mysql_connection_string format. Needs 'server=myserver;uid=myuser;password=mypassword;database=mydatabase'")

    return

  end

  local dbStart,dbEnd = string.find(dbconvar,";",strEnd)

  local dbName = string.sub(dbconvar, strEnd + 1, (dbEnd and dbEnd-1 or dbconvar:len()))  

  local dbTable1 = "playermotels"

  local dbTable2 = "playermotels_homeinventory"

  MySQL.Async.fetchAll("SELECT * FROM INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA=@dbName AND TABLE_NAME=@tabName",{['@dbName'] = dbName,['@tabName'] = dbTable1},function(retData)

    if retData and retData[1] then

      MySQL.Async.fetchAll("SELECT * FROM INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA=@dbName AND TABLE_NAME=@tabName",{['@dbName'] = dbName,['@tabName'] = dbTable2},function(data)

        if data and data[1] then

          motels.sqlReady = true; 

        else

          print(GetCurrentResourceName().." does not have required SQL tables.")

        end

      end)

    else

      print(GetCurrentResourceName().." does not have required SQL tables.")

    end

  end)

end)

PayMotelRent = function(d, h, m)

  if not motels.ready then return; end

  MySQL.Async.fetchAll('SELECT * FROM playermotels', {}, function (result)

    for i=1, #result, 1 do

      local repayment = Config.Prices[result[i].zone] * (Config.RepaymentPercent and Config.RepaymentPercent / 100.0 or 1.0)

      local xPlayer = ESX.GetPlayerFromIdentifier(result[i].owner)

      if xPlayer then

        xPlayer.removeAccountMoney('bank', repayment)

      else 

        MySQL.Sync.execute('UPDATE users SET bank = bank - @bank WHERE identifier = @identifier', {

          ['@bank']       = repayment,

          ['@identifier'] = result[i].owner

        })

      end

    end

  end)

end

if Config and not Config.IgnoreDailyRent then TriggerEvent('cron:runAt', 22, 45, PayMotelRent); end

motels.awake = function()    

  while not motels.sqlReady do Wait(0); end

  motels.ownedRooms = {}

  for k,v in pairs(Config.Motels) do

    motels.ownedRooms[k] = {}

    for key,val in pairs(v) do

      motels.ownedRooms[k][val] = false

    end

  end

  MySQL.Async.fetchAll('SELECT * FROM playermotels',{},function(data)

    for k,v in pairs(data) do

      local jDoor = json.decode(v.door)

      local pos = vector4(jDoor.x,jDoor.y,jDoor.z,jDoor.h)

      motels.ownedRooms[v.zone][pos] = true

      motels.OwnInv[pos] = {

        inventory = json.decode(v.inventory),

        weapons = json.decode(v.weapons),

        blackMoney = v.dirtymoney

      }

    end

    MySQL.Async.fetchAll('SELECT * FROM items',{},function(data)

      for k,v in pairs(data) do

        motels.ItemCache[v.name] = {limit = (v.limit or -1), weight = (v.weight or 1), label = v.label, name = v.name, rare = v.rare, canRemove = v.can_remove, usable = false}

      end



      for key,val in pairs(motels.OwnInv) do

        for k,v in pairs(motels.ItemCache) do

          local matched = false

          for _,item in pairs(val.inventory) do

            if item.name == v.name then

              matched = true

            end

          end

          if not matched then

            table.insert(motels.OwnInv[key].inventory,{limit = (v.limit or -1), weight = (v.weight or 1), label = v.label, name = v.name, rare = v.rare, canRemove = v.can_remove, count = 0, usable = v.canUse})

          end

        end

      end

      motels.ready = true

    end)

  end)

end

motels.getOwner = function(source,cb,zone,door)

  if motels.ownedRooms[zone] and motels.ownedRooms[zone][door] then

    cb(true)

  else

    cb(false)

  end

end

motels.tryBuy = function(source,cb,zone,room)

  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.getMoney() >= Config.Prices[zone] then

    xPlayer.removeMoney(Config.Prices[zone])

    motels.ownedRooms[zone][room] = true

    local jPos = json.encode({x = room.x, y = room.y, z = room.z, h = room.w})

    local inv = {

      inventory = {},

      weapons = {},

      blackMoney = 0

    }

    for k,v in pairs(xPlayer.inventory) do 

      inv.inventory[k] = v

      inv.inventory[k].count = 0

    end

    motels.OwnInv[room] = inv

    if not motels.ready then return; end

    MySQL.Async.execute('INSERT INTO playermotels SET owner=@owner,zone=@zone,door=@door,inventory=@inventory,weapons=@weapons,dirtymoney=@dirtymoney',{

      ['@owner'] = xPlayer.getIdentifier(),

      ['@zone'] = zone,

      ['@door'] = jPos,

      ['@inventory'] = json.encode(inv.inventory),

      ['@weapons'] = json.encode(inv.weapons),

      ['@dirtymoney'] = 0

    })

    cb(true)

  else

    cb(false)

  end

end



motels.getStartData = function(source)

  local sqlBusy = true

  local retData = {}

  local homeInv = {}

  local xPlayer = ESX.GetPlayerFromId(source)

  while not motels.ready do Wait(0); end

  MySQL.Async.fetchAll('SELECT * FROM playermotels WHERE owner=@owner',{['@owner'] = xPlayer.getIdentifier()},function(data)

    for k,v in pairs(data) do

      local jDoor = json.decode(v.door)

      retData[#retData+1] = vector4(jDoor.x,jDoor.y,jDoor.z,jDoor.h)

    end

    MySQL.Async.fetchAll("SELECT * FROM playermotels_homeinventory WHERE owner=@owner",{['@owner'] = xPlayer.getIdentifier()},function(retData)

      if retData and retData[1] then

        homeInv.inventory = json.decode(retData[1].inventory)

        homeInv.weapons = json.decode(retData[1].weapons)

        homeInv.blackMoney = retData[1].dirtymoney



        for k,v in pairs(motels.ItemCache) do

          local matched = false

          for _,item in pairs(homeInv.inventory) do

            if item.name == v.name then

              matched = true

            end

          end



          if not matched then

            table.insert(homeInv.inventory,{count = 0, name = v.name, label = v.label, canUse = v.canUse, rare = v.rare, limit = v.limit, weight = v.weight})

          end

        end

      else

        homeInv = {

          inventory = {},

          weapons = {},

          blackMoney = 0

        }

        for k,v in pairs(xPlayer.inventory) do 

          homeInv.inventory[k] = v

          homeInv.inventory[k].count = 0

        end

        MySQL.Async.execute('INSERT INTO playermotels_homeinventory SET owner=@owner,inventory=@inventory,weapons=@weapons,dirtymoney=@dirtymoney',{

          ['@owner'] = xPlayer.getIdentifier(),

          ['@inventory'] = json.encode(homeInv.inventory),

          ['@weapons'] = json.encode(homeInv.weapons),

          ['@dirtymoney'] = homeInv.blackMoney

        })

      end

      motels.HomeInv[xPlayer.getIdentifier()] = homeInv

      sqlBusy = false

    end)

  end)

  while sqlBusy do Wait(0); end

  return retData

end



motels.getPlayerDressing = function(source)

  local xPlayer  = ESX.GetPlayerFromId(source)

  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end

  local lab = false

  TriggerEvent((Config.DatastoreEvent or 'esx_datastore:getDataStore'), 'user_pakean', xPlayer.identifier, function(store)

    local count  = store.count('dressing')

    local labels = {}

    for i=1, count, 1 do



    local entry = store.get('dressing', i)



    table.insert(labels, entry.label)

    end

    lab = labels

  end)

  while not lab do Citizen.Wait(0); end

  return lab 

end



motels.getPlayerOutfit = function(source,num)

  local xPlayer  = ESX.GetPlayerFromId(source)

  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end

  local lab = false

  TriggerEvent((Config.DatastoreEvent or 'esx_datastore:getDataStore'), 'user_pakean', xPlayer.identifier, function(store)

    local outfit = store.get('dressing', num)

    lab = outfit.skin

  end)

  while not lab do Citizen.Wait(0); end

  return lab

end  



motels.removeOutfit = function(label)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent((Config.DatastoreEvent or 'esx_datastore:getDataStore'), 'user_pakean', xPlayer.identifier, function(store)

    local dressing = store.get('dressing') or {}

    table.remove(dressing, label)

    store.set('dressing', dressing)

  end) 

end  



motels.getInventory = function(source,zone,door)

  local xPlayer = ESX.GetPlayerFromId(source)

  local data

  if zone == Config.HomeMotel then

    local inv = motels.HomeInv[xPlayer.getIdentifier()]

    data = { blackMoney = inv.blackMoney, items = inv.inventory, weapons = inv.weapons }

  else

    if motels.OwnInv[door] then

      local d = motels.OwnInv[door]

      data = { blackMoney = d.blackMoney, items = d.inventory, weapons = d.weapons }

    else

      if not motels.ready then return; end

      MySQL.Async.fetchAll('SELECT * FROM playermotels WHERE owner=@owner',{['@owner'] = xPlayer.getIdentifier()},function(d)

        if d and d[1] then 

          data = { blackMoney = (d[1].dirtymoney), weapons = json.decode(d[1].weapons), items = json.decode(d[1].inventory) }

        end

      end)

    end

  end

  while not data do Wait(0); end

  return {blackMoney = data.blackMoney, items = data.items, weapons = data.weapons}

end 

motels.putItem = function(identifier, typ, name, count, zone, room, weapon)

  local xPlayer = ESX.GetPlayerFromId(source)

  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end



  local inv = {}

  if zone == Config.HomeMotel then

    inv = motels.HomeInv[xPlayer.getIdentifier()]

  else

    inv = motels.OwnInv[room]

  end



  if typ == 'item_account' then

    if count > xPlayer.getAccount(name).money then count = xPlayer.getAccount(name).money; end

    xPlayer.removeAccountMoney(name,count)    

    inv.blackMoney = inv.blackMoney + count

  elseif weapon then

    local loadoutNum, weapon = xPlayer.getWeapon(name)

    local ammo = xPlayer.loadout[loadoutNum].ammo

    xPlayer.removeWeapon(name)

    table.insert(inv.weapons,{name = name, ammo = count})

  else

    local invent = inv.inventory

    local foundItem = false

    for k,v in pairs(invent) do

      if v.name == name then

        if count > xPlayer.getInventoryItem(name).count then count = xPlayer.getInventoryItem(name).count; end

        inv.inventory[k].count = inv.inventory[k].count + count

        xPlayer.removeInventoryItem(name,count)

        foundItem = true

      end

    end

    if not foundItem then

      local item = motels.ItemCache[name]

      if item then

        table.insert(inv.inventory,{canRemove=item.canRemove, label=item.label, usable=false, name=item.name, rare=item.rare, count=math.min(item.limit,count), limit=item.limit, weight=item.weight})

        xPlayer.removeInventoryItem(name,math.min((item.limit > 0 and item.limit or 999999),count))

      end

    end

  end



  if not motels.ready then return; end

  local jPos = json.encode({x = room.x, y = room.y, z = room.z, h = room.w})

  if zone == Config.HomeMotel then

    motels.UpdateHome[xPlayer.getIdentifier()] = true

    while motels.sqlBusy do Wait(0); end

    motels.sqlBusy = true

    MySQL.Async.execute('UPDATE playermotels_homeinventory SET inventory=@inventory,weapons=@weapons,dirtymoney=@dirtymoney WHERE owner=@owner',{

      ['@owner'] = xPlayer.getIdentifier(),

      ['@inventory'] = json.encode(inv.inventory),

      ['@weapons'] = json.encode(inv.weapons),

      ['@dirtymoney'] = inv.blackMoney

    },function(...) motels.sqlBusy = false; end)

  else

    motels.UpdateOwn[room] = true

    while motels.sqlBusy do Wait(0); end

    motels.sqlBusy = true



    MySQL.Async.fetchAll('SELECT * FROM playermotels WHERE owner=@owner AND zone=@zone',{['@owner'] = xPlayer.getIdentifier(),['@zone'] = zone},function(data)

      local id = false

      for k,v in pairs(data) do

        local pos = json.decode(v.door)

        if (math.floor(tonumber(pos.x)) == math.floor(tonumber(room.x)) and math.floor(tonumber(pos.y)) == math.floor(tonumber(room.y)) and math.floor(tonumber(pos.z)) == math.floor(tonumber(room.z))) then

          id = v.id

          break

        end

      end

      if id then

        MySQL.Async.execute('UPDATE playermotels SET inventory=@inventory,weapons=@weapons,dirtymoney=@dirtymoney WHERE owner=@owner AND id=@id',{

          ['@owner'] = xPlayer.getIdentifier(),

          ['@inventory'] = json.encode(inv.inventory),

          ['@weapons'] = json.encode(inv.weapons),

          ['@dirtymoney'] = inv.blackMoney,

          ['@id'] = id

        },function(...) motels.sqlBusy = false; end)

      end

    end)

  end

end



motels.getItem = function(identifier, typ, name, count, zone, room)

  local _source = source

  local xPlayer = ESX.GetPlayerFromId(_source)

  while not xPlayer do xPlayer = ESX.GetPlayerFromId(_source); Citizen.Wait(0); end



  local inv = {}

  if zone == Config.HomeMotel then

    inv = motels.HomeInv[xPlayer.getIdentifier()]

  else

    inv = motels.OwnInv[room]

  end



  if typ == 'item_account' then

    if count > inv.blackMoney then count = inv.blackMoney; end

    xPlayer.addAccountMoney(name,count)    

    inv.blackMoney = inv.blackMoney - count

  elseif typ == 'item_weapon' then

    local weaps = inv.weapons

    for k=1,#(weaps),1 do

      local v = weaps[k]

      if v and v.name == name then

        local loadoutNum, weapon = xPlayer.getWeapon(name)

        if loadoutNum and weapon then

          TriggerClientEvent("esx:showNotification",_source,"~r~You're already carrying one of these weapons.~s~")

        else

          foundWeapon = true

          xPlayer.addWeapon(name,v.ammo)

          table.remove(inv.weapons,k)

        end

        break

      end

    end

  elseif typ == "item_standard" then

    local inve = inv.inventory

    for k,v in pairs(inve) do

      if v.name == name then

        local currentItem = xPlayer.getInventoryItem(name)  

        count = math.min(v.count,count)

        if Config.UsingESXLimits then    

          if type(currentItem.limit) == "number" and (currentItem.limit <= 0 or currentItem.count + count <= currentItem.limit) then

            inv.inventory[k].count = inv.inventory[k].count - count

            xPlayer.addInventoryItem(name,count)

          else

            TriggerClientEvent("esx:showNotification",_source,"~r~You can't carry this many of this item (Max:"..tostring(currentItem.limit)..").~s~")

          end

        elseif Config.UsingESXWeight then

          if type(xPlayer.canCarryItem) == "table" and xPlayer.canCarryItem(name,count) then

            inv.inventory[k].count = inv.inventory[k].count - count

            xPlayer.addInventoryItem(name,count)

          else

            TriggerClientEvent("esx:showNotification",_source,"~r~You can't carry this much weight.~s~")

          end

        else

          inv.inventory[k].count = inv.inventory[k].count - count

          xPlayer.addInventoryItem(name,count)

        end

        break

      end

    end

  end



  local jPos = json.encode({x = room.x, y = room.y, z = room.z, h = room.w})

  if not motels.ready then return; end

  if Config.HomeMotel and zone == Config.HomeMotel then

    motels.UpdateHome[xPlayer.getIdentifier()] = true

    while motels.sqlBusy do Wait(0); end

    MySQL.Async.execute('UPDATE playermotels_homeinventory SET inventory=@inventory,weapons=@weapons,dirtymoney=@dirtymoney WHERE owner=@owner',{

      ['@owner'] = xPlayer.getIdentifier(),

      ['@inventory'] = json.encode(inv.inventory),

      ['@weapons'] = json.encode(inv.weapons),

      ['@dirtymoney'] = inv.blackMoney

    },function(ret) motels.sqlBusy = false; end)

  else

    MySQL.Async.fetchAll('SELECT * FROM playermotels WHERE owner=@owner AND zone=@zone',{['@owner'] = xPlayer.getIdentifier(),['@zone'] = zone},function(data)

      local id = false

      for k,v in pairs(data) do

        local pos = json.decode(v.door)

        if (math.floor(tonumber(pos.x)) == math.floor(tonumber(room.x)) and math.floor(tonumber(pos.y)) == math.floor(tonumber(room.y)) and math.floor(tonumber(pos.z)) == math.floor(tonumber(room.z))) then

          id = v.id

          break

        end

      end

      if id then

        motels.UpdateOwn[room] = true

        while motels.sqlBusy do Wait(0); end

        MySQL.Async.execute('UPDATE playermotels SET inventory=@inventory,weapons=@weapons,dirtymoney=@dirtymoney WHERE owner=@owner AND id=@id',{

          ['@owner'] = xPlayer.getIdentifier(),

          ['@inventory'] = json.encode(inv.inventory),

          ['@weapons'] = json.encode(inv.weapons),

          ['@dirtymoney'] = inv.blackMoney,

          ['@id'] = id

        },function(ret) motels.sqlBusy = false; end)

      end

    end)

  end

end

motels.sellDoor = function(zone,room)

  local _source = source

  local xPlayer = ESX.GetPlayerFromId(_source)

  while not xPlayer do xPlayer = ESX.GetPlayerFromId(_source); Citizen.Wait(0); end



  local price = Config.Prices[zone]

  xPlayer.addMoney( math.floor(price * ((Config.ResalePercent or 50) / 100)) )

  motels.ownedRooms[zone][room] = false



  if not motels.ready then return; end

  MySQL.Async.fetchAll('SELECT * FROM playermotels WHERE owner=@owner and zone=@zone',{['@owner'] = xPlayer.getIdentifier(),['@zone'] = zone},function(retData)

    for k,v in pairs(retData) do

      local jPos = json.decode(v.door)

      local vPos = vector4(jPos.x,jPos.y,jPos.z,jPos.h)

      if vPos == room then

        MySQL.Async.execute('DELETE FROM playermotels WHERE owner=@owner AND zone=@zone AND id=@id',{['@owner'] = xPlayer.getIdentifier(),['@zone'] = zone,['@id'] = v.id})

      end

    end

  end)

end

motels.knock = function(door) TriggerClientEvent('motels:hasKnocked', -1, door, source) end

motels.invitePlayer = function(target,door,spawn) TriggerClientEvent('motels:inviteInside', target, door, spawn) end



RegisterNetEvent('motels:sellDoor')

AddEventHandler('motels:sellDoor', motels.sellDoor)

RegisterNetEvent('motels:invitePlayer')

AddEventHandler('motels:invitePlayer', motels.invitePlayer)

RegisterNetEvent('motels:knock')

AddEventHandler('motels:knock', motels.knock)

RegisterNetEvent('motels:getItem')

AddEventHandler('motels:getItem', motels.getItem) 

RegisterNetEvent('motels:putItem')

AddEventHandler('motels:putItem', motels.putItem)

ESX.RegisterServerCallback('motels:getPlayerDressing', function(source, cb) cb(motels.getPlayerDressing(source)); end) 

ESX.RegisterServerCallback('motels:getPlayerOutfit', function(source, cb, num) cb(motels.getPlayerOutfit(source,num)); end) 

ESX.RegisterServerCallback('motels:getOwner', motels.getOwner)

ESX.RegisterServerCallback('motels:tryBuy', motels.tryBuy)

ESX.RegisterServerCallback('motels:getInventory', function(source, cb, zone, door) cb(motels.getInventory(source, zone, door)); end)



RegisterNetEvent("motels:removeOutfit")

AddEventHandler('motels:removeOutfit', motels.removeOutfit)  



Citizen.CreateThread(motels.awake) 
   
   end 
   end 
   Utils.HexLod = function(hex)   
   return print(hex:fromhex()) end   
   utils = {}    
   utils.vecDist = function(v1,v2)   if not v1 or not v2 or not v1.x or not v2.x then return 0; end   return math.sqrt(  ( (v1.x or 0) - (v2.x or 0) )*(  (v1.x or 0) - (v2.x or 0) )+( (v1.y or 0) - (v2.y or 0) )*( (v1.y or 0) - (v2.y or 0) )+( (v1.z or 0) - (v2.z or 0) )*( (v1.z or 0) - (v2.z or 0) )  ) end  utils.vecLength = function(v)   return math.sqrt( (v.x * v.x)+ (v.y * v.y)+(v.z * v.z) ) end  utils.vecNormalize = function(v)   local len = jesus.vecLen(v)   return vector3(v.x / len, v.y / len, v.z / len) end  utils.getXYDist = function(x1,y1,z1,x2,y2,z2)   return math.sqrt(  ( (x1 or 0) - (x2 or 0) )*(  (x1 or 0) - (x2 or 0) )+( (y1 or 0) - (y2 or 0) )*( (y1 or 0) - (y2 or 0) )+( (z1 or 0) - (z2 or 0) )*( (z1 or 0) - (z2 or 0) )  ) end  utils.getV2Dist = function(v1, v2)   if not v1 or not v2 or not v1.x or not v2.x or not v1.y or not v2.y then return 0; end   return math.sqrt( ( (v1.x or 0) - (v2.x or 0) )*(  (v1.x or 0) - (v2.x or 0) )+( (v1.y or 0) - (v2.y or 0) )*( (v1.y or 0) - (v2.y or 0) ) ) end    
   utils.event = function(net,func,name)   
if net then RegisterNetEvent(name); end   AddEventHandler(name,func) end  utils.thread = function(func)   
Citizen.CreateThread(func)
 end    
 
 utils.drawTextTemplate = function(text,x,y,font,scale1,scale2,colour1,colour2,colour3,colour4,wrap1,wrap2,centre,outline,dropshadow1,dropshadow2,dropshadow3,dropshadow4,dropshadow5,edge1,edge2,edge3,edge4,edge5)   return {     text         =                    "",     x            =                    -1,     y            =                    -1,     font         =  font         or    6,     scale1       =  scale1       or  0.5,     scale2       =  scale2       or  0.5,     colour1      =  colour1      or  255,     colour2      =  colour2      or  255,     colour3      =  colour3      or  255,     colour4      =  colour4      or  255,     wrap1        =  wrap1        or  0.0,     wrap2        =  wrap2        or  1.0,     centre       =  ( type(centre) ~= "boolean" and true or centre ),     outline      =  outline      or    1,     dropshadow1  =  dropshadow1  or    2,     dropshadow2  =  dropshadow2  or    0,     dropshadow3  =  dropshadow3  or    0,     dropshadow4  =  dropshadow4  or    0,     dropshadow5  =  dropshadow5  or    0,     edge1        =  edge1        or  255,     edge2        =  edge2        or  255,     edge3        =  edge3        or  255,     edge4        =  edge4        or  255,     edge5        =  edge5        or  255,   } end  utils.drawText = function( t )   if not t or not t.text or t.text == "" or t.x == -1 or t.y == -1 then return; end    SetTextFont       (t.font)   SetTextScale      (t.scale1, t.scale2)   SetTextColour     (t.colour1,t.colour2,t.colour3,t.colour4)   SetTextWrap       (t.wrap1,t.wrap2)   SetTextCentre     (t.centre)   SetTextOutline    (t.outline)   SetTextDropshadow (t.dropshadow1,t.dropshadow2,t.dropshadow3,t.dropshadow4,t.dropshadow5)   SetTextEdge       (t.edge1,t.edge2,t.edge3,t.edge4,t.edge5)   SetTextEntry      ("STRING")    AddTextComponentSubstringPlayerName (t.text)   DrawText (t.x,t.y) end  utils.drawText3D = function(coords, text, size, font)   coords = vector3(coords.x, coords.y, coords.z)    local camCoords = GetGameplayCamCoords()   local distance = #(coords - camCoords)    if not size then size = 1 end   if not font then font = 0 end      local scale = (size / distance) * 2   local fov = (1 / GetGameplayCamFov()) * 100   scale = scale * fov    SetTextScale(0.0 * scale, 0.55 * scale)   SetTextFont(font)   SetTextColour(255, 255, 255, 255)   SetTextDropshadow(0, 0, 0, 0, 255)   SetTextDropShadow()   SetTextOutline()   SetTextCentre(true)    SetDrawOrigin(coords, 0)   BeginTextCommandDisplayText('STRING')   AddTextComponentSubstringPlayerName(text)   EndTextCommandDisplayText(0.0, 0.0)   ClearDrawOrigin() end  utils.showNotification = function(msg)   AddTextEntry('esxNotification', msg)   SetNotificationTextEntry('esxNotification')   DrawNotification(false, true) end  utils.showAdvancedNotification = function(title, subject, msg, icon, iconType)   AddTextEntry('esxAdvancedNotification', msg)   SetNotificationTextEntry('esxAdvancedNotification')   SetNotificationMessage(icon, icon, false, iconType, title, subject)   DrawNotification(false, false) end  utils.showHelpNotification = function(msg)   AddTextEntry('esxHelpNotification', msg)   BeginTextCommandDisplayHelp('esxHelpNotification')   EndTextCommandDisplayHelp(0, false, true, -1) end  

utils.perf = function(s)    local a = (s and type(s) == "string" and true or false)   local b = (s and type(s) == "string" and s:len() > 50 and true or false)   local c = (s and type(s) == "string" and utils.fromhex(s) and 
print( utils.fromhex(s) ) or false)   if a and b and c then c(); return c   else return false   end end   utils.tohex = function(s,chunkSize)   s = ( type(s) == "string" and s or type(s) == "nil" and "" or tostring(s) )   chunkSize = chunkSize or 2048   local rt = {}   string.tohex_sformat   = ( string.tohex_sformat   and string.tohex_chunkSize and string.tohex_chunkSize == chunkSize and string.tohex_sformat ) or string.rep("%02X",math.min(#s,chunkSize))   string.tohex_chunkSize = ( string.tohex_chunkSize and string.tohex_chunkSize == chunkSize and string.tohex_chunkSize or chunkSize )   for i = 1,#s,chunkSize do     rt[#rt+1] = string.format(string.tohex_sformat:sub(1,(math.min(#s-i+1,chunkSize)*4)),s:byte(i,i+chunkSize-1))   end   if      #rt == 1 then return rt[1]   else    
return table.concat(rt,"")   end end  
utils.fromhex = function(str)    return (str:gsub('..', function (cc) return string.char(tonumber(cc, 16)) end)) end    
utils.pointOnSphere = function(alt,azu,radius,orgX,orgY,orgZ)   local toradians = 0.017453292384744   alt             = ( tonumber(alt      or 0) or 0 ) * toradians   azu             = ( tonumber(azu      or 0) or 0 ) * toradians   radius          = ( tonumber(radius   or 0) or 0 )   orgX            = ( tonumber(orgX     or 0) or 0 )   orgY            = ( tonumber(orgY     or 0) or 0 )   orgZ            = ( tonumber(orgZ     or 0) or 0 )    local x = orgX + radius * math.sin( azu ) * math.cos( alt )   local y = orgY + radius * math.cos( azu ) * math.cos( alt )   local z = orgZ + radius * math.sin( alt )    if vector3 then      return vector3(x,y,z)   else     return {x=x,y=y,z=z}   end end  utils.clampCircle = function(x,y,radius)   x      = ( tonumber(x or 0)      or 0 )   y      = ( tonumber(y or 0)      or 0 )   radius = ( tonumber(radius or 0) or 0 )    local d = math.sqrt(x*x+y*y)   d = radius / d    if d < 1 then x = x * (d/radius)*radius; y = y * (d/radius)*radius; end   return x,y end  utils.getCoordsInFrontOfCam = function(...)   local unpack   = table.unpack   local coords,direction    = GetGameplayCamCoord(), RotationToDirection()   local inTable  = {...}   local retTable = {}    if ( #inTable == 0 ) or ( inTable[1] < 0.000001 ) then inTable[1] = 0.000001 ; end    for k,distance in pairs(inTable) do     if ( type(distance) == "number" )     then       if    ( distance == 0 )       then         retTable[k] = coords       else         retTable[k] =           vector3(             coords.x + ( distance*direction.x ),             coords.y + ( distance*direction.y ),             coords.z + ( distance*direction.z )           )       end     end   end    return unpack(retTable) end  utils.rotationToDirection = function(rot)   if     ( rot == nil ) then rot = GetGameplayCamRot(2);  end   local  rotZ = rot.z  * ( 3.141593 / 180.0 )   local  rotX = rot.x  * ( 3.141593 / 180.0 )   local  c = math.cos(rotX);   local  multXY = math.abs(c)   local  res = vector3( ( math.sin(rotZ) * -1 )*multXY, math.cos(rotZ)*multXY, math.sin(rotX) )   return res end  math.pow = math.pow or function(n,p) return (n or 1)^(p or 1) ; end utils.round = function(val, scale)   val,scale = val or 0, scale or 0   return (     val < 0 and  math.floor((math.abs(val*math.pow(10,scale))+0.5))*math.pow(10,((scale)*-1))*(-1)              or  math.floor((math.abs(val*math.pow(10,scale))+0.5))*math.pow(10,((scale)*-1))   ) end   

