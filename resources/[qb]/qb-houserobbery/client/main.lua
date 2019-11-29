QBCore = nil

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)

-- Code

local inside = false
local currentHouse = nil
local closestHouse

local inRange

local lockpicking = false

local houseObj = {}
local POIOffsets = nil

CurrentCops = 0

function DrawText3Ds(x, y, z, text)
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

local requiredItemsShowed = false

local requiredItems = {}

Citizen.CreateThread(function()
    Citizen.Wait(500)
    requiredItems = {
        [1] = {name = QBCore.Shared.Items["lockpick"]["name"], image = QBCore.Shared.Items["lockpick"]["image"]},
        [2] = {name = QBCore.Shared.Items["screwdriverset"]["name"], image = QBCore.Shared.Items["screwdriverset"]["image"]},
    }
    while true do
        inRange = false
        local PlayerPed = GetPlayerPed(-1)
        local PlayerPos = GetEntityCoords(PlayerPed)
        closestHouse = nil

        if QBCore ~= nil then
            if not inside then
                for k, v in pairs(Config.Houses) do
                    local dist = GetDistanceBetweenCoords(PlayerPos, Config.Houses[k]["coords"]["x"], Config.Houses[k]["coords"]["y"], Config.Houses[k]["coords"]["z"], true)

                    if dist <= 1.5 then
                        closestHouse = k
                        inRange = true
                        if Config.Houses[k]["opened"] then
                            DrawText3Ds(Config.Houses[k]["coords"]["x"], Config.Houses[k]["coords"]["y"], Config.Houses[k]["coords"]["z"], '~g~E~w~ - Om naar binnen te gaan')
                            if IsControlJustPressed(0, Keys["E"]) then
                                enterRobberyHouse(k)
                            end
                        else
                            if not requiredItemsShowed then
                                requiredItemsShowed = true
                                TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                            end
                        end
                    end
                end
            end

            if inside then
                Citizen.Wait(1000)
            end

            if not inRange then
                if requiredItemsShowed then
                    requiredItemsShowed = false
                    TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                end
                Citizen.Wait(1000)
            end
        end

        Citizen.Wait(5)
    end
end)

