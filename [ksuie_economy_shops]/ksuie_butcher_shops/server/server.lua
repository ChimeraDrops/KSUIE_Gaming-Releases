-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

local biggame_price = 0
local venison_price = 0
local beef_price = 0
local aligatormeat_price = 0
local bird_price = 0
local game_price = 0
local pork_price = 0
local fishmeat_price = 0
local herptile_price = 0
local stringy_price = 0
local mutton_price = 0
local biggame_econFactor = 999
local venison_econFactor = 999
local beef_econFactor = 999
local aligatormeat_econFactor = 999
local bird_econFactor = 999
local game_econFactor = 999
local pork_econFactor = 999
local fishmeat_econFactor = 999
local herptile_econFactor = 999
local stringy_econFactor = 999
local mutton_econFactor = 999

--SET ECONOMY FACTOR FROM DATABASE ON PLAYER LOAD
AddEventHandler("redemrp:playerLoaded", function(source, user)
    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'biggame' ", {}, function(result)
        if result[1] ~= nil then
            biggame_econFactor = result[1].factor
            print(result[1])
            print(biggame_econFactor)
        else
            print("no result")
        end
    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'venison' ", {}, function(result)
        if result[1] ~= nil then
            venison_econFactor = result[1].factor
            print(result[1])
            print(venison_econFactor)
        else
            print("no result")
        end

    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'beef' ", {}, function(result)
        if result[1] ~= nil then
            beef_econFactor = result[1].factor
            print(result[1])
            print(beef_econFactor)
        else
            print("no result")
        end

    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'aligatormeat' ", {}, function(result)
        if result[1] ~= nil then
            aligatormeat_econFactor = result[1].factor
            print(result[1])
            print(aligatormeat_econFactor)
        else
            print("no result")
        end

    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'bird' ", {}, function(result)
        if result[1] ~= nil then
            bird_econFactor = result[1].factor
            print(result[1])
            print(bird_econFactor)
        else
            print("no result")
        end

    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'game' ", {}, function(result)
        if result[1] ~= nil then
            game_econFactor = result[1].factor
            print(result[1])
            print(game_econFactor)
        else
            print("no result")
        end

    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'pork' ", {}, function(result)
        if result[1] ~= nil then
            pork_econFactor = result[1].factor
            print(result[1])
            print(pork_econFactor)
        else
            print("no result")
        end

    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'fishmeat' ", {}, function(result)
        if result[1] ~= nil then
            fishmeat_econFactor = result[1].factor
            print(result[1])
            print(fishmeat_econFactor)
        else
            print("no result")
        end

    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'herptile' ", {}, function(result)
        if result[1] ~= nil then
            herptile_econFactor = result[1].factor
            print(result[1])
            print(herptile_econFactor)
        else
            print("no result")
        end

    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'stringy' ", {}, function(result)
        if result[1] ~= nil then
            stringy_econFactor = result[1].factor
            print(result[1])
            print(stringy_econFactor)
        else
            print("no result")
        end

    end)

    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = 'mutton' ", {}, function(result)
        if result[1] ~= nil then
            mutton_econFactor = result[1].factor
            print(result[1])
            print(mutton_econFactor)
        else
            print("no result")
        end

    end)

    Citizen.Wait(300)
    print("S40: biggame_econFactor="..biggame_econFactor)
    print("S46: venison_econFactor="..venison_econFactor)
    print("S53: beef_econFactor="..beef_econFactor)
    print("S60: aligatormeat_econFactor="..aligatormeat_econFactor)
    print("S67: bird_econFactor="..bird_econFactor)
    print("S74: game_econFactor="..game_econFactor)
    print("S81: pork_econFactor="..pork_econFactor)
    print("S87: fishmeat_econFactor="..fishmeat_econFactor)
    print("S93: herptile_econFactor="..herptile_econFactor)
    print("S100: stringy_econFactor="..stringy_econFactor)
    print("S106: mutton_econFactor="..mutton_econFactor)

end)
--ECONOMY FACTOR SET

