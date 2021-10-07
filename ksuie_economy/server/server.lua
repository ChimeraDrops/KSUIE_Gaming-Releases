-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

--MEAT SHOP
local biggame_EF
local venison_EF
local beef_EF
local mutton_EF
local game_EF
local aligatormeat_EF
local bird_EF
local pork_EF
local fishmeat_EF
local herptile_EF
local stringy_EF
local biggame_MULT
local venison_MULT
local beef_MULT
local mutton_MULT
local game_MULT
local aligatormeat_MULT
local bird_MULT
local pork_MULT
local fishmeat_MULT
local herptile_MULT
local stringy_MULT
local biggame_econFactor
local venison_econFactor
local beef_econFactor
local mutton_econFactor
local game_econFactor
local aligatormeat_econFactor
local bird_econFactor
local pork_econFactor
local fishmeat_econFactor
local herptile_econFactor
local stringy_econFactor
local biggame_multi
local venison_multi
local beef_multi
local mutton_multi
local game_multi
local aligatormeat_multi
local bird_multi
local pork_multi
local fishmeat_multi
local herptile_multi
local stringy_multi
local biggame_price = 2
local venison_price
local beef_price
local mutton_price
local game_price
local aligatormeat_price
local bird_price
local pork_price
local fishmeat_price
local herptile_price
local stringy_price


--SUPPLY SHOP
local cloth_EF
local stones_EF
local stick_EF
local emptybottle_EF
local woodenlogs_EF
local rope_EF
local woodenplanks_EF
local hitch_EF
local tent_EF
local cloth_MULT
local stones_MULT
local stick_MULT
local emptybottle_MULT
local woodenlogs_MULT
local rope_MULT
local woodenplanks_MULT
local hitch_MULT
local tent_MULT
local cloth_econFactor
local stones_econFactor
local stick_econFactor
local emptybottle_econFactor
local woodenlogs_econFactor
local rope_econFactor
local woodenplanks_econFactor
local hitch_econFactor
local tent_econFactor
local cloth_multi
local stones_multi
local stick_multi
local emptybottle_multi
local woodenlogs_multi
local rope_multi
local woodenplanks_multi
local hitch_multi
local tent_multi
local cloth_price
local stones_price
local stick_price
local emptybottle_price
local woodenlogs_price
local rope_price
local woodenplanks_price
local hitch_price
local tent_price


--GOLD SHOP
local golden_nugget_EF
local goldbar_EF
local golden_nugget_MULT
local goldbar_MULT
local golden_nugget_econFactor
local goldbar_econFactor
local golden_nugget_multi
local goldbar_multi
local golden_nugget_price
local goldbar_price


--PROVISION SHOP
local blueberry_EF
local wheat_EF
local apple_EF
local bread_EF
local water_EF
local cigar_EF
local blueberry_MULT
local wheat_MULT
local apple_MULT
local bread_MULT
local water_MULT
local cigar_MULT
local blueberry_econFactor
local wheat_econFactor
local apple_econFactor
local bread_econFactor
local water_econFactor
local cigar_econFactor
local blueberry_multi
local wheat_multi
local apple_multi
local bread_multi
local water_multi
local cigar_multi
local blueberry_price
local wheat_price
local apple_price
local bread_price
local water_price
local cigar_price


--OTHERS REQUIRED
local EFAC
local MULTI
local PRICE

Citizen.CreateThread(function() -- START ECONOMY NO PLAYERS ONLINE
    Citizen.Wait(1000)
    print("SERVER MSG1: ksuie_economy script started")
    TriggerEvent('FetchEconomyData', 'biggame')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'venison')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'beef')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'mutton')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'game')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'aligatormeat')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'bird')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'pork')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'fishmeat')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'herptile')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'stringy')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'golden_nugget')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'goldbar')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'cloth')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'stones')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'stick')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'emptybottle')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'woodenlogs')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'rope')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'woodenplanks')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'hitch')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'tent')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'wheat')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'apple')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'blueberry')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'bread')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'water')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'cigar')
    Citizen.Wait(1)
    print("Server MSG2: INITIAL ECONOMY SENT")
end)