Citizen.CreateThread(function()
    while true do

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        if inside then
            if IsControlJustPressed(0, Keys["H"]) then
                print(json.encode({x = Config.Houses[currentHouse]["coords"]["x"] - pos.x, y = Config.Houses[currentHouse]["coords"]["y"] - pos.y, z = Config.Houses[currentHouse]["coords"]["z"] - pos.z}))
            end

            if(GetDistanceBetweenCoords(pos, Config.Houses[currentHouse]["coords"]["x"] + POIOffsets.exit.x, Config.Houses[currentHouse]["coords"]["y"] + POIOffsets.exit.y, Config.Houses[currentHouse]["coords"]["z"] - 35 + POIOffsets.exit.z, true) < 1.5)then
                DrawText3Ds(Config.Houses[currentHouse]["coords"]["x"] + POIOffsets.exit.x, Config.Houses[currentHouse]["coords"]["y"] + POIOffsets.exit.y, Config.Houses[currentHouse]["coords"]["z"] - 35 + POIOffsets.exit.z, '~g~E~w~ - Om huis te verlaten')
                if IsControlJustPressed(0, Keys["E"]) then
                    leaveRobberyHouse(currentHouse)
                end
            end

            for k, v in pairs(Config.Houses[currentHouse]["furniture"]) do
                if (GetDistanceBetweenCoords(pos, Config.Houses[currentHouse]["coords"]["x"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["x"], Config.Houses[currentHouse]["coords"]["y"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["y"], Config.Houses[currentHouse]["coords"]["z"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["z"] - 35, true) < 1.5) then
                    if not Config.Houses[currentHouse]["furniture"][k]["searched"] then
                        DrawText3Ds(Config.Houses[currentHouse]["coords"]["x"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["x"], Config.Houses[currentHouse]["coords"]["y"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["y"], Config.Houses[currentHouse]["coords"]["z"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["z"] - 35, '~g~E~w~ - '..Config.Houses[currentHouse]["furniture"][k]["text"])
                        if IsControlJustPressed(0, Keys["E"]) then
                            searchCabin(k)
                        end
                    else
                        DrawText3Ds(Config.Houses[currentHouse]["coords"]["x"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["x"], Config.Houses[currentHouse]["coords"]["y"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["y"], Config.Houses[currentHouse]["coords"]["z"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["z"] - 35, 'Kastje is leeg..')
                    end
                end
            end
        end

        if not inside then 
            Citizen.Wait(5000)
        end

        Citizen.Wait(3)
    end
end)

function enterRobberyHouse(house)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    Citizen.Wait(250)
    local coords = { x = Config.Houses[house]["coords"]["x"], y = Config.Houses[house]["coords"]["y"], z= Config.Houses[house]["coords"]["z"] - 35}
    if Config.Houses[house]["tier"] == 1 then
        data = exports['qb-interior']:CreateTier1HouseFurnished(coords)
    end
    Citizen.Wait(100)
    houseObj = data[1]
    POIOffsets = data[2]
    inside = true
    currentHouse = house
    Citizen.Wait(500)
    SetRainFxIntensity(0.0)
    TriggerEvent('qb-weathersync:client:DisableSync')
    Citizen.Wait(100)
    SetWeatherTypePersist('EXTRASUNNY')
    SetWeatherTypeNow('EXTRASUNNY')
    SetWeatherTypeNowPersist('EXTRASUNNY')
    NetworkOverrideClockTime(23, 0, 0)
end

function leaveRobberyHouse(house)
    local ped = GetPlayerPed(-1)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    Citizen.Wait(250)
    DoScreenFadeOut(250)
    Citizen.Wait(500)
    exports['qb-interior']:DespawnInterior(houseObj, function()
        TriggerEvent('qb-weathersync:client:EnableSync')
        Citizen.Wait(250)
        DoScreenFadeIn(250)
        SetEntityCoords(ped, Config.Houses[house]["coords"]["x"], Config.Houses[house]["coords"]["y"], Config.Houses[house]["coords"]["z"] + 0.5)
        SetEntityHeading(ped, Config.Houses[house]["coords"]["h"])
        inside = false
        currentHouse = nil
    end)
end

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)


RegisterNetEvent('qb-houserobbery:client:enterHouse')
AddEventHandler('qb-houserobbery:client:enterHouse', function(house)
    enterRobberyHouse(house)
end)

function openHouseAnim()
    loadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim( GetPlayerPed(-1), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Citizen.Wait(400)
    ClearPedTasks(GetPlayerPed(-1))
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterNetEvent('lockpicks:UseLockpick')
AddEventHandler('lockpicks:UseLockpick', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if CurrentCops >= 2 then
            if closestHouse ~= nil then
                if result then
                    if not Config.Houses[closestHouse]["opened"] then
                        PoliceCall()
                        TriggerEvent('qb-lockpick:client:openLockpick', lockpickFinish)
                        if math.random(1, 100) <= 65 and not IsWearingHandshoes() then
                            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                        end
                    else
                        QBCore.Functions.Notify('De deur is al open..', 'error', 3500)
                    end
                else
                    QBCore.Functions.Notify('Het lijkt erop dat je iets mist...', 'error', 3500)
                end
            end
        end
    end, "screwdriverset")
end)

function PoliceCall()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local chance = 75
    if GetClockHours() >= 1 and GetClockHours() <= 6 then
        chance = 25
    end
    if math.random(1, 100) <= chance then
        local closestPed = GetNearbyPed()
        if closestPed ~= nil then
            local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
            local streetLabel = GetStreetNameFromHashKey(s1)
            local street2 = GetStreetNameFromHashKey(s2)
            if street2 ~= nil and street2 ~= "" then 
                streetLabel = streetLabel .. " " .. street2
            end
            local gender = "Man"
            if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
                gender = "Vrouw"
            end
            local msg = "Poging inbraak in een huis door een " .. gender .." bij " .. streetLabel
            TriggerServerEvent("police:server:HouseRobberyCall", pos, msg)
        end
    end
end

function GetNearbyPed()
	local retval = nil
	local PlayerPeds = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(PlayerPeds, ped)
    end
    local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
	if not IsEntityDead(closestPed) and closestDistance < 50.0 then
		retval = closestPed
	end
	return retval
end

function lockpickFinish(success)
    if success then
        TriggerServerEvent('qb-houserobbery:server:enterHouse', closestHouse)
        QBCore.Functions.Notify('Het is gelukt!', 'success', 2500)
    else
        local itemInfo = QBCore.Shared.Items["lockpick"]
        TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)
        TriggerEvent('inventory:client:ItemBox', itemInfo, "remove")
        QBCore.Functions.Notify('Het is niet gelukt..', 'error', 2500)
    end
end


RegisterNetEvent('qb-houserobbery:client:setHouseState')
AddEventHandler('qb-houserobbery:client:setHouseState', function(house, state)
    Config.Houses[house]["opened"] = state
end)

function searchCabin(cabin)
    if math.random(1, 100) <= 65 and not IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end
    QBCore.Functions.Progressbar("search_cabin", "Kastje aan het doorzoeken..", math.random(4000, 8000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "veh@break_in@0h@p_m_one@",
        anim = "low_force_entry_ds",
        flags = 16,
    }, {}, {}, function() -- Done
        ClearPedTasks(GetPlayerPed(-1))
        TriggerServerEvent('qb-houserobbery:server:searchCabin', cabin, currentHouse)
        Config.Houses[currentHouse]["furniture"][cabin]["searched"] = true
    end, function() -- Cancel
        ClearPedTasks(GetPlayerPed(-1))
        QBCore.Functions.Notify("Proces geannuleerd..", "error")
    end)
end

RegisterNetEvent('qb-houserobbery:client:setCabinState')
AddEventHandler('qb-houserobbery:client:setCabinState', function(house, cabin, state)
    Config.Houses[house]["furniture"][cabin]["searched"] = state
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