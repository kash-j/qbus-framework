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
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
    end
end)

-- Code

local creatingCharacter = false

local cam = -1
local heading = 332.219879
local zoom = "character"

local customCamLocation = nil

local isLoggedIn = false

local PlayerData = {}

local skinData = {
    ["face"] = {
        item = 0,
        texture = 0,
    },
    ["pants"] = {
        item = 0,
        texture = 0,
    },
    ["hair"] = {
        item = 0,
        texture = 0,
    },
    ["eyebrows"] = {
        item = 0,
        texture = 0,
    },
    ["beard"] = {
        item = 0,
        texture = 0,
    },
    ["blush"] = {
        item = -1,
        texture = -1,
    },
    ["lipstick"] = {
        item = -1,
        texture = -1,
    },
    ["makeup"] = {
        item = -1,
        texture = -1,
    },
    ["ageing"] = {
        item = 0,
        texture = 0,
    },
    ["arms"] = {
        item = 0,
        texture = 0,
    },
    ["t-shirt"] = {
        item = 0,
        texture = 0,
    },
    ["torso2"] = {
        item = 0,
        texture = 0,
    },
    ["vest"] = {
        item = 0,
        texture = 0,
    },
    ["shoes"] = {
        item = 0,
        texture = 0,
    },
    ["mask"] = {
        item = 0,
        texture = 0,
    },
    ["hat"] = {
        item = 0,
        texture = 0,
    },
    ["glass"] = {
        item = 0,
        texture = 0,
    },
    ["ear"] = {
        item = 0,
        texture = 0,
    },
    ["watch"] = {
        item = 0,
        texture = 0,
    },
    ["bracelet"] = {
        item = 0,
        texture = 0,
    },
}
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent("qb-clothes:loadPlayerSkin")
    PlayerData = QBCore.Functions.GetPlayerData()
    isLoggedIn = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

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