-- buy raw meat
RegisterServerEvent('meatshop:buy')
AddEventHandler("meatshop:buy", function(price, item, lvl)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
		local level = user.getLevel()
        local ItemInfo = data.getItemData(item) -- return info from config
        local transaction_buy = 1

        if user.getMoney() >= price then
            if level >= lvl then
                user.removeMoney(price)
				local ItemData = data.getItem(source, item)
				print(ItemData.ItemAmount)
				ItemData.AddItem(1)
                TriggerClientEvent("redemrp_notification:start", source, "Bought "..ItemInfo.label, 3, "success")
                TriggerEvent('EconomyFactorCalc', source, transaction_buy, item, 1, "blank")
                print("S189: RECALC ECON FACTOR"..transaction_buy.." "..item.." "..1)
            else 
                TriggerClientEvent('redemrp_gunshop:alert', source, "You are not a high enough level!")
            end
        else
            TriggerClientEvent('redemrp_gunshop:alert', source, "You dont have enough money!")
        end
	end)
end)

-- sell raw meat
RegisterServerEvent('meatshop:sell')
AddEventHandler('meatshop:sell', function(price, meat)
    print(price.."&"..meat)
    local lookupitem = "'"..meat.."'"
    print(lookupitem)
    local _source = source
    local ItemInfo = data.getItemData(meat) -- return info from config
    local transaction_sell = 0
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local ItemData = data.getItem(_source, meat)
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
            TriggerEvent('EconomyFactorCalc', source, transaction_sell, meat, totalitem, "blank")
            print("S221: RECALC ECON FACTOR"..transaction_sell.." "..meat.." "..totalitem)


        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any '..ItemInfo.label..' to sell', 5)
        end
    end)
end)

-- buy cooked meat
RegisterServerEvent('cookedmeatshop:buy')
AddEventHandler("cookedmeatshop:buy", function(price, item, lvl)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
		local level = user.getLevel()
        local ItemInfo = data.getItemData(item) -- return info from config
        local transaction_buy = 1
        local EconConvert = nil
        if item == "cookedbiggame" then
            EconConvert = "biggame"
        elseif item == "cookedvenison" then
            EconConvert = "venison"
        elseif item == "cookedbeef" then
            EconConvert = "beef"
        elseif item == "cookedaligatormeat" then
            EconConvert = "aligatormeat"
        elseif item == "cookedbird" then
            EconConvert = "bird"
        elseif item == "cookedgame" then
            EconConvert = "game"
        elseif item == "cookedpork" then
            EconConvert = "pork"
        elseif item == "cookedfishmeat" then
            EconConvert = "fishmeat"
        elseif item == "cookedherptile" then
            EconConvert = "herptile"
        elseif item == "cookedstringy" then
            EconConvert = "stringy"
        elseif item == "cookedmutton" then
            EconConvert = "mutton"
        end

        if user.getMoney() >= price then
            if level >= lvl then
                user.removeMoney(price)
				local ItemData = data.getItem(source, item)
				print(ItemData.ItemAmount)
				ItemData.AddItem(1)
                TriggerClientEvent("redemrp_notification:start", source, "Bought "..ItemInfo.label, 3, "success")
                TriggerEvent('EconomyFactorCalc', source, 1, EconConvert, 1, "blank")
                print("S271: RECALC ECON FACTOR"..transaction_buy.." "..EconConvert.." "..1)
            else 
                TriggerClientEvent('redemrp_gunshop:alert', source, "You are not a high enough level!")
            end
        else
            TriggerClientEvent('redemrp_gunshop:alert', source, "You dont have enough money!")
        end
	end)
end)

