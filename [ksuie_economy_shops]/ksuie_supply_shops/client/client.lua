MenuData = {}
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
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
local blueberry_econFactor = 1000
local cloth_econFactor = 1000
local rope_econFactor = 1000
local woodenplanks_econFactor = 1000
local stones_econFactor = 1000
local hitch_econFactor = 1000
local woodenlogs_econFactor = 1000
local tent_econFactor = 1000
local stick_econFactor = 1000
local emptybottle_econFactor = 1000

RegisterNetEvent('ReceiveSupplyFactors')
AddEventHandler('ReceiveSupplyFactors', function ( blueberry_econFactor, cloth_econFactor, blueberry_econFactor, cloth_econFactor, rope_econFactor, woodenplanks_econFactor, stones_econFactor, hitch_econFactor, woodenlogs_econFactor, tent_econFactor, stick_econFactor, blank)
    blueberry_econFactor = blueberry_econFactor
    cloth_econFactor = cloth_econFactor
    rope_econFactor = rope_econFactor
    woodenplanks_econFactor = woodenplanks_econFactor
    stones_econFactor = stones_econFactor
    hitch_econFactor = hitch_econFactor
    woodenlogs_econFactor = woodenlogs_econFactor
    tent_econFactor = tent_econFactor
    stick_econFactor = stick_econFactor
    emptybottle_econFactor = emptybottle_econFactor
end)

local blueberry_mult = blueberry_econFactor/1000
local cloth_mult = cloth_econFactor/1000
local rope_mult = rope_econFactor/1000
local woodenplanks_mult = woodenplanks_econFactor/1000
local stones_mult = stones_econFactor/1000
local hitch_mult = hitch_econFactor/1000
local woodenlogs_mult = woodenplanks_econFactor/1000
local tent_mult = tent_econFactor/1000
local stick_mult = stick_econFactor/1000
local emptybottle_mult = emptybottle_econFactor/1000

--add supply locations
local supplyshop = {

    {x = -1348.8, y = 2438.4, z = 308.42},
     {x = 584.83, y = 1694.74, z = 187.4},
     {x = 2555.96, y = 765.82, z = 78.31},
     {x = 1878.22, y = -770.93, z = 42.46},
     {x = -2200.42, y = 727.80, z = 122.75},
    {x = -1981.84, y = -1619.87, z = 118.09},
     {x = -3549.31, y = -3043.77, z = 11.94},
     {x = -5225.43, y = -3489.99, z = -20.54},
     {x = -5192.97, y = -2099.01, z = 12.39},
     {x = -3967.68, y = -2143.79, z = -5.59},
 
 }

RegisterNetEvent('PricesSet')
AddEventHandler('PricesSet', function ( rawbiggame,rawvension,rawbeef,rawaligator,rawbird,rawgame,rawpork,rawfish,rawherp,rawstringy,blank)
    blueberry_price = rawbiggame
    print(rawbiggame)
    cloth_price = rawvension
    print(rawvension)
    rope_price = rawbeef
    print(rawbeef)
    woodenplanks_price = rawaligator
    print(rawaligator)
    stones_price = rawbird
    print(rawbird)
    hitch_price = rawgame
    print(rawgame)
    woodenlogs_price = rawpork
    print(rawpork)
    tent_price = rawfish
    print(rawfish)
    stick_price = rawherp
    print(rawherp)
    emptybottle_price = rawstringy
    print(rawstringy)

 end)


--===========================================================SUPPLY SHOP START====================================================================
local supactive = false
local supShopPrompt
local suphasAlreadyEnteredMarker, suplastZone
local supcurrentZone = nil

function SetupsupShopPrompt()
    Citizen.CreateThread(function()
        local str = 'Open Supply Shop'
        supShopPrompt = PromptRegisterBegin()
        PromptSetControlAction(supShopPrompt, 0xE8342FF2)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(supShopPrompt, str)
        PromptSetEnabled(supShopPrompt, false)
        PromptSetVisible(supShopPrompt, false)
        PromptSetHoldMode(supShopPrompt, true)
        PromptRegisterEnd(supShopPrompt)

    end)
end

AddEventHandler('ksuie_trader_shops:hasEnteredsupMarker', function(zone2)
   supcurrentZone     = zone2
end)