Citizen.CreateThread(function()
    for k, v in pairs (Config.Stores) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, 366)
        SetBlipColour(blip, 47)
        SetBlipScale  (blip, 0.7)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Kledingwinkel")
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    while true do

        if isLoggedIn then

            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)

            local inRange = false

            for k, v in pairs(Config.Stores) do
                local dist = GetDistanceBetweenCoords(pos, Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z, true)

                if dist < 30 then
                    DrawMarker(2, Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z + 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                    if dist < 5 then
                        DrawText3Ds(Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z + 1.25, '~g~E~w~ - Om kleding te shoppen')
                        if IsControlJustPressed(0, Keys["E"]) then
                            customCamLocation = nil
                            openMenu({
                                {menu = "character", label = "Karakter", selected = true},
                                {menu = "clothing", label = "Uiterlijk", selected = false},
                                {menu = "accessoires", label = "Accessoires", selected = false}
                            })
                        end
                    end
                    inRange = true
                end
            end

            if not inRange then
                Citizen.Wait(2000)
            end

        end

        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    while true do

        if isLoggedIn then

            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)

            local inRange = false

            for k, v in pairs(Config.ClothingRooms) do
                local dist = GetDistanceBetweenCoords(pos, Config.ClothingRooms[k].x, Config.ClothingRooms[k].y, Config.ClothingRooms[k].z, true)

                if dist < 15 then
                    DrawMarker(2, Config.ClothingRooms[k].x, Config.ClothingRooms[k].y, Config.ClothingRooms[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                    if dist < 2 then
                        if PlayerData.job.name == Config.ClothingRooms[k].requiredJob then
                            DrawText3Ds(Config.ClothingRooms[k].x, Config.ClothingRooms[k].y, Config.ClothingRooms[k].z + 0.3, '~g~E~w~ - Outfits bekijken')
                            if IsControlJustPressed(0, Keys["E"]) then
                                customCamLocation = Config.ClothingRooms[k].cameraLocation
                                openMenu({
                                    {menu = "roomOutfits", label = "Presets", selected = true, outfits = Config.Outfits[PlayerData.job.name]},
                                    {menu = "character", label = "Karakter", selected = false},
                                    {menu = "accessoires", label = "Accessoires", selected = false}
                                })
                            end
                        end
                    end
                    inRange = true
                end
            end

            if not inRange then
                Citizen.Wait(2000)
            end

        end

        Citizen.Wait(3)
    end
end)

RegisterNUICallback('selectOutfit', function(data)
    local outfitData = data.outfitData

    TriggerEvent('qb-clothing:client:loadOutfit', outfitData)
end)

RegisterNUICallback('rotateRight', function()
    local ped = GetPlayerPed(-1)
    local heading = GetEntityHeading(ped)

    SetEntityHeading(ped, heading + 30)
end)

RegisterNUICallback('rotateLeft', function()
    local ped = GetPlayerPed(-1)
    local heading = GetEntityHeading(ped)

    SetEntityHeading(ped, heading - 30)
end)

firstChar = false

local clothingCategorys = {
    ["arms"]        = {type = "variation",  id = 3},
    ["t-shirt"]     = {type = "variation",  id = 8},
    ["torso2"]      = {type = "variation",  id = 11},
    ["pants"]       = {type = "variation",  id = 4},
    ["vest"]        = {type = "variation",  id = 9},
    ["shoes"]       = {type = "variation",  id = 6},
    ["hair"]        = {type = "hair",       id = 2},
    ["eyebrows"]    = {type = "overlay",    id = 2},
    ["face"]        = {type = "face",       id = 2},
    ["beard"]       = {type = "overlay",    id = 1},
    ["blush"]       = {type = "overlay",    id = 5},
    ["lipstick"]    = {type = "overlay",    id = 8},
    ["makeup"]      = {type = "overlay",    id = 4},
    ["ageing"]      = {type = "ageing",     id = 3},
    ["mask"]        = {type = "mask",       id = 1},
    ["hat"]         = {type = "prop",       id = 0},
    ["glass"]       = {type = "prop",       id = 1},
    ["ear"]         = {type = "prop",       id = 2},
    ["watch"]       = {type = "prop",       id = 6},
    ["bracelet"]    = {type = "prop",       id = 7},
}

RegisterNetEvent('qb-clothing:client:openMenu')
AddEventHandler('qb-clothing:client:openMenu', function()
    customCamLocation = nil
    openMenu({
        {menu = "character", label = "Karakter", selected = true},
        {menu = "clothing", label = "Uiterlijk", selected = false},
        {menu = "accessoires", label = "Accessoires", selected = false}
    })
end)

function GetMaxValues()
    maxModelValues = {
        ["arms"]        = {type = "character", item = 0, texture = 0},
        ["t-shirt"]     = {type = "character", item = 0, texture = 0},
        ["torso2"]      = {type = "character", item = 0, texture = 0},
        ["pants"]       = {type = "character", item = 0, texture = 0},
        ["shoes"]       = {type = "character", item = 0, texture = 0},
        ["face"]        = {type = "character", item = 0, texture = 0},
        ["vest"]        = {type = "character", item = 0, texture = 0},
        ["hair"]        = {type = "hair", item = 0, texture = 0},
        ["eyebrows"]    = {type = "hair", item = 0, texture = 0},
        ["beard"]       = {type = "hair", item = 0, texture = 0},
        ["blush"]       = {type = "hair", item = 0, texture = 0},
        ["lipstick"]    = {type = "hair", item = 0, texture = 0},
        ["makeup"]      = {type = "hair", item = 0, texture = 0},
        ["ageing"]      = {type = "hair", item = 0, texture = 0},
        ["mask"]        = {type = "accessoires", item = 0, texture = 0},
        ["hat"]         = {type = "accessoires", item = 0, texture = 0},
        ["glass"]       = {type = "accessoires", item = 0, texture = 0},
        ["ear"]         = {type = "accessoires", item = 0, texture = 0},
        ["watch"]       = {type = "accessoires", item = 0, texture = 0},
        ["bracelet"]    = {type = "accessoires", item = 0, texture = 0},
    }
    local ped = GetPlayerPed(-1)
    for k, v in pairs(clothingCategorys) do
        if v.type == "variation" then
            maxModelValues[k].item = GetNumberOfPedDrawableVariations(ped, v.id)
            maxModelValues[k].texture = GetNumberOfPedTextureVariations(ped, v.id, GetPedDrawableVariation(ped, v.id)) -1
        end

        if v.type == "hair" then
            maxModelValues[k].item = GetNumberOfPedDrawableVariations(ped, v.id)
            maxModelValues[k].texture = 45
        end

        if v.type == "mask" then
            maxModelValues[k].item = GetNumberOfPedDrawableVariations(ped, v.id)
            maxModelValues[k].texture = GetNumberOfPedTextureVariations(ped, v.id, GetPedDrawableVariation(ped, v.id))
        end

        if v.type == "face" then
            maxModelValues[k].item = 44
            maxModelValues[k].texture = 11
        end

        if v.type == "ageing" then
            maxModelValues[k].item = GetNumHeadOverlayValues(v.id)
            maxModelValues[k].texture = 0
        end

        if v.type == "overlay" then
            maxModelValues[k].item = GetNumHeadOverlayValues(v.id)
            maxModelValues[k].texture = 45
        end

        if v.type == "prop" then
            maxModelValues[k].item = GetNumberOfPedPropDrawableVariations(ped, v.id)
            maxModelValues[k].texture = GetNumberOfPedPropTextureVariations(ped, v.id, GetPedPropIndex(ped, v.id))
        end
    end

    SendNUIMessage({
        action = "updateMax",
        maxValues = maxModelValues
    })
end

function openMenu(allowedMenus)
    GetMaxValues()
    SendNUIMessage({
        action = "open",
        menus = allowedMenus
    })
    SetNuiFocus(true, true)
    SetCursorLocation(0.9, 0.25)
    creatingCharacter = true

    FreezeEntityPosition(GetPlayerPed(-1), true)

    enableCam()
end

function enableCam()
    SetEntityHeading(GetPlayerPed(-1), heading)
    -- Camera
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if(not DoesCamExist(cam)) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamCoord(cam, GetEntityCoords(GetPlayerPed(-1)))
        SetCamRot(cam, 0.0, 0.0, 0.0)
        SetCamActive(cam,  true)
        RenderScriptCams(true,  false,  0,  true,  true)
        SetCamCoord(cam, GetEntityCoords(GetPlayerPed(-1)))
    end
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
    if customCamLocation == nil then
        SetCamCoord(cam, x+0.5, y+2.5, z+0.3)
        SetCamRot(cam, 0.0, 0.0, 160.0)
    else
        SetCamCoord(cam, customCamLocation.x, customCamLocation.y, customCamLocation.z)
    end
end

RegisterNUICallback('setupCam', function(data)
    local value = data.value
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))

    if value == 1 then
        SetCamCoord(cam, x+0.3, y+1.0, z+0.5)
    elseif value == 2 then
        SetCamCoord(cam, x+0.3, y+1.0, z+0.2)
    elseif value == 3 then
        SetCamCoord(cam, x+0.3, y+1.0, z-0.5)
    else
        SetCamCoord(cam, x+0.5, y+2.5, z+0.3)
    end
