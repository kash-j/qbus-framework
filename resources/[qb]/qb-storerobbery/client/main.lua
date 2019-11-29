Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

QBCore = nil

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)

--- CODE

local uiOpen            = false
local currentRegister   = 0
local currentSafe = 0
local copsCalled = false
local CurrentCops = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000 * 60 * 5)
        if copsCalled then
            copsCalled = false
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    setupRegister()
    setupSafes()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local inRange = false
        for k, v in pairs(Config.Registers) do
            local dist = GetDistanceBetweenCoords(pos, Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z)

            if dist <= 1 and Config.Registers[k].robbed then
                inRange = true
                DrawText3Ds(Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z, 'De kassa is leeg...')
            end
        end
        if not inRange then 
            Citizen.Wait(2000)
        end
        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        local inRange = false
        if QBCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            for safe,_ in pairs(Config.Safes) do
                local dist = GetDistanceBetweenCoords(pos, Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z)
                if dist < 3 then
                    inRange = true
                    if dist < 1.5 then
                        if not Config.Safes[safe].robbed then
                            DrawText3Ds(Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z, '~g~E~w~ - Combinatie proberen')
                            if IsControlJustPressed(0, Keys["E"]) then
                                if CurrentCops >= 3 then
                                    if math.random(1, 100) <= 65 and not IsWearingHandshoes() then
                                        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                                    end
                                    SetNuiFocus(true, true)
                                    if Config.Safes[safe].type == "keypad" then
                                        SendNUIMessage({
                                            action = "openKeypad",
                                        })
                                        currentSafe = safe
                                    else
                                        QBCore.Functions.TriggerCallback('qb-storerobbery:server:getPadlockCombination', function(combination)
                                            SendNUIMessage({
                                                action = "openPadlock",
                                                combination = combination, 
                                            })
                                            currentSafe = safe
                                        end, safe)
                                    end
                                    if not copsCalled then
                                        local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                                        local street1 = GetStreetNameFromHashKey(s1)
                                        local street2 = GetStreetNameFromHashKey(s2)
                                        local streetLabel = street1
                                        if street2 ~= nil then 
                                            streetLabel = streetLabel .. " " .. street2
                                        end
                                        TriggerServerEvent("qb-storerobbery:server:callCops", "safe", currentSafe, streetLabel, pos)
                                        copsCalled = true
                                    end
                                else
                                    QBCore.Functions.Notify("Niet genoeg politie.. (3 nodig)", "error")
                                end
                            end
                        else
                            DrawText3Ds(Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z, 'Kluis opengemaakt..')
                        end
                    end
                end
            end
        end

        if not inRange then
            Citizen.Wait(2000)
        end
    end
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('lockpicks:UseLockpick')
AddEventHandler('lockpicks:UseLockpick', function()
    for k, v in pairs(Config.Registers) do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local dist = GetDistanceBetweenCoords(pos, Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z)
        if dist <= 1 and not Config.Registers[k].robbed then
            if CurrentCops >= 0 then
                QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
                    if result then
                        lockpick(true)
                        currentRegister = k
                        if math.random(1, 100) <= 100 and not IsWearingHandshoes() then
                            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                        end
                        if not copsCalled then
                            local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                            local street1 = GetStreetNameFromHashKey(s1)
                            local street2 = GetStreetNameFromHashKey(s2)
                            local streetLabel = street1
                            if street2 ~= nil then 
                                streetLabel = streetLabel .. " " .. street2
                            end
                            TriggerServerEvent("qb-storerobbery:server:callCops", "cashier", currentRegister, streetLabel, pos)
                            copsCalled = true
                        end
                    else
                        QBCore.Functions.Notify("Het lijkt erop dat je een schroevendraaier mist..", "error")
                    end
                end, "screwdriverset")
            else
                QBCore.Functions.Notify("Niet genoeg politie.. (3 nodig)", "error")
            end
        end
    end
end)

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(GetPlayerPed(-1), 3)
    local model = GetEntityModel(GetPlayerPed(-1))
    local retval = true
    if model == GetHashKey("mp_m_freemode_01") then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

function setupRegister()
    QBCore.Functions.TriggerCallback('qb-storerobbery:server:getRegisterStatus', function(Registers)
        for k, v in pairs(Registers) do
            Config.Registers[k].robbed = Registers[k].robbed
        end
    end)
