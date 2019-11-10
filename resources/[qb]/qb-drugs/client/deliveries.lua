currentDealer = nil
knockingDoor = false

local dealerIsHome = false

local waitingDelivery = nil
local activeDelivery = nil

local interacting = false
local lastDealer = nil

local deliveryTimeout = 0

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        nearDealer = false

        for id, dealer in pairs(Config.Dealers) do
            local dealerDist = GetDistanceBetweenCoords(pos, dealer["coords"]["x"], dealer["coords"]["y"], dealer["coords"]["z"])

            if dealerDist <= 6 then
                nearDealer = true

                if dealerDist <= 1.5 then
                    if not interacting then
                        if not dealerIsHome then
                            DrawText3D(dealer["coords"]["x"], dealer["coords"]["y"], dealer["coords"]["z"], '[E] Om te kloppen')

                            if IsControlJustPressed(0, Keys["E"]) then
                                currentDealer = id
                                knockDealerDoor()
                                lastDealer = currentDealer
                            end
                        elseif dealerIsHome then
                            DrawText3D(dealer["coords"]["x"], dealer["coords"]["y"], dealer["coords"]["z"], '[E] Om in te kopen / [G] Opdracht doen')
                            if IsControlJustPressed(0, Keys["E"]) then
                                buyDealerStuff()
                            end

                            if IsControlJustPressed(0, Keys["G"]) then
                                if waitingDelivery == nil then
                                    TriggerEvent("chatMessage", "Dealer Tony", "normal", 'Hier heb je de producten, houd je mail in de gaten betreft de bestelling!')
                                    requestDelivery()
                                    interacting = false
                                    dealerIsHome = false
                                else
                                    TriggerEvent("chatMessage", "Dealer Tony", "error", 'Je hebt nog een levering open staan. Waar wacht je op?')
                                end
                            end
                        end
                    end
                end
            end
        end

        if not nearDealer then
            Citizen.Wait(2000)
        end

        Citizen.Wait(3)
    end
end)

knockDealerDoor = function()
    local hours = GetClockHours()

    if hours > Config.Dealers[currentDealer]["time"]["min"] and hours < 24 or hours < Config.Dealers[currentDealer]["time"]["max"] and hours > 0 then
        knockDoorAnim(true)
    else
        knockDoorAnim(false)
    end
end

function buyDealerStuff()
    local repItems = {}
    repItems.label = Config.Dealers[currentDealer]["name"]
    repItems.items = {}

    for k, v in pairs(Config.Dealers[currentDealer]["products"]) do
        if QBCore.Functions.GetPlayerData().metadata["dealerrep"] >= Config.Dealers[currentDealer]["products"][k].minrep then
            repItems.items[k] = Config.Dealers[currentDealer]["products"][k]
        end
    end

    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Dealer_"..Config.Dealers[currentDealer]["name"], repItems)
end

function knockDoorAnim(home)
    local knockAnimLib = "timetable@jimmy@doorknock@"
    local knockAnim = "knockdoor_idle"
    local PlayerPed = GetPlayerPed(-1)
    local myData = QBCore.Functions.GetPlayerData()

    if home then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "knock_door", 0.2)
        Citizen.Wait(100)
        while (not HasAnimDictLoaded(knockAnimLib)) do
            RequestAnimDict(knockAnimLib)
            Citizen.Wait(100)
        end
        knockingDoor = true
        TaskPlayAnim(PlayerPed, knockAnimLib, knockAnim, 3.0, 3.0, -1, 1, 0, false, false, false )
        Citizen.Wait(3500)
        TaskPlayAnim(PlayerPed, knockAnimLib, "exit", 3.0, 3.0, -1, 1, 0, false, false, false)
        knockingDoor = false
        Citizen.Wait(1000)
        TriggerEvent("chatMessage", "Dealer Tony", "normal", 'Yow '..myData.charinfo.firstname..', wat kan ik voor je betekenen?')
        -- knockTimeout()
        dealerIsHome = true
    else
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "knock_door", 0.2)
        Citizen.Wait(100)
        while (not HasAnimDictLoaded(knockAnimLib)) do
            RequestAnimDict(knockAnimLib)
            Citizen.Wait(100)
        end
        knockingDoor = true
        TaskPlayAnim(PlayerPed, knockAnimLib, knockAnim, 3.0, 3.0, -1, 1, 0, false, false, false )
        Citizen.Wait(3500)
        TaskPlayAnim(PlayerPed, knockAnimLib, "exit", 3.0, 3.0, -1, 1, 0, false, false, false)
        knockingDoor = false
        Citizen.Wait(1000)
        QBCore.Functions.Notify('Het lijkt erop dat er niemand thuis is..', 'error', 3500)
    end
end

