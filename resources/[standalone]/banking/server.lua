QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

-- Code

RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    local bankamount = ply.PlayerData.money["bank"]
    if bankamount >= amount then
        ply.Functions.RemoveMoney('bank', amount)
        TriggerEvent("qb-log:server:CreateLog", "banking", "Withdraw", "red", "**"..GetPlayerName(src) .. "** heeft €"..amount.." opgenomen van zijn bank.")
        ply.Functions.AddMoney('cash', amount)
      else
        TriggerClientEvent('QBCore:Notify', src, 'Je hebt niet voldoende geld op je bank..', 'error')
      end
    else
      TriggerClientEvent('QBCore:Notify', src, 'Je hebt niet voldoende geld op je bank..', 'error')
    end
end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)

    if ply.Functions.RemoveMoney('cash', amount) then
      TriggerEvent("qb-log:server:CreateLog", "banking", "Deposit", "green", "**"..GetPlayerName(src) .. "** heeft €"..amount.." op zijn bank gezet.")
      ply.Functions.AddMoney('bank', amount)
    else
      TriggerClientEvent('QBCore:Notify', src, 'Je hebt niet voldoende geld op zak..', 'error')
    end
end)

QBCore.Commands.Add("geefcontant", "Geef contant geld aan een persoon", {{name="id", help="Speler ID"},{name="bedrag", help="Hoeveelheid geld"}}, true, function(source, args)
  local Player = QBCore.Functions.GetPlayer(source)
  local TargetId = tonumber(args[1])
  local Target = QBCore.Functions.GetPlayer(TargetId)
  local amount = tonumber(args[2])
  
  if Target ~= nil then
    if amount ~= nil then
      if amount > 0 then
        if Player.PlayerData.money.cash >= amount then
          if TargetId ~= source then
            TriggerClientEvent('banking:client:CheckDistance', source, TargetId, amount)
          else
            TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Je kunt geen geld aan jezelf geven.")
          end
        else
          TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Je hebt niet genoeg geld.")
        end
      else
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "De hoeveelheid moet hoger zijn dan 0.")
      end
    else
      TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Vul een hoeveelheid in.")
    end
  else
    TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Persoon is niet in de stad.")
  end    
end)

RegisterServerEvent('banking:server:giveCash')
AddEventHandler('banking:server:giveCash', function(trgtId, amount)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local Target = QBCore.Functions.GetPlayer(trgtId)

  Player.Functions.RemoveMoney('cash', amount)
  Target.Functions.AddMoney('cash', amount)

  TriggerEvent("qb-log:server:CreateLog", "banking", "Geef contant", "blue", "**"..GetPlayerName(src) .. "** heeft €"..amount.." gegeven aan **" .. GetPlayerName(trgtId) .. "**")
  
  TriggerClientEvent('QBCore:Notify', trgtId, "Je hebt €"..amount.." gekregen van "..Player.PlayerData.charinfo.firstname.."!", 'success')
  TriggerClientEvent('QBCore:Notify', src, "Je hebt €"..amount.." gegeven aan "..Target.PlayerData.charinfo.firstname.."!", 'success')
end)