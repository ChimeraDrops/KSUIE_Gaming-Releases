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
                TriggerEvent('SupplyEconomyFactorCalc', source, 1, item, ItemData.ItemAmount, "blank")
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
            TriggerEvent('SupplyEconomyFactorCalc', source, 0, supply, totalitem, "blank")

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
                TriggerEvent('SupplyEconomyFactorCalc',_source, 1, p12, 50, "blank" )
                Citizen.Wait(300)
                TriggerEvent('SupplyEconomyFactorCalc',_source, 1, p13, 50, "blank" )
                Citizen.Wait(300)
                TriggerEvent('SupplyEconomyFactorCalc',_source, 1, p14, 50, "blank" )
                Citizen.Wait(300)
                TriggerEvent('SupplyEconomyFactorCalc',_source, 1, p15, 50, "blank" )
                Citizen.Wait(300)
                TriggerEvent('SupplyEconomyFactorCalc',_source, 1, p16, 50, "blank" )
                Citizen.Wait(300)
                TriggerEvent('SupplyEconomyFactorCalc',_source, 1, p17, 50, "blank" )
                Citizen.Wait(300)
                TriggerEvent('SupplyEconomyFactorCalc',_source, 1, p18, 50, "blank" )
                Citizen.Wait(300)
                TriggerEvent('SupplyEconomyFactorCalc',_source, 1, p19, 50, "blank" )
                Citizen.Wait(300)
                TriggerEvent('SupplyEconomyFactorCalc',_source, 1, p20, 50, "blank" )
                Citizen.Wait(300)
                TriggerEvent('SupplyEconomyFactorCalc',_source, 1, p21, 50, "blank" )
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
--=============================================================Economy========================================================
RegisterServerEvent('SupplyEconomyFactorCalc')
AddEventHandler('SupplyEconomyFactorCalc', function( transaction, product, amount, blank)
    local buy_sell = transaction
    local productFactored = product
    local added = amount

    if product == "blueberry" then
        if buy_sell == 0 then
            blueberry_econFactor = blueberry_econFactor-added
        elseif buy_sell == 1 then
            blueberry_econFactor = blueberry_econFactor+added
        end
        Citizen.Wait(100)
        if blueberry_econFactor > 2000 then
            blueberry_econFactor = 2000
        elseif blueberry_econFactor <= 0 then
            blueberry_econFactor = 1
        end
        blueberry_mult  = blueberry_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, blueberry_mult  , blueberry_econFactor)

    elseif product == "cloth" then
        if buy_sell == 0 then
            cloth_econFactor = cloth_econFactor-added
        elseif buy_sell == 1 then
            cloth_econFactor = cloth_econFactor+added
        end
        Citizen.Wait(100)
        if cloth_econFactor > 2000 then
            cloth_econFactor = 2000
        elseif cloth_econFactor <= 0 then
            cloth_econFactor = 1
        end
        cloth_mult = cloth_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, cloth_mult , cloth_econFactor)

    elseif product == "rope" then
        if buy_sell == 0 then
            rope_econFactor = rope_econFactor-added
        elseif buy_sell == 1 then
            rope_econFactor = rope_econFactor+added
        end
        Citizen.Wait(100)
        if rope_econFactor > 2000 then
            rope_econFactor = 2000
        elseif rope_econFactor <= 0 then
            rope_econFactor = 1
        end
        rope_mult = rope_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, rope_mult , rope_econFactor)

    elseif product == "woodenplanks" then
        if buy_sell == 0 then
            woodenplanks_econFactor = woodenplanks_econFactor-added
        elseif buy_sell == 1 then
            woodenplanks_econFactor = woodenplanks_econFactor+added
        end
        Citizen.Wait(100)
        if woodenplanks_econFactor > 2000 then
            woodenplanks_econFactor = 2000
        elseif woodenplanks_econFactor <= 0 then
            woodenplanks_econFactor = 1
        end
        woodenplanks_mult = woodenplanks_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, woodenplanks_mult , woodenplanks_econFactor)

    elseif product == "stones" then
        if buy_sell == 0 then
            stones_econFactor = stones_econFactor-added
        elseif buy_sell == 1 then
            stones_econFactor = stones_econFactor+added
        end
        Citizen.Wait(100)
        if stones_econFactor > 2000 then
            stones_econFactor = 2000
        elseif stones_econFactor <= 0 then
            stones_econFactor = 1
        end
        stones_mult = stones_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, stones_mult , stones_econFactor)

    elseif product == "hitch" then
        if buy_sell == 0 then
            hitch_econFactor = hitch_econFactor-added
        elseif buy_sell == 1 then
            hitch_econFactor = hitch_econFactor+added
        end
        Citizen.Wait(100)
        if hitch_econFactor > 2000 then
            hitch_econFactor = 2000
        elseif hitch_econFactor <= 0 then
            hitch_econFactor = 1
        end
        hitch_mult = hitch_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, hitch_mult , hitch_econFactor)
        
    elseif product == "woodenlogs" then
        if buy_sell == 0 then
            woodenlogs_econFactor = woodenlogs_econFactor-added
        elseif buy_sell == 1 then
            woodenlogs_econFactor = woodenlogs_econFactor+added
        end
        Citizen.Wait(100)
        if woodenlogs_econFactor > 2000 then
            woodenlogs_econFactor = 2000
        elseif woodenlogs_econFactor <= 0 then
            woodenlogs_econFactor = 1
        end
        woodenlogs_mult = woodenlogs_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, woodenlogs_mult , woodenlogs_econFactor)

    elseif product == "tent" then
        if buy_sell == 0 then
            tent_econFactor = tent_econFactor-added
        elseif buy_sell == 1 then
            tent_econFactor = tent_econFactor+added
        end
        Citizen.Wait(100)
        if tent_econFactor > 2000 then
            tent_econFactor = 2000
        elseif tent_econFactor <= 0 then
            tent_econFactor = 1
        end
        tent_mult = tent_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, tent_mult , tent_econFactor)

    elseif product == "stick" then
        if buy_sell == 0 then
            stick_econFactor = stick_econFactor-added
        elseif buy_sell == 1 then
            stick_econFactor = stick_econFactor+added
        end
        Citizen.Wait(100)
        if stick_econFactor > 2000 then
            stick_econFactor = 2000
        elseif stick_econFactor <= 0 then
            stick_econFactor = 1
        end
        stick_mult = stick_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, stick_mult , stick_econFactor)

    elseif product == "emptybottle" then
        if buy_sell == 0 then
            emptybottle_econFactor = emptybottle_econFactor-added
        elseif buy_sell == 1 then
            emptybottle_econFactor = emptybottle_econFactor+added
        end
        Citizen.Wait(100)
        if emptybottle_econFactor > 2000 then
            emptybottle_econFactor = 2000
        elseif emptybottle_econFactor <= 0 then
            emptybottle_econFactor = 1
        end
        emptybottle_mult = emptybottle_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, emptybottle_mult , emptybottle_econFactor)

    end
    Citizen.Wait(3)
end)

RegisterNetEvent('UpdateMultiplier')
AddEventHandler('UpdateMultiplier', function(product, mult, econfactor)
    local identifier = product
    local multi = mult
    local fac = econfactor
    MySQL.Async.execute('UPDATE economy SET {multiplier = @multiplier, factor = @factor} WHERE identifier = @identifier', {
        ['@identifier']  = identifier,
        ['@multiplier']  = multi,
        ['@factor'] = fac
    }, function ()
    end)
    print("S437: Identifier="..identifier.." multiplier="..multi.." factor="..fac.." DBUPDATED")

end)
