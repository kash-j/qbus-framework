QBCore = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
    end
end)

-- Code

local scoreboardOpen = false


DrawText3D = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    while true do

        if IsControlJustPressed(0, Config.OpenKey) then
            if not scoreboardOpen then
                SendNUIMessage({
                    action = "open",
                    players = GetCurrentPlayers(),
                    maxPlayers = Config.MaxPlayers,
                    requiredCops = Config.IllegalActions,
                    currentCops = Config.CurrentCops,
                })
                scoreboardOpen = true
            end
        end

        if IsControlJustReleased(0, Config.OpenKey) then
            if scoreboardOpen then
                SendNUIMessage({
                    action = "close",
                })
                scoreboardOpen = false
            end
        end

        if scoreboardOpen then
            local player, distance = QBAdmin.Functions.GetClosestPlayer()
            if player ~= -1 and distance < 2.5 then
                local PlayerId = GetPlayerServerId(player)
                local PlayerPed = GetPlayerPed(player)
                local PlayerName = GetPlayerName(player)
                local PlayerCoords = GetEntityCoords(PlayerPed)

                DrawText3D(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z + 1.0, '['..PlayerId..']')
            end
        end

        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    while true do
        if QBCore ~= nil then
            QBCore.Functions.TriggerCallback('qb-scoreboard:server:GetActiveCops', function(cops, config)
                Config.CurrentCops = cops
                Config.IllegalActions = config
            end)
        end
        Citizen.Wait(10000)
    end
end)

function GetCurrentPlayers()
    local TotalPlayers = 0

    for _, player in ipairs(GetActivePlayers()) do
        TotalPlayers = TotalPlayers + 1
    end

    return TotalPlayers
end

RegisterNetEvent('qb-scoreboard:client:SetActivityBusy')
AddEventHandler('qb-scoreboard:client:SetActivityBusy', function(activity, busy)
    Config.IllegalActions[activity].busy = busy
end)