AddEventHandler('OnPlayerLoaded', function() --DOWNLOAD VARIABLES TO PLAYER CLIENT WHEN THEY LOGIN TO SERVER
    Citizen.Wait(3000)
    print("SERVER MSG1: ksuie_economy script started")
    TriggerEvent('FetchEconomyData', 'biggame')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'venison')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'beef')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'mutton')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'game')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'aligatormeat')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'bird')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'pork')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'fishmeat')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'herptile')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'stringy')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'golden_nugget')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'goldbar')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'cloth')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'stones')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'stick')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'emptybottle')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'woodenlogs')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'rope')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'woodenplanks')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'hitch')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'tent')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'wheat')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'apple')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'blueberry')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'bread')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'water')
    Citizen.Wait(1)
    TriggerEvent('FetchEconomyData', 'cigar')
    Citizen.Wait(1)
    print("Server MSG2: INITIAL ECONOMY SENT")

end)

--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! MEATSHOP !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--Buy Raw Meat
RegisterServerEvent('meatshop:buy')
AddEventHandler("meatshop:buy", function(price, meat)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
        local ItemInfo = data.getItemData(meat) -- return info from config
        local transaction_buy = 1

        if user.getMoney() >= price then
                user.removeMoney(price)
				local ItemData = data.getItem(source, meat)
				print(ItemData.ItemAmount)
				ItemData.AddItem(1)
                TriggerClientEvent("redemrp_notification:start", source, "Bought "..ItemInfo.label, 3, "success")
                TriggerEvent('UpdateEconomy', transaction_buy, meat, 1, "blank")
                print("S148: RECALC ECON FACTOR"..transaction_buy.." "..meat.." "..1)
        else
            TriggerClientEvent('redemrp_gunshop:alert', source, "You dont have enough money!")
        end
	end)
end)

--Sell Raw Meat
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
            TriggerEvent('UpdateEconomy', transaction_sell, meat, totalitem, "blank")
            print("S179: RECALC ECON FACTOR"..transaction_sell.." "..meat.." "..totalitem)
        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any '..ItemInfo.label..' to sell', 5)
        end
    end)
end)

--Buy Cooked Meat
RegisterServerEvent('cookedmeatshop:buy')
AddEventHandler("cookedmeatshop:buy", function(price, meat)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
        local ItemInfo = data.getItemData(meat) -- return info from redemrp.inventory config
        local transaction_buy = 1
        local EconConvert = nil
        if meat == "cookedbiggame" then
            EconConvert = "biggame"
        elseif meat == "cookedvenison" then
            EconConvert = "venison"
        elseif meat == "cookedbeef" then
            EconConvert = "beef"
        elseif meat == "cookedaligatormeat" then
            EconConvert = "aligatormeat"
        elseif meat == "cookedbird" then
            EconConvert = "bird"
        elseif meat == "cookedgame" then
            EconConvert = "game"
        elseif meat == "cookedpork" then
            EconConvert = "pork"
        elseif meat == "cookedfishmeat" then
            EconConvert = "fishmeat"
        elseif meat == "cookedherptile" then
            EconConvert = "herptile"
        elseif meat == "cookedstringy" then
            EconConvert = "stringy"
        elseif meat == "cookedmutton" then
            EconConvert = "mutton"
        end

        if user.getMoney() >= price then
            user.removeMoney(price)
            local ItemData = data.getItem(source, meat)
            print(ItemData.ItemAmount)
            ItemData.AddItem(1)
            TriggerClientEvent("redemrp_notification:start", source, "Bought "..ItemInfo.label, 3, "success")
            TriggerEvent('UpdateEconomy', 1, EconConvert, 1, "blank")
            print("S226: RECALC ECON FACTOR"..transaction_buy.." "..EconConvert.." "..1)
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
    if meat == "cookedbiggame" then
        EconConvert = "biggame"
    elseif meat == "cookedvenison" then
        EconConvert = "venison"
    elseif meat == "cookedbeef" then
        EconConvert = "beef"
    elseif meat == "cookedaligatormeat" then
        EconConvert = "aligatormeat"
    elseif meat == "cookedbird" then
        EconConvert = "bird"
    elseif meat == "cookedgame" then
        EconConvert = "game"
    elseif meat == "cookedpork" then
        EconConvert = "pork"
    elseif meat == "cookedfishmeat" then
        EconConvert = "fishmeat"
    elseif meat == "cookedherptile" then
        EconConvert = "herptile"
    elseif meat == "cookedstringy" then
        EconConvert = "stringy"
    elseif meat == "cookedmutton" then
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
            TriggerEvent('UpdateEconomy', 0, EconConvert, totalitem, "blank")
            print("S189: RECALC ECON FACTOR"..transaction_sell.." "..EconConvert.." "..totalitem)
        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any '..ItemInfo.label..' to sell', 5)
        end
    end)
end)

