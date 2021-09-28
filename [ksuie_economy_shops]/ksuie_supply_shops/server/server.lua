-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

local blueberry_price = 0
local cloth_price = 0
local rope_price = 0
local woodenplanks_price = 0
local stones_price = 0
local hitch_price = 0
local woodenlogs_price = 0
local tent_price = 0
local stick_price = 0
local emptybottle_price = 0
local blueberry_econFactor
local cloth_econFactor
local rope_econFactor
local woodenplanks_econFactor
local stones_econFactor
local hitch_econFactor
local woodenlogs_econFactor
local tent_econFactor
local stick_econFactor
local emptybottle_econFactor

AddEventHandler("redemrp:playerLoaded", function(source, user)
    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'blueberry' ", {}, function(result)
        if result[1] ~= nil then
            blueberry_econFactor = result[1].factor
            print(result[1])
            print(blueberry_econFactor)
        else
            print("no result")
        end
    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'cloth' ", {}, function(result)
        if result[1] ~= nil then
            cloth_econFactor = result[1].factor
            print(result[1])
            print(cloth_econFactor)
        else
            print("no result")
        end
    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'rope' ", {}, function(result)
        if result[1] ~= nil then
            rope_econFactor = result[1].factor
            print(result[1])
            print(rope_econFactor)
        else
            print("no result")
        end
    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'woodenplanks' ", {}, function(result)
        if result[1] ~= nil then
            woodenplanks_econFactor = result[1].factor
            print(result[1])
            print(woodenplanks_econFactor)
        else
            print("no result")
        end
    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'stones' ", {}, function(result)
        if result[1] ~= nil then
            stones_econFactor = result[1].factor
            print(result[1])
            print(stones_econFactor)
        else
            print("no result")
        end
    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'hitch' ", {}, function(result)
        if result[1] ~= nil then
            hitch_econFactor = result[1].factor
            print(result[1])
            print(hitch_econFactor)
        else
            print("no result")
        end
    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'woodenlogs' ", {}, function(result)
        if result[1] ~= nil then
            woodenlogs_econFactor = result[1].factor
            print(result[1])
            print(woodenlogs_econFactor)
        else
            print("no result")
        end
    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'tent' ", {}, function(result)
        if result[1] ~= nil then
            tent_econFactor = result[1].factor
            print(result[1])
            print(tent_econFactor)
        else
            print("no result")
        end
    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'stick' ", {}, function(result)
        if result[1] ~= nil then
            stick_econFactor = result[1].factor
            print(result[1])
            print(stick_econFactor)
        else
            print("no result")
        end
    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'emptybottle' ", {}, function(result)
        if result[1] ~= nil then
            emptybottle_econFactor = result[1].factor
            print(result[1])
            print(emptybottle_econFactor)
        else
            print("no result")
        end
    end)

end)


-- buy supplies
RegisterServerEvent('supplyshop:buy')
AddEventHandler("supplyshop:buy", function(price, item, lvl)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local ItemInfo = data.getItemData(item) -- return info from config
        local identifier = user.getIdentifier()
		local level = user.getLevel()
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

-- sell supplies
RegisterServerEvent('supplyshop:sell')
AddEventHandler('supplyshop:sell', function(price, supply)
    print(price.."&"..supply)
    local lookupitem = "'"..supply.."'"
    print(lookupitem)
    local _source = source
    local ItemInfo = data.getItemData(supply) -- return info from config
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local ItemData = data.getItem(_source, supply)
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
            TriggerClientEvent('EconomyFactorCalc', source, 0, supply, totalitem, "blank")

        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any '..ItemInfo.label..' to sell', 5)
        end
    end)
end)