AddEventHandler('ksuie_trader_shops:hasExitedsupMarker', function(zone2)
    if supactive == true then
        PromptSetEnabled(supShopPrompt, false)
        PromptSetVisible(supShopPrompt, false)
        supactive = false
    end
    WarMenu.CloseMenu()
    supcurrentZone = nil
end)

Citizen.CreateThread(function()
   SetupsupShopPrompt()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local isInMarker, supcurrentZone = false

        for k,v in ipairs(supplyshop) do
            if (Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z) < 1.5) then
                isInMarker  = true
                supcurrentZone = 'supplyshop'
                suplastZone    = 'supplyshop'
            end
        end

		if isInMarker and not suphasAlreadyEnteredMarker then
			suphasAlreadyEnteredMarker = true
			TriggerEvent('ksuie_trader_shops:hasEnteredsupMarker', supcurrentZone)
		end

		if not isInMarker and suphasAlreadyEnteredMarker then
			suphasAlreadyEnteredMarker = false
			TriggerEvent('ksuie_trader_shops:hasExitedsupMarker', suplastZone)
		end

    end
end)

-- menu start
Citizen.CreateThread(function()
    WarMenu.CreateMenu('supplyshop', "Supply Shop")
    WarMenu.SetSubTitle('supplyshop', 'Buy and Sell Supplies')
    WarMenu.CreateSubMenu('buysup', 'supplyshop', 'Buy Supplies')
    WarMenu.CreateSubMenu('sellsup', 'supplyshop', 'Sell Supplies')

    while true do

        if WarMenu.IsMenuOpened('supplyshop') then
            if WarMenu.MenuButton('Buy Supplies', 'buysup') then
            end
            if WarMenu.MenuButton('Sell Supplies', 'sellsup') then
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('buysup') then
            if WarMenu.Button('Buy Blueberries for ~pa~$'..(math.floor(blueberry_price*blueberry_mult*100)/100)) then
               TriggerServerEvent("supplyshop:buy", (math.floor(blueberry_price*blueberry_mult*100)/100), "blueberry", 0)  
            elseif WarMenu.Button('Buy Cloth for ~pa~$'..(math.floor(cloth_price*cloth_mult*100)/100)) then
               TriggerServerEvent("supplyshop:buy", (math.floor(cloth_price*cloth_mult*100)/100), "cloth", 0)
            elseif WarMenu.Button('Buy Rope for ~pa~$'..(math.floor(rope_price*rope_mult*100)/100)) then
               TriggerServerEvent("supplyshop:buy", (math.floor(rope_price*rope_mult*100)/100), "rope", 0)
            elseif WarMenu.Button('Buy Wood Planks for ~pa~$'..(math.floor(woodenplanks_price*woodenplanks_mult*100)/100)) then
               TriggerServerEvent("supplyshop:buy", (math.floor(woodenplanks_price*woodenplanks_mult*100)/100), "woodenplanks", 0)
            elseif WarMenu.Button('Buy Stones for ~pa~$'..(math.floor(stones_price*stones_mult*100)/100)) then
               TriggerServerEvent("supplyshop:buy", (math.floor(stones_price*stones_mult*100)/100), "stones", 0)
            elseif WarMenu.Button('Buy Hitch for ~pa~$'..(math.floor(hitch_price*hitch_mult*100)/100)) then
               TriggerServerEvent("supplyshop:buy", (math.floor(hitch_price*hitch_mult*100)/100), "hitch", 0)
            elseif WarMenu.Button('Buy Logs for ~pa~$'..(math.floor(woodenlogs_price*woodenlogs_mult*100)/100)) then
               TriggerServerEvent("supplyshop:buy", (math.floor(woodenlogs_price*woodenlogs_mult*100)/100), "woodenlogs", 0)
            elseif WarMenu.Button('Buy Tent for ~pa~$'..(math.floor(tent_price*tent_mult*100)/100)) then
               TriggerServerEvent("supplyshop:buy", (math.floor(tent_price*tent_mult*100)/100), "tent", 0)
            elseif WarMenu.Button('Buy Stick for ~pa~$'..(math.floor(stick_price*stick_mult*100)/100)) then
               TriggerServerEvent("supplyshop:buy", (math.floor(stick_price*stick_mult*100)/100), "stick", 0)
            elseif WarMenu.Button('Buy Empty Bottle for ~pa~$'..(math.floor(emptybottle_price*emptybottle_mult*100)/100)) then
               TriggerServerEvent("supplyshop:buy", (math.floor(emptybottle_price*emptybottle_mult*100)/100), "emptybottle", 0)
            end
            WarMenu.Display()
			
        elseif WarMenu.IsMenuOpened('sellsup') then
            if WarMenu.Button('Sell your Blueberries for ~pa~$'..(math.floor(blueberry_price*blueberry_mult*100)/100)..' each') then
               TriggerServerEvent("supplyshop:sell", (math.floor(blueberry_price*blueberry_mult*100)/100), "blueberry")  
            elseif WarMenu.Button('Sell your Cloth for ~pa~$'..(math.floor(cloth_price*cloth_mult*100)/100)..' each') then
               TriggerServerEvent("supplyshop:sell",(math.floor(cloth_price*cloth_mult*100)/100), "cloth")
            elseif WarMenu.Button('Sell your Rope for ~pa~$'..(math.floor(rope_price*rope_mult*100)/100)..' each') then
               TriggerServerEvent("supplyshop:sell", (math.floor(rope_price*rope_mult*100)/100), "rope")
            elseif WarMenu.Button('Sell your Wood Planks for ~pa~$'..(math.floor(woodenplanks_price*woodenplanks_mult*100)/100)..' each') then
               TriggerServerEvent("supplyshop:sell", (math.floor(woodenplanks_price*woodenplanks_mult*100)/100), "woodenplanks")
            elseif WarMenu.Button('Sell your Stones for ~pa~$'..(math.floor(stones_price*stones_mult*100)/100)..' each') then
               TriggerServerEvent("supplyshop:sell", (math.floor(stones_price*stones_mult*100)/100), "stones")
            elseif WarMenu.Button('Sell your Hitch for ~pa~$'..(math.floor(hitch_price*hitch_mult*100)/100)..' each') then
               TriggerServerEvent("supplyshop:sell", (math.floor(hitch_price*hitch_mult*100)/100), "hitch")
            elseif WarMenu.Button('Sell your Logs for ~pa~$'..(math.floor(woodenlogs_price*woodenlogs_mult*100)/100)..' each') then
               TriggerServerEvent("supplyshop:sell", (math.floor(woodenlogs_price*woodenlogs_mult*100)/100), "woodenlogs")
            elseif WarMenu.Button('Sell your Tent for ~pa~$'..(math.floor(tent_price*tent_mult*100)/100)..' each') then
               TriggerServerEvent("supplyshop:sell", (math.floor(tent_price*tent_mult*100)/100), "tent")
            elseif WarMenu.Button('Sell your Stick for ~pa~$'..(math.floor(stick_price*stick_mult*100)/100)..' each') then
               TriggerServerEvent("supplyshop:sell", (math.floor(stick_price*stick_mult*100)/100), "stick")
            elseif WarMenu.Button('Sell your Empty Bottle for ~pa~$'..(math.floor(emptybottle_price*emptybottle_mult*100)/100)..' each') then
               TriggerServerEvent("supplyshop:sell", (math.floor(emptybottle_price*emptybottle_mult*100)/100), "emptybottle")
            end
            WarMenu.Display()
        
        end
        Citizen.Wait(0)
    end
end)
-- menu stop

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        if supcurrentZone then
            if supactive == false then
                PromptSetEnabled(supShopPrompt, true)
                PromptSetVisible(supShopPrompt, true)
                supactive = true
            end
            if PromptHasHoldModeCompleted(supShopPrompt) then
               TriggerServerEvent('FetchPrices')
               Citizen.Wait(1000)
				WarMenu.OpenMenu('supplyshop')
                WarMenu.Display()
                PromptSetEnabled(supShopPrompt, false)
                PromptSetVisible(supShopPrompt, false)
                supactive = false

                supcurrentZone = nil
			end
        else
			Citizen.Wait(3)
		end
	end
end)

--===========================================================SUPPLY SHOP END====================================================================
--===========================================================GOLD SHOP END====================================================================
RegisterNetEvent('ksuie_supply_shops:alert')	
AddEventHandler('ksuie_supply_shops:alert', function(txt)
    SetTextScale(0.5, 0.5)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", txt, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)

--=============================================================Economy========================================================
RegisterNetEvent('EconomyFactorCalc')
AddEventHandler('EconomyFactorCalc', function( transaction, product, amount, blank)
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