--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SUPPLY SHOP!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--Buy Supplies
RegisterServerEvent('supplyshop:buy')
AddEventHandler("supplyshop:buy", function(price, supply)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
        local ItemInfo = data.getItemData(supply) -- return info from config
        local transaction_buy = 1

        if user.getMoney() >= price then
                user.removeMoney(price)
				local ItemData = data.getItem(source, supply)
				print(ItemData.ItemAmount)
				ItemData.AddItem(1)
                TriggerClientEvent("redemrp_notification:start", source, "Bought "..ItemInfo.label, 3, "success")
                TriggerEvent('UpdateEconomy', transaction_buy, supply, 1, "blank")
                print("Supply Shop Buy: RECALC ECON FACTOR"..transaction_buy.." "..supply.." "..1)
        else
            TriggerClientEvent('redemrp_gunshop:alert', source, "You dont have enough money!")
        end
	end)
end)

--Sell Supplies
RegisterServerEvent('supplyshop:sell')
AddEventHandler('supplyshop:sell', function(price, supply)
    print(price.."&"..supply)
    local lookupitem = "'"..supply.."'"
    print(lookupitem)
    local _source = source
    local ItemInfo = data.getItemData(supply) -- return info from config
    local transaction_sell = 0
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
            TriggerEvent('UpdateEconomy', transaction_sell, supply, totalitem, "blank")
            print("Supply Shop Sell: RECALC ECON FACTOR"..transaction_sell.." "..supply.." "..totalitem)
        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any '..ItemInfo.label..' to sell', 5)
        end
    end)
end)

--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!GOLD SHOP!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--Buy GOLD
RegisterServerEvent('goldshop:buy')
AddEventHandler("goldshop:buy", function(price, gold)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
        local ItemInfo = data.getItemData(gold) -- return info from config
        local transaction_buy = 1

        if user.getMoney() >= price then
                user.removeMoney(price)
				local ItemData = data.getItem(source, gold)
				print(ItemData.ItemAmount)
				ItemData.AddItem(1)
                TriggerClientEvent("redemrp_notification:start", source, "Bought "..ItemInfo.label, 3, "success")
                TriggerEvent('UpdateEconomy', transaction_buy, gold, 1, "blank")
                print("Gold Shop Buy: RECALC ECON FACTOR"..transaction_buy.." "..gold.." "..1)
        else
            TriggerClientEvent('redemrp_gunshop:alert', source, "You dont have enough money!")
        end
	end)
end)

--Sell GOLD
RegisterServerEvent('goldshop:sell')
AddEventHandler('goldshop:sell', function(price, gold)
    print(price.."&"..gold)
    local lookupitem = "'"..gold.."'"
    print(lookupitem)
    local _source = source
    local ItemInfo = data.getItemData(gold) -- return info from config
    local transaction_sell = 0
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
            TriggerEvent('UpdateEconomy', transaction_sell, gold, totalitem, "blank")
            print("Gold Shop Sell: RECALC ECON FACTOR"..transaction_sell.." "..gold.." "..totalitem)
        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any '..ItemInfo.label..' to sell', 5)
        end
    end)
end)

--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!PROVISIONS SHOP!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--Buy PROVISIONS
RegisterServerEvent('provisionshop:buy')
AddEventHandler("provisionshop:buy", function(price, provision)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
        local ItemInfo = data.getItemData(provision) -- return info from config
        local transaction_buy = 1

        if user.getMoney() >= price then
                user.removeMoney(price)
				local ItemData = data.getItem(source, provision)
				print(ItemData.ItemAmount)
				ItemData.AddItem(1)
                TriggerClientEvent("redemrp_notification:start", source, "Bought "..ItemInfo.label, 3, "success")
                TriggerEvent('UpdateEconomy', transaction_buy, provision, 1, "blank")
                print("Provision Shop Buy: RECALC ECON FACTOR"..transaction_buy.." "..provision.." "..1)
        else
            TriggerClientEvent('redemrp_gunshop:alert', source, "You dont have enough money!")
        end
	end)
end)

--Sell PROVISIONS
RegisterServerEvent('provisionshop:sell')
AddEventHandler('provisionshop:sell', function(price, provision)
    print(price.."&"..provision)
    local lookupitem = "'"..provision.."'"
    print(lookupitem)
    local _source = source
    local ItemInfo = data.getItemData(provision) -- return info from config
    local transaction_sell = 0
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local ItemData = data.getItem(_source, provision)
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
            TriggerEvent('UpdateEconomy', transaction_sell, provision, totalitem, "blank")
            print("Gold Shop Sell: RECALC ECON FACTOR"..transaction_sell.." "..provision.." "..totalitem)
        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any '..ItemInfo.label..' to sell', 5)
        end
    end)
