QBCore.Functions = {}

QBCore.Functions.GetPlayerData = function()
	return QBCore.PlayerData
end

QBCore.Functions.DrawText = function(x, y, width, height, scale, r, g, b, a, text)
	SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

QBCore.Functions.GetCoords = function(entity)
    local coords = GetEntityCoords(entity, false)
    local heading = GetEntityHeading(entity)
    return {
        x = coords.x,
        y = coords.y,
        z = coords.z,
        a = heading
    }
end

QBCore.Functions.SpawnVehicle = function(model, cb, coords, isnetworked)
    local model = (type(model)=="number" and model or GetHashKey(model))
    local coords = coords ~= nil and coords or QBCore.Functions.GetCoords(GetPlayerPed(-1))
    local isnetworked = isnetworked ~= nil and isnetworked or true

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(10)
    end

    local veh = CreateVehicle(model, coords.x, coords.y, coords.z, coords.a, isnetworked, false)
    local netid = NetworkGetNetworkIdFromEntity(veh)

    SetNetworkIdCanMigrate(netid, true)
    SetEntityAsMissionEntity(veh, true, true)
    SetVehicleNeedsToBeHotwired(veh, false)
    SetVehRadioStation(veh, "OFF")

    SetModelAsNoLongerNeeded(model)

    if cb ~= nil then
        cb(veh)
    end
end

QBCore.Functions.DeleteVehicle = function(vehicle)
    SetEntityAsMissionEntity(vehicle, true, true)
    DeleteVehicle(vehicle)
end

QBCore.Functions.GetClosestVehicle = function(coords, radius)
    local coords = coords ~= nil and coords or QBCore.Functions.GetCoords(GetPlayerPed(-1))
    local radius = radius ~= nil and radius or 10.0
    local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, radius, 0.0)
    local rayHandle = CastRayPointToPoint(coords.x, coords.y, coords.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
    local a, b, c, d, targetVehicle = GetRaycastResult(rayHandle)

    if targetVehicle ~= nil then
       return targetVehicle
    end
    return 0
end

QBCore.Functions.Notify = function(text, textype, length) -- [text] = message, [type] = primary | error | success, [length] = time till fadeout.
    local ttype = textype ~= nil and textype or "primary"
    local length = length ~= nil and length or 2500
    SendNUIMessage({
        action = "show",
        type = ttype,
        length = length,
        text = text,
    })
end