end)

function disableCam()
    RenderScriptCams(false, true, 250, 1, 0)
    DestroyCam(cam, false)

    FreezeEntityPosition(GetPlayerPed(-1), false)
end

function closeMenu()
    SendNUIMessage({
        action = "close",
    })
    disableCam()
end

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    creatingCharacter = false
    disableCam()
    
    FreezeEntityPosition(GetPlayerPed(-1), false)
end)

RegisterNUICallback('getCatergoryItems', function(data, cb)
    cb(Config.Menus[data.category])
end)

RegisterNUICallback('updateSkin', function(data)
    ChangeVariation(data)
end)

RegisterNUICallback('updateSkinOnInput', function(data)
    ChangeVariation(data)
end)

function ChangeVariation(data)
    local ped = GetPlayerPed(-1)
    local clothingCategory = data.clothingType
    local type = data.type
    local item = data.articleNumber

    if clothingCategory == "pants" then
        if type == "item" then
            SetPedComponentVariation(ped, 4, item, 0, 0)
            skinData["pants"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 4)
            SetPedComponentVariation(ped, 4, curItem, item, 0)
            skinData["pants"].texture = item
        end
    elseif clothingCategory == "face" then
        if type == "item" then
            print(item)
            SetPedHeadBlendData(ped, tonumber(item), tonumber(item), tonumber(item), skinData["face"].texture, skinData["face"].texture, skinData["face"].texture, 1.0, 1.0, 1.0, true)
            skinData["face"].item = item
            print('yeye')
        elseif type == "texture" then
            SetPedHeadBlendData(ped, skinData["face"].item, skinData["face"].item, skinData["face"].item, item, item, item, 1.0, 1.0, 1.0, true)
            skinData["face"].texture = item
        end
    elseif clothingCategory == "hair" then
        SetPedHeadBlendData(ped, skinData["face"].item, skinData["face"].item, skinData["face"].item, skinData["face"].texture, skinData["face"].texture, skinData["face"].texture, 1.0, 1.0, 1.0, true)
        if type == "item" then
            SetPedComponentVariation(ped, 2, item, 0, 0)
            skinData["hair"].item = item
            print(item)
            print(skinData["hair"].item)
        elseif type == "texture" then
            SetPedHairColor(GetPlayerPed(-1), item, item)
            skinData["hair"].texture = item
        end
    elseif clothingCategory == "eyebrows" then
        if type == "item" then
            SetPedHeadOverlay(ped, 2, item, 1.0)
            skinData["eyebrows"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 2, 1, item, 0)
            skinData["eyebrows"].texture = item
        end
    elseif clothingCategory == "beard" then
        if type == "item" then
            SetPedHeadOverlay(ped, 1, item, 1.0)
            skinData["beard"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 1, 1, item, 0)
            skinData["beard"].texture = item
        end
    elseif clothingCategory == "blush" then
        if type == "item" then
            SetPedHeadOverlay(ped, 5, item, 1.0)
            skinData["blush"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 5, 1, item, 0)
            skinData["blush"].texture = item
        end
    elseif clothingCategory == "lipstick" then
        if type == "item" then
            SetPedHeadOverlay(ped, 8, item, 1.0)
            skinData["lipstick"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 8, 1, item, 0)
            skinData["lipstick"].texture = item
        end
    elseif clothingCategory == "makeup" then
        if type == "item" then
            SetPedHeadOverlay(ped, 4, item, 1.0)
            skinData["makeup"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 4, 1, item, 0)
            skinData["makeup"].texture = item
        end
    elseif clothingCategory == "ageing" then
        if type == "item" then
            SetPedHeadOverlay(ped, 3, item, 1.0)
            skinData["ageing"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 3, 1, item, 0)
            skinData["ageing"].texture = item
        end
    elseif clothingCategory == "arms" then
        if type == "item" then
            SetPedComponentVariation(ped, 3, item, 0, 2)
            skinData["arms"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 3)
            SetPedComponentVariation(ped, 3, curItem, item, 0)
            skinData["arms"].texture = item
        end
    elseif clothingCategory == "t-shirt" then
        if type == "item" then
            SetPedComponentVariation(ped, 8, item, 0, 2)
            skinData["t-shirt"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 8)
            SetPedComponentVariation(ped, 8, curItem, item, 0)
            skinData["t-shirt"].texture = item
        end
    elseif clothingCategory == "vest" then
        if type == "item" then
            SetPedComponentVariation(ped, 9, item, 0, 2)
            skinData["vest"].item = item
        elseif type == "texture" then
            SetPedComponentVariation(ped, 9, skinData["vest"].item, item, 0)
            skinData["vest"].texture = item
        end
    elseif clothingCategory == "torso2" then
        if type == "item" then
            SetPedComponentVariation(ped, 11, item, 0, 2)
            skinData["torso2"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 11)
            SetPedComponentVariation(ped, 11, curItem, item, 0)
            skinData["torso2"].texture = item
        end
    elseif clothingCategory == "shoes" then
        if type == "item" then
            SetPedComponentVariation(ped, 6, item, 0, 2)
            skinData["shoes"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 6)
            SetPedComponentVariation(ped, 6, curItem, item, 0)
            skinData["shoes"].texture = item
        end
    elseif clothingCategory == "mask" then
        if type == "item" then
            SetPedComponentVariation(ped, 1, item, 0, 2)
            skinData["mask"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 1)
            SetPedComponentVariation(ped, 1, curItem, item, 0)
            skinData["mask"].texture = item
        end
    elseif clothingCategory == "hat" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 0, item, skinData["hat"].texture, true)
            else
                ClearPedProp(ped, 0)
            end
            skinData["hat"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 0, skinData["hat"].item, item, true)
            skinData["hat"].texture = item
        end
    elseif clothingCategory == "glass" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 1, item, skinData["glass"].texture, true)
            else
                ClearPedProp(ped, 1)
            end
            skinData["glass"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 1, skinData["glass"].item, item, true)
            skinData["glass"].texture = item
        end
    elseif clothingCategory == "ear" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 2, item, skinData["ear"].texture, true)
            else
                ClearPedProp(ped, 2)
            end
            skinData["ear"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 2, skinData["ear"].item, item, true)
            skinData["ear"].texture = item
        end
    elseif clothingCategory == "watch" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 6, item, skinData["watch"].texture, true)
            else
                ClearPedProp(ped, 6)
            end
            skinData["watch"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 6, skinData["watch"].item, item, true)
            skinData["watch"].texture = item
        end
    elseif clothingCategory == "bracelet" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 7, item, skinData["bracelet"].texture, true)
            else
                ClearPedProp(ped, 7)
            end
            skinData["bracelet"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 7, skinData["bracelet"].item, item, true)
            skinData["bracelet"].texture = item
        end
    end

    GetMaxValues()