-- sell cooked meat
RegisterServerEvent('cookedmeatshop:sell')
AddEventHandler('cookedmeatshop:sell', function(price, meat)
    print(price.."&"..meat)
    local lookupitem = "'"..meat.."'"
    print(lookupitem)
    local _source = source
    local ItemInfo = data.getItemData(meat) -- return info from config
    local transaction_sell = 0

    local EconConvert = nil
    if item == "cookedbiggame" then
        EconConvert = "biggame"
    elseif item == "cookedvenison" then
        EconConvert = "venison"
    elseif item == "cookedbeef" then
        EconConvert = "beef"
    elseif item == "cookedaligatormeat" then
        EconConvert = "aligatormeat"
    elseif item == "cookedbird" then
        EconConvert = "bird"
    elseif item == "cookedgame" then
        EconConvert = "game"
    elseif item == "cookedpork" then
        EconConvert = "pork"
    elseif item == "cookedfishmeat" then
        EconConvert = "fishmeat"
    elseif item == "cookedherptile" then
        EconConvert = "herptile"
    elseif item == "cookedstringy" then
        EconConvert = "stringy"
    elseif item == "cookedmutton" then
        EconConvert = "mutton"
    end

    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local ItemData = data.getItem(_source, meat)
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
            TriggerEvent('EconomyFactorCalc', source, 0, EconConvert, totalitem, "blank")
            print("S189: RECALC ECON FACTOR"..transaction_sell.." "..EconConvert.." "..totalitem)

        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any '..ItemInfo.label..' to sell', 5)
        end
    end)
end)



RegisterServerEvent('ButcherFetchRawPrice')
AddEventHandler('ButcherFetchRawPrice', function()
    print("Command Received Butcher Fetch")
    local _source = source
    local biggameInfo = data.getItemData('biggame')
    print(biggameInfo.price_buy.."  "..biggameInfo.label)
    local venisonInfo = data.getItemData('venison')
    print(venisonInfo.price_buy.."  "..venisonInfo.label)
    local beefInfo = data.getItemData('beef')
    print(beefInfo.price_buy.."  "..beefInfo.label)
    local aligatormeatInfo = data.getItemData('aligatormeat')
    print(aligatormeatInfo.price_buy.."  "..aligatormeatInfo.label)
    local birdInfo = data.getItemData('bird')
    print(birdInfo.price_buy.."  "..birdInfo.label)
    local gameInfo = data.getItemData('game')
    print(gameInfo.price_buy.."  "..gameInfo.label)
    local porkInfo = data.getItemData('pork')
    print(porkInfo.price_buy.."  "..porkInfo.label)
    local fishmeatInfo = data.getItemData('fishmeat')
    print(fishmeatInfo.price_buy.."  "..fishmeatInfo.label)
    local herptileInfo = data.getItemData('herptile')
    print(herptileInfo.price_buy.."  "..herptileInfo.label)
    local stringyInfo = data.getItemData('stringy')
    print(stringyInfo.price_buy.."  "..stringyInfo.label)
    local muttonInfo = data.getItemData('mutton')
    print(muttonInfo.price_buy.."  "..muttonInfo.label)

    biggame_price = biggameInfo.price_buy
    venison_price = venisonInfo.price_buy
    beef_price = beefInfo.price_buy
    aligatormeat_price = aligatormeatInfo.price_buy
    bird_price = birdInfo.price_buy
    game_price = gameInfo.price_buy
    pork_price = porkInfo.price_buy
    fishmeat_price = fishmeatInfo.price_buy
    herptile_price = herptileInfo.price_buy
    stringy_price = stringyInfo.price_buy
    mutton_price = muttonInfo.price_buy
    print("Prices sent to client")

    TriggerClientEvent("ButcherRawPriceFetched", 
        _source,
        biggame_price,
        venison_price,
        beef_price,
        aligatormeat_price,
        bird_price,
        game_price,
        pork_price,
        fishmeat_price,
        herptile_price,
        stringy_price,
        mutton_price,
        mutton_price
        )

end)

--============================================================Economy Timer=======================================================================
local timer = 600 --10 minutes = 600 (10*60)
local timeron = true


