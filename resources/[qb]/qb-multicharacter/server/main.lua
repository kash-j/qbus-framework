QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('qb-multicharacter:server:disconnect')
AddEventHandler('qb-multicharacter:server:disconnect', function()
    local src = source

    DropPlayer(src, "You have disconnected from Qbus Roleplay")
end)

RegisterServerEvent('qb-multicharacter:server:loadUserData')
AddEventHandler('qb-multicharacter:server:loadUserData', function(cData)
    local src = source
    if QBCore.Player.Login(src, cData.citizenid) then
        print('^2[qb-core]^7 '..GetPlayerName(src)..' (Citizen ID: '..cData.citizenid..') has succesfully loaded!')
		QBCore.Commands.Refresh(src)
		--TriggerEvent('QBCore:Server:OnPlayerLoaded')
        --TriggerClientEvent('QBCore:Client:OnPlayerLoaded', src)
	end
end)

RegisterServerEvent('qb-multicharacter:server:createCharacter')
AddEventHandler('qb-multicharacter:server:createCharacter', function(data)
    local src = source
    local newData = {}
    newData.cid = data.cid
    newData.charinfo = data
    --QBCore.Player.CreateCharacter(src, data)
    if QBCore.Player.Login(src, false, newData) then
        print('^2[qb-core]^7 '..GetPlayerName(src)..' has succesfully loaded!')
		QBCore.Commands.Refresh(src)

        TriggerClientEvent("qb-multicharacter:client:closeNUI", src)
        TriggerClientEvent('apartments:client:setupSpawnUI', src, newData)
	end
end)

RegisterServerEvent('qb-multicharacter:server:deleteCharacter')
AddEventHandler('qb-multicharacter:server:deleteCharacter', function(citizenid)
    local src = source
    QBCore.Player.DeleteCharacter(src, citizenid)
end)

QBCore.Functions.CreateCallback("qb-multicharacter:server:GetUserCharacters", function(source, cb)
    local steamId = GetPlayerIdentifier(source, 0)

    exports['ghmattimysql']:execute('SELECT * FROM players WHERE steam = @steam', {['@steam'] = steamId}, function(result)
        cb(result)
    end)
end)

QBCore.Functions.CreateCallback("qb-multicharacter:server:GetServerLogs", function(source, cb)
    exports['ghmattimysql']:execute('SELECT * FROM server_logs', function(result)
        cb(result)
    end)
end)

QBCore.Functions.CreateCallback("test:yeet", function(source, cb)
    local steamId = GetPlayerIdentifiers(source)[1]
    local plyChars = {}
    
    exports['ghmattimysql']:execute('SELECT * FROM players WHERE steam = @steam', {['@steam'] = steamId}, function(result)
        for i = 1, (#result), 1 do
            result[i].charinfo = json.decode(result[i].charinfo)
            result[i].money = json.decode(result[i].money)
            result[i].job = json.decode(result[i].job)

            table.insert(plyChars, result[i])
        end
        cb(plyChars)
    end)
end)

QBCore.Commands.Add("char", "Geef een item aan een speler", {{name="id", help="Speler ID"},{name="item", help="Naam van het item (geen label)"}, {name="amount", help="Aantal items"}}, false, function(source, args)
    TriggerClientEvent('qb-multicharacter:client:chooseChar', source)
    QBCore.Player.Logout(source)
end)

QBCore.Commands.Add("closeNUI", "Geef een item aan een speler", {{name="id", help="Speler ID"},{name="item", help="Naam van het item (geen label)"}, {name="amount", help="Aantal items"}}, true, function(source, args)
    TriggerClientEvent('qb-multicharacter:client:closeNUI', source)
end)

QBCore.Functions.CreateCallback("qb-multicharacter:server:getSkin", function(source, cb, cid)
    local src = source

    QBCore.Functions.ExecuteSql("SELECT * FROM `playerskins` WHERE `citizenid` = '"..cid.."' AND `active` = 1", function(result)
        if result[1] ~= nil then
            cb(result[1].model, result[1].skin)
        else
            cb(nil)
        end
    end)
end)