end

function setupSafes()
    QBCore.Functions.TriggerCallback('qb-storerobbery:server:getSafeStatus', function(Safes)
        for k, v in pairs(Safes) do
            Config.Safes[k].robbed = Safes[k].robbed
        end
    end)
end

DrawText3Ds = function(x, y, z, text)
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

function lockpick(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        toggle = bool,
    })
    SetCursorLocation(0.5, 0.2)
    uiOpen = bool
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(100)
    end
end

function takeAnim()
    local ped = GetPlayerPed(-1)
    while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do
        RequestAnimDict("amb@prop_human_bum_bin@idle_b")
        Citizen.Wait(100)
    end
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, 8.0, -1, 50, 0, false, false, false)
    Citizen.Wait(2500)
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "exit", 8.0, 8.0, -1, 50, 0, false, false, false)
end

RegisterNUICallback('success', function()
    if currentRegister ~= 0 then
        local ped = GetPlayerPed(-1)
        TriggerServerEvent('qb-storerobbery:server:takeMoney', currentRegister)
        TriggerServerEvent('qb-storerobbery:server:setRegisterStatus', currentRegister)
        lockpick(false)
        takeAnim()
        currentRegister = 0
    else
        SendNUIMessage({
            action = "kekw",
        })
    end
end)

RegisterNUICallback('PadLockSuccess', function()
    if currentSafe ~= 0 then
        if not Config.Safes[currentSafe].robbed then
            SetNuiFocus(false, false)
            TriggerServerEvent("qb-storerobbery:server:SafeReward", currentSafe)
            TriggerServerEvent("qb-storerobbery:server:setSafeStatus", currentSafe)
            currentSafe = 0
            takeAnim()
        end
    else
        SendNUIMessage({
            action = "kekw",
        })
    end
end)

RegisterNUICallback("CombinationFail", function(data, cb)
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('fail', function()
    TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)
    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["lockpick"], "remove")
    lockpick(false)
end)

RegisterNUICallback('exit', function()
    lockpick(false)
end)

RegisterNUICallback('TryCombination', function(data, cb)
    QBCore.Functions.TriggerCallback('qb-storerobbery:server:isCombinationRight', function(combination)
        if tonumber(data.combination) == combination then
            TriggerServerEvent("qb-storerobbery:server:SafeReward", currentSafe)
            TriggerServerEvent("qb-storerobbery:server:setSafeStatus", currentSafe)
            SetNuiFocus(false, false)
            SendNUIMessage({
                action = "closeKeypad",
                error = false,
            })
            currentSafe = 0
            takeAnim()
        else
            SetNuiFocus(false, false)
            SendNUIMessage({
                action = "closeKeypad",
                error = true,
            })
            currentSafe = 0
        end
    end, currentSafe)
end)

RegisterNetEvent('qb-storerobbery:client:setRegisterStatus')
AddEventHandler('qb-storerobbery:client:setRegisterStatus', function(register, bool)
    Config.Registers[register].robbed = bool
end)

RegisterNetEvent('qb-storerobbery:client:setSafeStatus')
AddEventHandler('qb-storerobbery:client:setSafeStatus', function(safe, bool)
    Config.Safes[safe].robbed = bool
end)

RegisterNetEvent('qb-storerobbery:client:robberyCall')
AddEventHandler('qb-storerobbery:client:robberyCall', function(type, key, streetLabel, coords)
    local cameraId = 4
    if type == "safe" then
        cameraId = Config.Safes[key].camId
    else
        cameraId = Config.Registers[key].camId
    end
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
    TriggerEvent("chatMessage", "112-MELDING", "error", "Iemand probeert een winkel te overvallen bij "..streetLabel.." (CAMERA ID: "..cameraId..")")
    local transG = 250
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 458)
    SetBlipColour(blip, 1)
    SetBlipDisplay(blip, 4)
    SetBlipAlpha(blip, transG)
    SetBlipScale(blip, 1.0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("112: Winkeloverval")
    EndTextCommandSetBlipName(blip)
    while transG ~= 0 do
        Wait(180 * 4)
        transG = transG - 1
        SetBlipAlpha(blip, transG)
        if transG == 0 then
            SetBlipSprite(blip, 2)
            RemoveBlip(blip)
            return
        end
    end
end)