end

function ChangeToSkinNoUpdate(skin)
	SetEntityInvincible(GetPlayerPed(-1),true)
	local model = GetHashKey(skin)
	if IsModelInCdimage(model) and IsModelValid(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end
        SetPlayerModel(PlayerId(), model)

        if skin == "mp_m_freemode_01" or skin == "mp_f_freemode_01" then
            for i = 0, 11 do
                SetPedComponentVariation(GetPlayerPed(-1), 1, 1, 1, 1)
                print(i)
            end
            SetPedComponentVariation(GetPlayerPed(-1), 1, -1, -1, -1)
        end

        if skin ~= "mp_m_freemode_01" and skin ~= "mp_f_freemode_01" and skin ~= "tony" and skin ~= "g_m_m_chigoon_02_m" and skin ~= "u_m_m_jesus_01" and skin ~= "a_m_y_stbla_m" and skin ~= "ig_terry_m" and skin ~= "a_m_m_ktown_m" and skin ~= "a_m_y_skater_m" and skin ~= "u_m_y_coop" and skin ~= "ig_car3guy1_m" then
			SetPedRandomComponentVariation(GetPlayerPed(-1), true)
		end
		
		SetModelAsNoLongerNeeded(model)
	end

	SetEntityInvincible(GetPlayerPed(-1),false)
    
    GetMaxValues()
end

RegisterNUICallback('setCurrentPed', function(data, cb)
    local playerData = QBCore.Functions.GetPlayerData()
    if playerData.charinfo.gender == 0 then
        cb(Config.ManPlayerModels[data.ped])
        ChangeToSkinNoUpdate(Config.ManPlayerModels[data.ped])
    else
        cb(Config.WomanPlayerModels[data.ped])
        ChangeToSkinNoUpdate(Config.WomanPlayerModels[data.ped])
    end
end)

RegisterNUICallback('saveClothing', function(data)
    SaveSkin()
end)

function SaveSkin()
	local model = GetEntityModel(GetPlayerPed(-1))
	clothing = json.encode(skinData)
	TriggerServerEvent("qb-clothing:saveSkin", model, clothing)
end

RegisterNetEvent("qb-clothes:loadSkin")
AddEventHandler("qb-clothes:loadSkin", function(new, model, data)
	local function setDefault()
		Citizen.CreateThread(function()
            QBCore.Functions.GetPlayerData(function(PlayerData)
                SetTimeout(1000, function()
                    openMenu({
                        {menu = "character", label = "Karakter", selected = true},
                        {menu = "clothing", label = "Uiterlijk", selected = false},
                        {menu = "accessoires", label = "Accessoires", selected = false}
                    })
                    DoScreenFadeIn(50)
                end)
			end)
		end)
    end

    if new then setDefault() return end

    model = model ~= nil and tonumber(model) or false

	SetEntityInvincible(GetPlayerPed(-1),true)
    if IsModelInCdimage(model) and IsModelValid(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
            Citizen.Wait(0)
		end
        SetPlayerModel(PlayerId(), model)

		SetPedRandomComponentVariation(GetPlayerPed(-1), false)
        SetModelAsNoLongerNeeded(model)

        SetEntityInvincible(GetPlayerPed(-1),false)
    
        data = json.decode(data)
        
        TriggerEvent('qb-clothing:client:loadPlayerClothing', data, GetPlayerPed(-1))
	end
end)

RegisterNetEvent('qb-clothing:client:loadPlayerClothing')
AddEventHandler('qb-clothing:client:loadPlayerClothing', function(data, ped)
    if ped == nil then ped = GetPlayerPed(-1) end

    for i = 0, 11 do
        SetPedComponentVariation(ped, i, 0, 0, 0)
    end

    for i = 0, 7 do
        ClearPedProp(ped, i)
    end

    skinData = data

    -- Face
    SetPedHeadBlendData(ped, data["face"].item, data["face"].item, data["face"].item, data["face"].texture, data["face"].texture, data["face"].texture, 1.0, 1.0, 1.0, true)

    -- Pants
    SetPedComponentVariation(ped, 4, data["pants"].item, 0, 0)
    SetPedComponentVariation(ped, 4, data["pants"].item, data["pants"].texture, 0)

    -- Hair
    SetPedComponentVariation(ped, 2, data["hair"].item, 0, 0)
    SetPedHairColor(ped, data["hair"].texture, data["hair"].texture)

    -- Eyebrows
    SetPedHeadOverlay(ped, 2, data["eyebrows"].item, 1.0)
    SetPedHeadOverlayColor(ped, 2, 1, data["eyebrows"].texture, 0)

    -- Beard
    SetPedHeadOverlay(ped, 1, data["beard"].item, 1.0)
    SetPedHeadOverlayColor(ped, 1, 1, data["beard"].texture, 0)

    -- Blush
    SetPedHeadOverlay(ped, 5, data["blush"].item, 1.0)
    SetPedHeadOverlayColor(ped, 5, 1, data["blush"].texture, 0)

    -- Lipstick
    SetPedHeadOverlay(ped, 8, data["lipstick"].item, 1.0)
    SetPedHeadOverlayColor(ped, 8, 1, data["lipstick"].item, 0)

    -- Makeup
    SetPedHeadOverlay(ped, 4, data["makeup"].item, 1.0)
    SetPedHeadOverlayColor(ped, 4, 1, data["blush"].texture, 0)

    -- Ageing
    SetPedHeadOverlay(ped, 3, data["ageing"].item, 1.0)
    SetPedHeadOverlayColor(ped, 3, 1, data["ageing"].texture, 0)

    -- Arms
    SetPedComponentVariation(ped, 3, data["arms"].item, 0, 2)
    SetPedComponentVariation(ped, 3, data["arms"].item, data["arms"].texture, 0)

    -- T-Shirt
    SetPedComponentVariation(ped, 8, data["t-shirt"].item, 0, 2)
    SetPedComponentVariation(ped, 8, data["t-shirt"].item, data["t-shirt"].texture, 0)

    -- Vest
    SetPedComponentVariation(ped, 9, data["vest"].item, 0, 2)
    SetPedComponentVariation(ped, 9, data["vest"].item, data["vest"].texture, 0)

    -- Torso 2
    SetPedComponentVariation(ped, 11, data["torso2"].item, 0, 2)
    SetPedComponentVariation(ped, 11, data["torso2"].item, data["torso2"].texture, 0)

    -- Shoes
    SetPedComponentVariation(ped, 6, data["shoes"].item, 0, 2)
    SetPedComponentVariation(ped, 6, data["shoes"].item, data["shoes"].texture, 0)

    -- Mask
    SetPedComponentVariation(ped, 1, data["mask"].item, 0, 2)
    SetPedComponentVariation(ped, 1, data["mask"].item, data["mask"].texture, 0)

    -- Hat
    SetPedPropIndex(ped, 0, data["hat"].item, data["hat"].texture, true)

    -- Glass
    SetPedPropIndex(ped, 1, data["glass"].item, data["glass"].texture, true)

    -- Ear
    SetPedPropIndex(ped, 2, data["ear"].item, data["ear"].texture, true)

    -- Watch
    SetPedPropIndex(ped, 6, data["watch"].item, data["watch"].texture, true)

    -- Bracelet
    SetPedPropIndex(ped, 7, data["bracelet"].item, data["bracelet"].texture, true)

    print('Clothing loaded')
end)

RegisterNetEvent('qb-clothing:client:loadOutfit')
AddEventHandler('qb-clothing:client:loadOutfit', function(data)
    local ped = GetPlayerPed(-1)

    -- Pants
    SetPedComponentVariation(ped, 4, data["pants"].item, 0, 0)
    SetPedComponentVariation(ped, 4, data["pants"].item, data["pants"].texture, 0)

    -- Arms
    SetPedComponentVariation(ped, 3, data["arms"].item, 0, 2)
    SetPedComponentVariation(ped, 3, data["arms"].item, data["arms"].texture, 0)

    -- T-Shirt
    SetPedComponentVariation(ped, 8, data["t-shirt"].item, 0, 2)
    SetPedComponentVariation(ped, 8, data["t-shirt"].item, data["t-shirt"].texture, 0)

    -- Vest
    SetPedComponentVariation(ped, 9, data["vest"].item, 0, 2)
    SetPedComponentVariation(ped, 9, data["vest"].item, data["vest"].texture, 0)

    -- Torso 2
    SetPedComponentVariation(ped, 11, data["torso2"].item, 0, 2)
    SetPedComponentVariation(ped, 11, data["torso2"].item, data["torso2"].texture, 0)

    -- Shoes
    SetPedComponentVariation(ped, 6, data["shoes"].item, 0, 2)
    SetPedComponentVariation(ped, 6, data["shoes"].item, data["shoes"].texture, 0)

    -- Mask
    SetPedComponentVariation(ped, 1, data["mask"].item, 0, 2)
    SetPedComponentVariation(ped, 1, data["mask"].item, data["mask"].texture, 0)

    -- Hat
    SetPedPropIndex(ped, 0, data["hat"].item, data["hat"].texture, true)

    -- Glass
    SetPedPropIndex(ped, 1, data["glass"].item, data["glass"].texture, true)

    -- Ear
    SetPedPropIndex(ped, 2, data["ear"].item, data["ear"].texture, true)

    print('Outfit loaded')
end)