AddEventHandler("redemrp:playerLoaded", function(source, user)
    while true do
        Citizen.Wait(0)
        local _source = source
        local tick = 600000 --ticker = 1000 = 1 second 
        --meat
        local p1 = 'biggame'
        local p2 = 'venison'
        local p3 = 'beef'
        local p4 = 'aligatormeat'
        local p5 = 'bird'
        local p6 = 'game'
        local p7 = 'pork'
        local p8 = 'fishmeat'
        local p9 = 'herptile'
        local p10 = 'stringy'
        local p11 = 'mutton'
        
        if timeron then
            if timer <= 0 then
                --meat
                TriggerEvent('EconomyFactorCalc',_source, 1, p1, 50)
                Citizen.Wait(300)
                TriggerEvent('EconomyFactorCalc',_source, 1, p2, 50)
                Citizen.Wait(300)
                TriggerEvent('EconomyFactorCalc',_source, 1, p3, 50)
                Citizen.Wait(300)
                TriggerEvent('EconomyFactorCalc',_source, 1, p4, 50)
                Citizen.Wait(300)
                TriggerEvent('EconomyFactorCalc',_source, 1, p5, 50)
                Citizen.Wait(300)
                TriggerEvent('EconomyFactorCalc',_source, 1, p6, 50)
                Citizen.Wait(300)
                TriggerEvent('EconomyFactorCalc',_source, 1, p7, 50)
                Citizen.Wait(300)
                TriggerEvent('EconomyFactorCalc',_source, 1, p8, 50)
                Citizen.Wait(300)
                TriggerEvent('EconomyFactorCalc',_source, 1, p9, 50)
                Citizen.Wait(300)
                TriggerEvent('EconomyFactorCalc',_source, 1, p10, 50)
                Citizen.Wait(300)
                TriggerEvent('EconomyFactorCalc',_source, 1, p11, 50)
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
    Citizen.Wait(5000)
    TriggerClientEvent('ReceiveFactors', _source, biggame_econFactor, venison_econFactor, beef_econFactor, aligatormeat_econFactor, bird_econFactor, fishmeat_econFactor, game_econFactor, pork_econFactor, herptile_econFactor, stringy_econFactor, mutton_econFactor, "blank")

    print("S442: Factors Sent to Client")
end)

RegisterServerEvent('UpdateMultiplier')
AddEventHandler('UpdateMultiplier', function(product, mult, econfactor)
    print("S470 Meat: UPDATING ECON DATABASE WITH NEW VALUES")
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
    print("S488 Meat: Identifier="..identifier.." multiplier="..multi.." factor="..fac.." DBUPDATED")

end)

