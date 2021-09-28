-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

local goldnugget_price = 0
local goldbar_price = 0
local golden_nugget_econFactor
local goldbar_econFactor

AddEventHandler("redemrp:playerLoaded", function(source, user)
    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'golden_nugget' ", {}, function(result)
        if result[1] ~= nil then
            golden_nugget_econFactor = result[1].factor
            print(result[1])
            print(golden_nugget_econFactor)
        else
            print("no result")
        end
    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'goldbar' ", {}, function(result)
        if result[1] ~= nil then
            goldbar_econFactor = result[1].factor
            print(result[1])
            print(goldbar_econFactor)
        else
            print("no result")
        end
    end)
end)
-- buy gold
RegisterServerEvent('goldshop:buy')
AddEventHandler("goldshop:buy", function(price, item, lvl)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
		local level = user.getLevel()
        local ItemInfo = data.getItemData(item) -- return info from config

        if user.getMoney() >= price then
            if level >= lvl then
                user.removeMoney(price)
				local ItemData = data.getItem(source, item)
				print(ItemData.ItemAmount)
				ItemData.AddItem(1)
                TriggerClientEvent("redemrp_notification:start", source, "Bought "..ItemInfo.label, 3, "success")
                TriggerClientEvent('EconomyFactorCalc', source, 1, item, ItemData.ItemAmount, "blank")

            else 
                TriggerClientEvent('redemrp_gunshop:alert', source, "You are not a high enough level!")
            end
        else
            TriggerClientEvent('redemrp_gunshop:alert', source, "You dont have enough money!")
        end
	end)
end)

-- sell gold
RegisterServerEvent('goldshop:sell')
AddEventHandler('goldshop:sell', function(price, gold)
    print(price.."&"..gold)
    local lookupitem = "'"..gold.."'"
    print(lookupitem)
    local _source = source
    local ItemInfo = data.getItemData(gold) -- return info from config
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local ItemData = data.getItem(_source, gold)
		print(ItemData.ItemAmount..lookupitem..ItemInfo.label)
		local totalitem = (ItemData.ItemAmount)
        print(totalitem)
		if totalitem >= 1 then
			local totalmoney = (totalitem * price)
			local totalxp = (totalitem)
			user.addMoney(totalmoney)
			user.addXP(totalxp)
            ItemData.RemoveItem(totalitem)
            TriggerClientEvent("redemrp_notification:start", _source, "You sold " .. totalitem .." "..ItemInfo.label.." for $" ..totalmoney.." and got "..totalxp.."XP", 5)
            TriggerClientEvent('EconomyFactorCalc', source, 0, gold, totalitem, "blank")

        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any '..ItemInfo.label..' to sell', 5)
        end
    end)
end)

RegisterServerEvent('GoldPrice')
AddEventHandler('GoldPrice', function()
    print("Command Received Butcher Fetch")
    local _source = source
    local golden_nuggetInfo = data.getItemData('golden_nugget')
    print(golden_nuggetInfo.price_buy.."  "..golden_nuggetInfo.label)
    local goldBarInfo = data.getItemData('goldbar')
    print(goldBarInfo.price_buy.."  "..goldBarInfo.label)

    goldnugget_price = golden_nuggetInfo.price_buy
    goldbar_price = goldBarInfo.price_buy
    print("S93: Prices sent to client"..goldnugget_price.." nug "..goldbar_price.." bar")

    TriggerClientEvent("GoldPriceFetched", 
        _source,
        goldnugget_price,
        goldbar_price,
        goldbar_price
        )

end)

--=============================================================Economy Timer==========================================
local timer = 600 --10 minutes = 600 (10*60)
local timeron = true


AddEventHandler("redemrp:playerLoaded", function(source, user)
    while true do
        Citizen.Wait(0)
        local _source = source
        local tick = 600000 --ticker = 1000 = 1 second 
        --gold
        local p22 = 'golden_nugget'
        local p23 = 'goldbar'
        
        if timeron then
            if timer <= 0 then
            --gold
                TriggerClientEvent('EconomyFactorCalc',_source, 1, p22, 10, "blank" )
                Citizen.Wait(300)
                TriggerClientEvent('EconomyFactorCalc',_source, 1, p23, 10, "blank" )
                Citizen.Wait(5000)
                timer = 600
                print("Meat Economy Updated")

        else
        Citizen.Wait(tick)
        print("Timer: "..timer)
        timer = (timer-timer)
        end
    else
        Citizen.Wait(60000)
    end
end
end)

--SEND ECONOMY FACTOR TO SERVER
AddEventHandler("redemrp:playerLoaded", function(source, user)
    local _source = source
    Citizen.Wait(4900)
    TriggerClientEvent('ReceiveGoldFactors', _source, golden_nugget_econFactor, goldbar_econFactor, "blank")
end)

RegisterServerEvent('UpdateMultiplier')
AddEventHandler('UpdateMultiplier', function(product, mult, econfactor)
    print("C156 Gold: UPDATING ECON DATABASE WITH NEW VALUES")

    local identifier = product
    local multi = mult
    local fac = econfactor
    MySQL.Async.execute('UPDATE economy SET multiplier = @multiplier WHERE identifier = @identifier', {
        ['@identifier']  = identifier,
        ['@multiplier']  = multi
    }, function (rowschanged)
        print(rowschanged)
    end)
    Citizen.Wait(300)
    MySQL.Async.execute('UPDATE economy SET factor = @factor WHERE identifier = @identifier', {
        ['@identifier']  = identifier,
        ['@factor'] = fac
    }, function (rowschanged)
        print(rowschanged)
    end)
    Citizen.Wait(300)
    print("C175 Gold: Identifier="..identifier.." multiplier="..multi.." factor="..fac.." DBUPDATED")
end)
