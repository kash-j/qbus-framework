QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Commands.Add("newscam", "Pak een nieuws camera", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "reporter" then
        TriggerClientEvent("Cam:ToggleCam", source)
    end
end)

QBCore.Commands.Add("newsmic", "Pak een nieuws microfoon", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "reporter" then
        TriggerClientEvent("Mic:ToggleMic", source)
    end
end)