--UPDATE MULTIPLIER WHEN NO PLAYERS ONLINE
RegisterServerEvent('EconomyFactorCalc')
AddEventHandler('EconomyFactorCalc', function( transaction, product, amount)
    Citizen.Wait(300)
    print("C348:EconomyFactorCalc: Transaction ="..transaction.." Product = "..product.." Amount = "..amount)
    local buy_sell = transaction
    local productFactored = product
    local added = amount
    print("C249: Updating Economy Factor: VariablesBrought: Transaction = "..buy_sell.." Product = "..productFactored.."Amount = "..added)

    if product == "biggame" then
        if buy_sell == 0 then
            biggame_econFactor = biggame_econFactor-added
        elseif buy_sell == 1 then
            biggame_econFactor = biggame_econFactor+added
        end
        Citizen.Wait(100)
        if biggame_econFactor > 2000 then
            biggame_econFactor = 2000
        elseif biggame_econFactor <= 0 then
            biggame_econFactor = 1
        end
        biggame_mult = biggame_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, biggame_mult, biggame_econFactor)
        print("C369: VarSent to UpdateMultiplier: product="..product.." EconFactor = "..biggame_econFactor.." Multiplier = "..biggame_mult)

    elseif product == "venison" then
        if buy_sell == 0 then
            venison_econFactor = venison_econFactor-added
        elseif buy_sell == 1 then
            venison_econFactor = venison_econFactor+added
        end
        Citizen.Wait(100)
        if venison_econFactor > 2000 then
            venison_econFactor = 2000
        elseif venison_econFactor <= 0 then
            venison_econFactor = 1
        end
        venison_mult  = venison_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, venison_mult , venison_econFactor)

    elseif product == "beef" then
        if buy_sell == 0 then
            beef_econFactor = beef_econFactor-added
        elseif buy_sell == 1 then
            beef_econFactor = beef_econFactor+added
        end
        Citizen.Wait(100)
        if beef_econFactor > 2000 then
            beef_econFactor = 2000
        elseif beef_econFactor <= 0 then
            beef_econFactor = 1
        end
        beef_mult   = beef_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, beef_mult  , beef_econFactor)

    elseif product == "aligatormeat" then
        if buy_sell == 0 then
            aligatormeat_econFactor = aligatormeat_econFactor-added
        elseif buy_sell == 1 then
            aligatormeat_econFactor = aligatormeat_econFactor+added
        end
        Citizen.Wait(100)
        if aligatormeat_econFactor > 2000 then
            aligatormeat_econFactor = 2000
        elseif aligatormeat_econFactor <= 0 then
            aligatormeat_econFactor = 1
        end
        aligatormeat_mult    = aligatormeat_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, aligatormeat_mult   , aligatormeat_econFactor)

    elseif product == "bird" then
        if buy_sell == 0 then
            bird_econFactor = bird_econFactor-added
        elseif buy_sell == 1 then
            bird_econFactor = bird_econFactor+added
        end
        Citizen.Wait(100)
        if bird_econFactor > 2000 then
            bird_econFactor = 2000
        elseif bird_econFactor <= 0 then
            bird_econFactor = 1
        end
        bird_mult = bird_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, bird_mult, bird_econFactor)

    elseif product == "game" then
        if buy_sell == 0 then
            game_econFactor = game_econFactor-added
        elseif buy_sell == 1 then
            game_econFactor = game_econFactor+added
        end
        Citizen.Wait(100)
        if game_econFactor > 2000 then
            game_econFactor = 2000
        elseif game_econFactor <= 0 then
            game_econFactor = 1
        end
        game_mult  = game_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, game_mult , game_econFactor)
        
    elseif product == "pork" then
        if buy_sell == 0 then
            pork_econFactor = pork_econFactor-added
        elseif buy_sell == 1 then
            pork_econFactor = pork_econFactor+added
        end
        Citizen.Wait(100)
        if pork_econFactor > 2000 then
            pork_econFactor = 2000
        elseif pork_econFactor <= 0 then
            pork_econFactor = 1
        end
        pork_mult   = pork_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, pork_mult  , pork_econFactor)

    elseif product == "fishmeat" then
        if buy_sell == 0 then
            fishmeat_econFactor = fishmeat_econFactor-added
        elseif buy_sell == 1 then
            fishmeat_econFactor = fishmeat_econFactor+added
        end
        Citizen.Wait(100)
        if fishmeat_econFactor > 2000 then
            fishmeat_econFactor = 2000
        elseif fishmeat_econFactor <= 0 then
            fishmeat_econFactor = 1
        end
        fishmeat_mult    = fishmeat_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, fishmeat_mult   , fishmeat_econFactor)

    elseif product == "herptile" then
        if buy_sell == 0 then
            herptile_econFactor = herptile_econFactor-added
        elseif buy_sell == 1 then
            herptile_econFactor = herptile_econFactor+added
        end
        Citizen.Wait(100)
        if herptile_econFactor > 2000 then
            herptile_econFactor = 2000
        elseif herptile_econFactor <= 0 then
            herptile_econFactor = 1
        end
        herptile_mult = herptile_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, herptile_mult, herptile_econFactor)
        
    elseif product == "stringy" then
        if buy_sell == 0 then
            stringy_econFactor = stringy_econFactor-added
        elseif buy_sell == 1 then
            stringy_econFactor = stringy_econFactor+added
        end
        Citizen.Wait(100)
        if stringy_econFactor > 2000 then
            stringy_econFactor = 2000
        elseif stringy_econFactor <= 0 then
            stringy_econFactor = 1
        end
        stringy_mult = stringy_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, stringy_mult , stringy_econFactor)

    elseif product == "mutton" then
        if buy_sell == 0 then
            mutton_econFactor = mutton_econFactor-added
        elseif buy_sell == 1 then
            mutton_econFactor = mutton_econFactor+added
        end
        Citizen.Wait(100)
        if mutton_econFactor > 2000 then
            mutton_econFactor = 2000
        elseif mutton_econFactor <= 0 then
            mutton_econFactor = 1
        end
        mutton_mult = mutton_econFactor/1000
        TriggerServerEvent('UpdateMultiplier', product, mutton_mult , mutton_econFactor)
      end

end)