RegisterServerEvent('FetchPrices')
AddEventHandler('FetchPrices', function()
    print("Command Received Supply Fetch")
    local _source = source
    local blueberryInfo = data.getItemData('blueberry')
    print(blueberryInfo.price_buy.."  "..blueberryInfo.label)

    local clothInfo = data.getItemData('cloth')
    print(clothInfo.price_buy.."  "..clothInfo.label)

    local ropeInfo = data.getItemData('rope')
    print(ropeInfo.price_buy.."  "..ropeInfo.label)

    local woodenplanksInfo = data.getItemData('woodenplanks')
    print(woodenplanksInfo.price_buy.."  "..woodenplanksInfo.label)

    local stonesInfo = data.getItemData('stones')
    print(stonesInfo.price_buy.."  "..stonesInfo.label)

    local hitchInfo = data.getItemData('hitch')
    print(hitchInfo.price_buy.."  "..hitchInfo.label)

    local woodenlogsInfo = data.getItemData('woodenlogs')
    print(woodenlogsInfo.price_buy.."  "..woodenlogsInfo.label)

    local tentInfo = data.getItemData('tent')
    print(tentInfo.price_buy.."  "..tentInfo.label)

    local stickInfo = data.getItemData('stick')
    print(stickInfo.price_buy.."  "..stickInfo.label)

    local emptybottleInfo = data.getItemData('emptybottle')
    print(emptybottleInfo.price_buy.."  "..emptybottleInfo.label)

    blueberry_price = blueberryInfo.price_buy
    cloth_price = clothInfo.price_buy
    rope_price = ropeInfo.price_buy
    woodenplanks_price = woodenplanksInfo.price_buy
    woodenplanks_price = stonesInfo.price_buy
    hitch_price = hitchInfo.price_buy
    woodenlogs_price = woodenlogsInfo.price_buy
    tent_price = tentInfo.price_buy
    stick_price = stickInfo.price_buy
    emptybottle_price = emptybottleInfo.price_buy
    print("Supply Prices sent to client")

    TriggerClientEvent('PricesSet', _source, blueberry_price, cloth_price, rope_price, woodenplanks_price, stones_price, hitch_price, woodenlogs_price, tent_price,stick_price, emptybottle_price, emptybottle_price)
    print(blueberry_price.." & "..cloth_price.." & "..rope_price.." & "..woodenplanks_price.." & "..hitch_price.." & "..woodenlogs_price.." & "..tent_price.." & "..stick_price.." & "..emptybottle_price)
    print("Supply Server Send Complete")

end)

--=======================================================================Economy Timer=========================================
local timer = 600 --10 minutes = 600 (10*60)
local timeron = true


AddEventHandler("redemrp:playerLoaded", function(source, user)
    while true do
        Citizen.Wait(0)
        local _source = source
        local tick = 600000 --ticker = 1000 = 1 second 
        --supply
        local p12 = 'blueberry'
        local p13 = 'cloth'
        local p14 = 'rope'
        local p15 = 'woodenplanks'
        local p16 = 'stones'
        local p17 = 'hitch'
        local p18 = 'woodenplanks'
        local p19 = 'tent'
        local p20 = 'stick'
        local p21 = 'emptybottle'

        if timeron then
            if timer <= 0 then
            --supply
                TriggerClientEvent('EconomyFactorCalc',_source, 1, p12, 50, "blank" )
                Citizen.Wait(300)
                TriggerClientEvent('EconomyFactorCalc',_source, 1, p13, 50, "blank" )
                Citizen.Wait(300)
                TriggerClientEvent('EconomyFactorCalc',_source, 1, p14, 50, "blank" )
                Citizen.Wait(300)
                TriggerClientEvent('EconomyFactorCalc',_source, 1, p15, 50, "blank" )
                Citizen.Wait(300)
                TriggerClientEvent('EconomyFactorCalc',_source, 1, p16, 50, "blank" )
                Citizen.Wait(300)
                TriggerClientEvent('EconomyFactorCalc',_source, 1, p17, 50, "blank" )
                Citizen.Wait(300)
                TriggerClientEvent('EconomyFactorCalc',_source, 1, p18, 50, "blank" )
                Citizen.Wait(300)
                TriggerClientEvent('EconomyFactorCalc',_source, 1, p19, 50, "blank" )
                Citizen.Wait(300)
                TriggerClientEvent('EconomyFactorCalc',_source, 1, p20, 50, "blank" )
                Citizen.Wait(300)
                TriggerClientEvent('EconomyFactorCalc',_source, 1, p21, 50, "blank" )
                Citizen.Wait(5000)
                timer = 600
                print("Supply Economy Updated")

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
    Citizen.Wait(5000)
    TriggerClientEvent('ReceiveSupplyFactors', _source, blueberry_econFactor, cloth_econFactor, blueberry_econFactor, cloth_econFactor, rope_econFactor, woodenplanks_econFactor, stones_econFactor, hitch_econFactor, woodenlogs_econFactor, tent_econFactor, stick_econFactor, "blank")
    print("S304 Supply: Factors Sent to Client")

end)

RegisterServerEvent('UpdateMultiplier')
AddEventHandler('UpdateMultiplier', function(product, mult, econfactor)
    print("S310 Supply: UPDATING ECON DATABASE WITH NEW VALUES")

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
    print("S329 Supply: Identifier="..identifier.." multiplier="..multi.." factor="..fac.." DBUPDATED")

end)