end)

RegisterServerEvent('UpdateEconomy')
AddEventHandler('UpdateEconomy', function( transaction, product, amount)
    Citizen.Wait(1)
    print("S293:UpdateEconomy: Transaction ="..transaction.." Product = "..product.." Amount = "..amount)
    local buy_sell = transaction
    local productFactored = product
    local added = amount
    print("C249: Updating Economy Factor: VariablesBrought: Transaction = "..buy_sell.." Product = "..productFactored.."Amount = "..added)

    if productFactored == "biggame" then
        if buy_sell == 0 then
            biggame_EF = biggame_EF - added
        elseif buy_sell == 1 then
            biggame_EF = biggame_EF + added
        end
        Citizen.Wait(100)
        if biggame_EF > 5000 then
            biggame_EF = 5000
        elseif biggame_EF <= 0 then
            biggame_EF = 1
        end
        biggame_MULT = math.floor((biggame_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, biggame_MULT, biggame_EF)
        print("C369: VarSent to UpdateMultiplier: product="..product.." EconFactor = "..biggame_EF.." Multiplier = "..biggame_MULT)

    elseif productFactored == "venison" then
        if buy_sell == 0 then
            venison_EF = venison_EF - added
        elseif buy_sell == 1 then
            venison_EF = venison_EF + added
        end
        Citizen.Wait(100)
        if venison_EF > 5000 then
            venison_EF = 5000
        elseif venison_EF <= 0 then
            venison_EF = 1
        end
        venison_MULT  = math.floor((venison_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, venison_MULT , venison_EF)

    elseif productFactored == "beef" then
        if buy_sell == 0 then
            beef_EF = beef_EF - added
        elseif buy_sell == 1 then
            beef_EF = beef_EF + added
        end
        Citizen.Wait(100)
        if beef_EF > 5000 then
            beef_EF = 5000
        elseif beef_EF <= 0 then
            beef_EF = 1
        end
        beef_MULT   = math.floor((beef_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, beef_MULT  , beef_EF)

    elseif productFactored == "aligatormeat" then
        if buy_sell == 0 then
            aligatormeat_EF = aligatormeat_EF - added
        elseif buy_sell == 1 then
            aligatormeat_EF = aligatormeat_EF + added
        end
        Citizen.Wait(100)
        if aligatormeat_EF > 5000 then
            aligatormeat_EF = 5000
        elseif aligatormeat_EF <= 0 then
            aligatormeat_EF = 1
        end
        aligatormeat_MULT    = math.floor((aligatormeat_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, aligatormeat_MULT   , aligatormeat_EF)

    elseif productFactored == "bird" then
        if buy_sell == 0 then
            bird_EF = bird_EF - added
        elseif buy_sell == 1 then
            bird_EF = bird_EF + added
        end
        Citizen.Wait(100)
        if bird_EF > 5000 then
            bird_EF = 5000
        elseif bird_EF <= 0 then
            bird_EF = 1
        end
        bird_MULT = math.floor((bird_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, bird_MULT, bird_EF)

    elseif productFactored == "game" then
        if buy_sell == 0 then
            game_EF = game_EF - added
        elseif buy_sell == 1 then
            game_EF = game_EF + added
        end
        Citizen.Wait(100)
        if game_EF > 5000 then
            game_EF = 5000
        elseif game_EF <= 0 then
            game_EF = 1
        end
        game_MULT  = math.floor((game_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, game_MULT , game_EF)
        
    elseif productFactored == "pork" then
        if buy_sell == 0 then
            pork_EF = pork_EF - added
        elseif buy_sell == 1 then
            pork_EF = pork_EF + added
        end
        Citizen.Wait(100)
        if pork_EF > 5000 then
            pork_EF = 5000
        elseif pork_EF <= 0 then
            pork_EF = 1
        end
        pork_MULT   = math.floor((pork_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, pork_MULT  , pork_EF)

    elseif productFactored == "fishmeat" then
        if buy_sell == 0 then
            fishmeat_EF = fishmeat_EF - added
        elseif buy_sell == 1 then
            fishmeat_EF = fishmeat_EF + added
        end
        Citizen.Wait(100)
        if fishmeat_EF > 5000 then
            fishmeat_EF = 5000
        elseif fishmeat_EF <= 0 then
            fishmeat_EF = 1
        end
        fishmeat_MULT    = math.floor((fishmeat_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, fishmeat_MULT   , fishmeat_EF)

    elseif productFactored == "herptile" then
        if buy_sell == 0 then
            herptile_EF = herptile_EF - added
        elseif buy_sell == 1 then
            herptile_EF = herptile_EF + added
        end
        Citizen.Wait(100)
        if herptile_EF > 5000 then
            herptile_EF = 5000
        elseif herptile_EF <= 0 then
            herptile_EF = 1
        end
        herptile_MULT = math.floor((herptile_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, herptile_MULT, herptile_EF)
        
    elseif productFactored == "stringy" then
        if buy_sell == 0 then
            stringy_EF = stringy_EF - added
        elseif buy_sell == 1 then
            stringy_EF = stringy_EF + added
        end
        Citizen.Wait(100)
        if stringy_EF > 5000 then
            stringy_EF = 5000
        elseif stringy_EF <= 0 then
            stringy_EF = 1
        end
        stringy_MULT = math.floor((stringy_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, stringy_MULT , stringy_EF)

    elseif productFactored == "mutton" then
        if buy_sell == 0 then
            mutton_EF = mutton_EF - added
        elseif buy_sell == 1 then
            mutton_EF = mutton_EF + added
        end
        Citizen.Wait(100)
        if mutton_EF > 5000 then
            mutton_EF = 5000
        elseif mutton_EF <= 0 then
            mutton_EF = 1
        end
        mutton_MULT = math.floor((mutton_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, mutton_MULT , mutton_EF)
      
    elseif productFactored == "blueberry" then
        if buy_sell == 0 then
            blueberry_EF = blueberry_EF - added
        elseif buy_sell == 1 then
            blueberry_EF = blueberry_EF + added
        end
        Citizen.Wait(100)
        if blueberry_EF > 5000 then
            blueberry_EF = 5000
        elseif blueberry_EF <= 0 then
            blueberry_EF = 1
        end
        blueberry_MULT = math.floor((blueberry_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, blueberry_MULT , blueberry_EF)

    elseif productFactored == "cloth" then
        if buy_sell == 0 then
            cloth_EF = cloth_EF - added
        elseif buy_sell == 1 then
            cloth_EF = cloth_EF + added
        end
        Citizen.Wait(100)
        if cloth_EF > 5000 then
            cloth_EF = 5000
        elseif cloth_EF <= 0 then
            cloth_EF = 1
        end
        cloth_MULT = math.floor((cloth_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, cloth_MULT , cloth_EF)

    elseif productFactored == "rope" then
        if buy_sell == 0 then
            rope_EF = rope_EF - added
        elseif buy_sell == 1 then
            rope_EF = rope_EF + added
        end
        Citizen.Wait(100)
        if rope_EF > 5000 then
            rope_EF = 5000
        elseif rope_EF <= 0 then
            rope_EF = 1
        end
        rope_MULT = math.floor((rope_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, rope_MULT , rope_EF)

    elseif productFactored == "woodenplanks" then
        if buy_sell == 0 then
            woodenplanks_EF = woodenplanks_EF - added
        elseif buy_sell == 1 then
            woodenplanks_EF = woodenplanks_EF + added
        end
        Citizen.Wait(100)
        if woodenplanks_EF > 5000 then
            woodenplanks_EF = 5000
        elseif woodenplanks_EF <= 0 then
            woodenplanks_EF = 1
        end
        woodenplanks_MULT = math.floor((woodenplanks_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, woodenplanks_MULT , woodenplanks_EF)

    elseif productFactored == "stones" then
        if buy_sell == 0 then
            stones_EF = stones_EF - added
        elseif buy_sell == 1 then
            stones_EF = stones_EF + added
        end
        Citizen.Wait(100)
        if stones_EF > 5000 then
            stones_EF = 5000
        elseif stones_EF <= 0 then
            stones_EF = 1
        end
        stones_MULT = math.floor((stones_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, stones_MULT , stones_EF)

    elseif productFactored == "hitch" then
        if buy_sell == 0 then
            hitch_EF = hitch_EF - added
        elseif buy_sell == 1 then
            hitch_EF = hitch_EF + added
        end
        Citizen.Wait(100)
        if hitch_EF > 5000 then
            hitch_EF = 5000
        elseif hitch_EF <= 0 then
            hitch_EF = 1
        end
        hitch_MULT = math.floor((hitch_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, hitch_MULT , hitch_EF)

    elseif productFactored == "woodenlogs" then
        if buy_sell == 0 then
            woodenlogs_EF = woodenlogs_EF - added
        elseif buy_sell == 1 then
            woodenlogs_EF = woodenlogs_EF + added
        end
        Citizen.Wait(100)
        if woodenlogs_EF > 5000 then
            woodenlogs_EF = 5000
        elseif woodenlogs_EF <= 0 then
            woodenlogs_EF = 1
        end
        woodenlogs_MULT = math.floor((woodenlogs_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, woodenlogs_MULT , woodenlogs_EF)

    elseif productFactored == "tent" then
        if buy_sell == 0 then
            tent_EF = tent_EF - added
        elseif buy_sell == 1 then
            tent_EF = tent_EF + added
        end
        Citizen.Wait(100)
        if tent_EF > 5000 then
            tent_EF = 5000
        elseif tent_EF <= 0 then
            tent_EF = 1
        end
        tent_MULT = math.floor((tent_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, tent_MULT , tent_EF)

    elseif productFactored == "stick" then
        if buy_sell == 0 then
            stick_EF = stick_EF - added
        elseif buy_sell == 1 then
            stick_EF = stick_EF + added
        end
        Citizen.Wait(100)
        if stick_EF > 5000 then
            stick_EF = 5000
        elseif stick_EF <= 0 then
            stick_EF = 1
        end
        stick_MULT = math.floor((stick_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, stick_MULT , stick_EF)

    elseif productFactored == "emptybottle" then
        if buy_sell == 0 then
            emptybottle_EF = emptybottle_EF - added
        elseif buy_sell == 1 then
            emptybottle_EF = emptybottle_EF + added
        end
        Citizen.Wait(100)
        if emptybottle_EF > 5000 then
            emptybottle_EF = 5000
        elseif emptybottle_EF <= 0 then
            emptybottle_EF = 1
        end
        emptybottle_MULT = math.floor((emptybottle_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, emptybottle_MULT , emptybottle_EF)
    
    elseif productFactored == "golden_nugget" then
        if buy_sell == 0 then
            golden_nugget_EF = golden_nugget_EF - added
        elseif buy_sell == 1 then
            golden_nugget_EF = golden_nugget_EF + added
        end
        Citizen.Wait(100)
        if golden_nugget_EF > 5000 then
            golden_nugget_EF = 5000
        elseif golden_nugget_EF <= 0 then
            golden_nugget_EF = 1
        end
        golden_nugget_MULT = math.floor((golden_nugget_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, golden_nugget_MULT , golden_nugget_EF)

    elseif productFactored == "goldbar" then
        if buy_sell == 0 then
            goldbar_EF = goldbar_EF - added
        elseif buy_sell == 1 then
            goldbar_EF = goldbar_EF + added
        end
        Citizen.Wait(100)
        if goldbar_EF > 5000 then
            goldbar_EF = 5000
        elseif goldbar_EF <= 0 then
            goldbar_EF = 1
        end
        goldbar_MULT = math.floor((goldbar_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, goldbar_MULT , goldbar_EF)

    elseif productFactored == "apple" then
        if buy_sell == 0 then
            apple_EF = apple_EF - added
        elseif buy_sell == 1 then
            apple_EF = apple_EF + added
        end
        Citizen.Wait(100)
        if apple_EF > 5000 then
            apple_EF = 5000
        elseif apple_EF <= 0 then
            apple_EF = 1
        end
        apple_MULT = math.floor((apple_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, apple_MULT , apple_EF)

    elseif productFactored == "bread" then
        if buy_sell == 0 then
            bread_EF = bread_EF - added
        elseif buy_sell == 1 then
            bread_EF = bread_EF + added
        end
        Citizen.Wait(100)
        if bread_EF > 5000 then
            bread_EF = 5000
        elseif bread_EF <= 0 then
            bread_EF = 1
        end
        bread_MULT = math.floor((bread_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, bread_MULT , bread_EF)

    elseif productFactored == "water" then
        if buy_sell == 0 then
            water_EF = water_EF - added
        elseif buy_sell == 1 then
            water_EF = water_EF + added
        end
        Citizen.Wait(100)
        if water_EF > 5000 then
            water_EF = 5000
        elseif water_EF <= 0 then
            water_EF = 1
        end
        water_MULT = math.floor((water_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, water_MULT , water_EF)

    elseif productFactored == "cigar" then
        if buy_sell == 0 then
            cigar_EF = cigar_EF - added
        elseif buy_sell == 1 then
            cigar_EF = cigar_EF + added
        end
        Citizen.Wait(100)
        if cigar_EF > 5000 then
            cigar_EF = 5000
        elseif cigar_EF <= 0 then
            cigar_EF = 1
        end
        cigar_MULT = math.floor((cigar_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, cigar_MULT , cigar_EF)
    
    elseif productFactored == "wheat" then
        if buy_sell == 0 then
            wheat_EF = wheat_EF - added
        elseif buy_sell == 1 then
            wheat_EF = wheat_EF + added
        end
        Citizen.Wait(100)
        if wheat_EF > 5000 then
            wheat_EF = 5000
        elseif wheat_EF <= 0 then
            wheat_EF = 1
        end
        wheat_MULT = math.floor((wheat_EF/1000)*100)/100
        TriggerEvent('UpdateMultiplier', product, wheat_MULT , wheat_EF)
    
    end    
end)

RegisterServerEvent('UpdateMultiplier')
AddEventHandler('UpdateMultiplier', function(product, mult, econfactor)
    print("S# : UPDATING ECON DATABASE WITH NEW VALUES")
    local identifier = product
    local multi = mult
    local fac = econfactor
    MySQL.Async.execute('UPDATE economy SET multiplier = @multiplier WHERE identifier = @identifier', {
        ['@identifier']  = identifier,
        ['@multiplier']  = multi
    }, function (rowschanged)
        print(rowschanged)
    end)
    Citizen.Wait(1)
    MySQL.Async.execute('UPDATE economy SET factor = @factor WHERE identifier = @identifier', {
        ['@identifier']  = identifier,
        ['@factor'] = fac
    }, function (rowschanged)
        print(rowschanged)
    end)
    Citizen.Wait(1)
    print("S# : Identifier="..identifier.." multiplier="..multi.." factor="..fac.." DBUPDATED")

end)

AddEventHandler('Server:ReceiveEconVariables', function(item, EFAC, MULTI, PRICE)
    print("S1058: ServerRecEconVariables.."..item.." "..EFAC.." "..MULTI.." $"..PRICE)
    if item == 'biggame' then
        biggame_EF = EFAC
        biggame_multi = MULTI
        biggame_price = PRICE
    end

    if item == 'venison' then
        venison_EF = EFAC
        venison_multi = MULTI
        venison_price = PRICE
    end

    if item == 'beef' then
        beef_EF = EFAC
        beef_multi = MULTI
        beef_price = PRICE
    end

    if item == 'mutton' then
        mutton_EF = EFAC
        mutton_multi = MULTI
        mutton_price = PRICE
    end

    if item == 'game' then
        game_EF = EFAC
        game_multi = MULTI
        game_price = PRICE
    end

    if item == 'aligatormeat' then
        aligatormeat_EF = EFAC
        aligatormeat_multi = MULTI
        aligatormeat_price = PRICE
    end

    if item == 'bird' then
        bird_EF = EFAC
        bird_multi = MULTI
        bird_price = PRICE
    end

    if item == 'pork' then
        pork_EF = EFAC
        pork_multi = MULTI
        pork_price = PRICE
    end

    if item == 'fishmeat' then
        fishmeat_EF = EFAC
        fishmeat_multi = MULTI
        fishmeat_price = PRICE
    end

    if item == 'herptile' then
        herptile_EF = EFAC
        herptile_multi = MULTI
        herptile_price = PRICE
    end

    if item == 'stringy' then
        stringy_EF = EFAC
        stringy_multi = MULTI
        stringy_price = PRICE
    end

    if item == 'golden_nugget' then
        golden_nugget_EF = EFAC
        golden_nugget_multi = MULTI
        golden_nugget_price = PRICE
    end

    if item == 'goldbar' then
        goldbar_EF = EFAC
        goldbar_multi = MULTI
        goldbar_price = PRICE
    end

    if item == 'cloth' then
        cloth_EF = EFAC
        cloth_multi = MULTI
        cloth_price = PRICE
    end

    if item == 'stones' then
        stones_EF = EFAC
        stones_multi = MULTI
        stones_price = PRICE
    end

    if item == 'stick' then
        stick_EF = EFAC
        stick_multi = MULTI
        stick_price = PRICE
    end

    if item == 'emptybottle' then
        emptybottle_EF = EFAC
        emptybottle_multi = MULTI
        emptybottle_price = PRICE
    end

    if item == 'woodenlogs' then
        woodenlogs_EF = EFAC
        woodenlogs_multi = MULTI
        woodenlogs_price = PRICE
    end

    if item == 'rope' then
        rope_EF = EFAC
        rope_multi = MULTI
        rope_price = PRICE
    end

    if item == 'woodenplanks' then
        woodenplanks_EF = EFAC
        woodenplanks_multi = MULTI
        woodenplanks_price = PRICE
    end

    if item == 'hitch' then
        hitch_EF = EFAC
        hitch_multi = MULTI
        hitch_price = PRICE
    end

    if item == 'tent' then
        tent_EF = EFAC
        tent_multi = MULTI
        tent_price = PRICE
    end

    if item == 'apple' then
        apple_EF = EFAC
        apple_multi = MULTI
        apple_price = PRICE
    end

    if item == 'blueberry' then
        blueberry_EF = EFAC
        blueberry_multi = MULTI
        blueberry_price = PRICE
    end

    if item == 'wheat' then
        wheat_EF = EFAC
        wheat_multi = MULTI
        wheat_price = PRICE
    end

    if item == 'bread' then
        bread_EF = EFAC
        bread_multi = MULTI
        bread_price = PRICE
    end

    if item == 'water' then
        water_EF = EFAC
        water_multi = MULTI
        water_price = PRICE
    end

    if item == 'cigar' then
        cigar_EF = EFAC
        cigar_multi = MULTI
        cigar_price = PRICE

    end
    print("S1227: ServerRecEconVariables - COMPLETE")

end)

RegisterServerEvent('FetchEconomyData')
AddEventHandler('FetchEconomyData', function(item)
    local _source = source
    Citizen.Wait(1)
    local skip = 1
    print("Server 1155: FETCH CALL RECEIVED START FETCH")
    MySQL.Async.fetchAll("SELECT * FROM economy WHERE identifier = @identifier ", {['identifier'] = item}, function(result)
        if result[1] ~= nil then
            EFAC = result[1].factor
            MULTI = math.floor((EFAC*100)/100)/1000
            PRICE = result[1].price
            print("DB RETURNS "..item.." EFAC = "..EFAC)
            print("DB RETURNS "..item.." MULTI = "..MULTI)
            print("DB RETURNS "..item.." PRICE ="..PRICE)
            TriggerClientEvent('Client:meatshop:ReceiveEconVariables', _source, item, EFAC, MULTI, PRICE)
            TriggerClientEvent('Client:supplyshop:ReceiveEconVariables', _source, item, EFAC, MULTI, PRICE)
            TriggerClientEvent('Client:goldshop:ReceiveEconVariables', _source, item, EFAC, MULTI, PRICE)
            TriggerClientEvent('Client:provisionshop:ReceiveEconVariables', _source, item, EFAC, MULTI, PRICE)
            TriggerEvent('Server:ReceiveEconVariables', item, EFAC, MULTI, PRICE)
            print("Econ MSG1: Economy Received and Sent"..item)
        else
            print("no result")
            skip = 0
        end
    end)
--[[    if skip == 1 then
        TriggerClientEvent('Client:meatshop:ReceiveEconVariables', _source, item, EFAC, MULTI, PRICE)
        TriggerClientEvent('Client:supplyshop:ReceiveEconVariables', _source, item, EFAC, MULTI, PRICE)
        TriggerClientEvent('Client:goldshop:ReceiveEconVariables', _source, item, EFAC, MULTI, PRICE)
        TriggerClientEvent('Client:provisionshop:ReceiveEconVariables', _source, item, EFAC, MULTI, PRICE)
        TriggerEvent('Server:ReceiveEconVariables', item, EFAC, MULTI, PRICE)
        print("Econ MSG1: Economy Received and Sent"..item)
    else
        skip=1
    end]]
end)

--============================================================Economy Timer=======================================================================
local time_tick = (1000*60) --1 minute tick
local timer = time_tick*20 --20 minutes
local timer_active = timer --20 minutes
local timeron = true
local consume = 5
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local _source = source
        print("Timeron: timer="..timer_active.." tick="..time_tick)
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
        local p22 = 'golden_nugget'
        local p23 = 'goldbar'
        local p24 = 'apple'
        local p25 = 'wheat'
        local p26 = 'bread'
        local p27 = 'water'
        local p28 = 'cigar'

        if timeron then
            if timer_active <= 0 then
                --meat
                TriggerEvent('UpdateEconomy', 1, p1, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p2, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p3, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p4, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p5, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p6, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p7, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p8, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p9, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p10, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p11, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p12, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p13, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p14, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p15, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p16, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p17, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p18, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p19, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p20, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p21, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p22, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p23, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p24, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p25, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p26, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p27, consume)
                Citizen.Wait(1)
                TriggerEvent('UpdateEconomy', 1, p28, consume)
                    Citizen.Wait(time_tick)
                    timer_active = timer
                    print("Economy Updated")
            else
            Citizen.Wait(time_tick)
            timer_active = (timer_active-time_tick)
            end
        else
            Citizen.Wait(time_tick)
            timer_active = (timer-time_tick)
            timeron = true
        end
    end
end)