RegisterNetEvent('qb-drugs:client:updateDealerItems')
AddEventHandler('qb-drugs:client:updateDealerItems', function(itemData, amount)
    TriggerServerEvent('qb-drugs:server:updateDealerItems', itemData, amount, currentDealer)
end)

RegisterNetEvent('qb-drugs:client:setDealerItems')
AddEventHandler('qb-drugs:client:setDealerItems', function(itemData, amount, dealer)
    Config.Dealers[dealer]["products"][itemData.slot].amount = Config.Dealers[dealer]["products"][itemData.slot].amount - amount
end)

function requestDelivery()
    local location = math.random(1, #Config.DeliveryLocations)
    local amount = math.random(1, 3)
    waitingDelivery = {
        ["coords"] = Config.DeliveryLocations[location]["coords"],
        ["locationLabel"] = Config.DeliveryLocations[location]["label"],
        ["amount"] = amount,
        ["dealer"] = currentDealer
    }
    TriggerServerEvent('qb-drugs:server:giveDeliveryItems', amount)
    SetTimeout(math.random(20000, 30000), function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.Dealers[currentDealer]["name"],
            subject = "Aflever Locatie",
            message = "Hier is alle informatie op je bezorging, <br>Locatie: "..waitingDelivery["locationLabel"].."<br>Spullen: <br> "..amount.."x Wiet Brick 1kg<br><br> Zorg dat je optijd bent!",
            button = {
                enabled = true,
                buttonEvent = "qb-drugs:client:setLocation",
                buttonData = waitingDelivery
            }
        })
    end)
end

function setMapBlip(x, y)
    SetNewWaypoint(x, y)
    QBCore.Functions.Notify('De route naar aflever locatie staat aangegeven op je kaart.', 'success');
end

RegisterNetEvent('qb-drugs:client:setLocation')
AddEventHandler('qb-drugs:client:setLocation', function(locationData)
    if activeDelivery == nil then
        activeDelivery = locationData
    else
        setMapBlip(activeDelivery["coords"]["x"], activeDelivery["coords"]["y"])
        QBCore.Functions.Notify('Je hebt nog een levering open staan...')
        return
    end

    deliveryTimeout = 300

    deliveryTimer()

    setMapBlip(activeDelivery["coords"]["x"], activeDelivery["coords"]["y"])

    Citizen.CreateThread(function()
        while true do

            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local inDeliveryRange = false

            if activeDelivery ~= nil then
                local dist = GetDistanceBetweenCoords(pos, activeDelivery["coords"]["x"], activeDelivery["coords"]["y"], activeDelivery["coords"]["z"])

                if dist < 15 then
                    inDeliveryRange = true
                    if dist < 1.5 then
                        DrawText3D(activeDelivery["coords"]["x"], activeDelivery["coords"]["y"], activeDelivery["coords"]["z"], '[E] '..activeDelivery["amount"]..'x Wiet Brick 1kg afleveren')

                        if IsControlJustPressed(0, Keys["E"]) then
                            deliverStuff(activeDelivery)
                            activeDelivery = nil
                            waitingDelivery = nil
                            break
                        end
                    end
                end

                if not inDeliveryRange then
                    Citizen.Wait(1500)
                end
            else
                break
            end

            Citizen.Wait(3)
        end
    end)
end)

function deliveryTimer()
    Citizen.CreateThread(function()
        while true do

            if deliveryTimeout - 1 > 0 then
                deliveryTimeout = deliveryTimeout - 1
            else
                deliveryTimeout = 0
                break
            end

            Citizen.Wait(1000)
        end
    end)
end

function deliverStuff(activeDelivery)
    if deliveryTimeout > 0 then
        TriggerServerEvent('qb-drugs:server:succesDelivery', activeDelivery, true)
    else
        TriggerServerEvent('qb-drugs:server:succesDelivery', activeDelivery, false)
    end
    deliveryTimeout = 0
end

RegisterNetEvent('qb-drugs:client:sendDeliveryMail')
AddEventHandler('qb-drugs:client:sendDeliveryMail', function(type, deliveryData)
    if type == 'perfect' then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.Dealers[deliveryData["dealer"]]["name"],
            subject = "Levering",
            message = "Je hebt goed werk geleverd! Ik hoop snel weer zaken te kunnen doen ;)<br><br>Groeten, "..Config.Dealers[deliveryData["dealer"]]["name"]
        })
    elseif type == 'bad' then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.Dealers[deliveryData["dealer"]]["name"],
            subject = "Levering",
            message = "Ik krijg klachten over je bezorging, laat dit mij niet vaker overkomen..."
        })
    elseif type == 'late' then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.Dealers[deliveryData["dealer"]]["name"],
            subject = "Levering",
            message = "Je was niet optijd.. Had je belangrijkere dingen te doen dan zaken?"
        })
    end
end)