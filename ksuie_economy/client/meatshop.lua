-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie

MenuData = {}
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
end)

local butchershop = {

    {x = 591.77, y = 1689.97, z = 187.45},
--    {x = 00, y = 00, z = 00},
 
 }
 
--Variables for Economy Calculations
--MEATSHOP:
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
local biggame_price
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


RegisterNetEvent("Client:meatshop:ReceiveEconVariables")
AddEventHandler("Client:meatshop:ReceiveEconVariables", function(item, efac, mult, price)
    if item == 'biggame' then
        biggame_econFactor = efac 
        biggame_multi = mult
        biggame_price = (math.floor(price*biggame_multi*100)/100)
    end

    if item == 'venison' then
        venison_econFactor = efac 
        venison_multi = mult
        venison_price = (math.floor(price*venison_multi*100)/100)
    end

    if item == 'beef' then
        beef_econFactor = efac 
        beef_multi = mult
        beef_price = (math.floor(price*beef_multi*100)/100)
    end

    if item == 'mutton' then
        mutton_econFactor = efac 
        mutton_multi = mult
        mutton_price = (math.floor(price*mutton_multi*100)/100)
    end

    if item == 'game' then
        game_econFactor = efac 
        game_multi = mult
        game_price = (math.floor(price*game_multi*100)/100)
    end

    if item == 'aligatormeat' then
        aligatormeat_econFactor = efac 
        aligatormeat_multi = mult
        aligatormeat_price = (math.floor(price*aligatormeat_multi*100)/100)
    end

    if item == 'bird' then
        bird_econFactor = efac 
        bird_multi = mult
        bird_price = (math.floor(price*bird_multi*100)/100)
    end

    if item == 'pork' then
        pork_econFactor = efac 
        pork_multi = mult
        pork_price = (math.floor(price*pork_multi*100)/100)
    end

    if item == 'fishmeat' then
        fishmeat_econFactor = efac 
        fishmeat_multi = mult
        fishmeat_price = (math.floor(price*fishmeat_multi*100)/100)
    end

    if item == 'herptile' then
        herptile_econFactor = efac 
        herptile_multi = mult
        herptile_price = (math.floor(price*herptile_multi*100)/100)
    end

    if item == 'stringy' then
        stringy_econFactor = efac 
        stringy_multi = mult
        stringy_price = (math.floor(price*stringy_multi*100)/100)
        
    end
    print("Meatshop MSG1: Meat Economy Updated: "..item)

end)

--===========================================================MEAT SHOP START====================================================================
local active = false
local ShopPrompt
local hasAlreadyEnteredMarker, lastZone
local currentZone = nil

function SetupShopPrompt()
    Citizen.CreateThread(function()
        local str = 'Open Butcher Shop'
        ShopPrompt = PromptRegisterBegin()
        PromptSetControlAction(ShopPrompt, 0xE8342FF2)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(ShopPrompt, str)
        PromptSetEnabled(ShopPrompt, false)
        PromptSetVisible(ShopPrompt, false)
        PromptSetHoldMode(ShopPrompt, true)
        PromptRegisterEnd(ShopPrompt)

    end)
end

AddEventHandler('ksuie_trader_shops:hasEnteredMarker', function(zone)
    currentZone     = zone
end)

AddEventHandler('ksuie_trader_shops:hasExitedMarker', function(zone)
    if active == true then
        PromptSetEnabled(ShopPrompt, false)
        PromptSetVisible(ShopPrompt, false)
        active = false
    end
    WarMenu.CloseMenu()
	currentZone = nil
end)

Citizen.CreateThread(function()
    SetupShopPrompt()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local isInMarker, currentZone = false

        for k,v in ipairs(butchershop) do
            if (Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z) < 1.5) then
                isInMarker  = true
                currentZone = 'butchershop'
                lastZone    = 'butchershop'
            end
        end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('ksuie_trader_shops:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('ksuie_trader_shops:hasExitedMarker', lastZone)
		end

    end
end)

-- menu start
Citizen.CreateThread(function()
    WarMenu.CreateMenu('butchershop', "Butcher Shop")
    WarMenu.SetSubTitle('butchershop', 'Buy and Sell Meat')
    WarMenu.CreateSubMenu('buy', 'butchershop', 'Buy Meat')
    WarMenu.CreateSubMenu('buylargemeat', 'buy', 'Buy Large Meat')
    WarMenu.CreateSubMenu('buysmallmeat', 'buy', 'Buy Small Meat')
    WarMenu.CreateSubMenu('sell', 'butchershop', 'Sell Meat')
    WarMenu.CreateSubMenu('selllargemeat', 'sell', 'Sell Large Meat')
    WarMenu.CreateSubMenu('sellsmallmeat', 'sell', 'Sell Small Meat')
    WarMenu.CreateSubMenu('buycooked', 'butchershop', 'Buy Cooked Meat')
    WarMenu.CreateSubMenu('buylargeCookedmeat', 'buycooked', 'Buy Large Cooked Meat')
    WarMenu.CreateSubMenu('buysmallCookedmeat', 'buycooked', 'Buy Small Cooked Meat')
    WarMenu.CreateSubMenu('sellcooked', 'butchershop', 'Sell Cooked Meat')
    WarMenu.CreateSubMenu('selllargeCookedmeat', 'sellcooked', 'Sell Large Coooked Meat')
    WarMenu.CreateSubMenu('sellsmallCookedmeat', 'sellcooked', 'Sell Small Cooked Meat')

    while true do

        if WarMenu.IsMenuOpened('butchershop') then
            if WarMenu.MenuButton('Buy Raw Meat', 'buy') then
            end
            if WarMenu.MenuButton('Sell Raw Meat', 'sell') then
            end
            if WarMenu.MenuButton('Buy Cooked Meat', 'buycooked') then
            end
            if WarMenu.MenuButton('Sell Cooked Meat', 'sellcooked') then
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('buy') then
            if WarMenu.MenuButton('Buy Large Raw Meat', 'buylargemeat') then
            end
            if WarMenu.MenuButton('Buy Small Raw Meat', 'buysmallmeat') then
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('sell') then
            if WarMenu.MenuButton('Sell Large Raw Meat', 'selllargemeat') then
            end
            if WarMenu.MenuButton('Sell Small Raw Meat', 'sellsmallmeat') then
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('buycooked') then
            if WarMenu.MenuButton('Buy Large Cooked Meat', 'buylargeCookedmeat') then
            end
            if WarMenu.MenuButton('Buy Small Cooked Meat', 'buysmallCookedmeat') then
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('sellcooked') then
            if WarMenu.MenuButton('Sell Large Cooked Meat', 'selllargeCookedmeat') then
            end
            if WarMenu.MenuButton('Sell Small Cooked Meat', 'sellsmallCookedmeat') then
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('buylargemeat') then
            if WarMenu.Button('Buy Big Game Meat for ~pa~$'..biggame_price) then
                TriggerServerEvent("meatshop:buy", biggame_price, 'biggame')
            elseif WarMenu.Button('Buy Venison for ~pa~$'..venison_price) then
                TriggerServerEvent("meatshop:buy", venison_price, 'venison')
            elseif WarMenu.Button('Buy Beef for ~pa~$'..beef_price) then
                TriggerServerEvent("meatshop:buy", beef_price, 'beef')
            elseif WarMenu.Button('Buy Alligator Meat for ~pa~$'..aligatormeat_price) then
                TriggerServerEvent("meatshop:buy", aligatormeat_price, 'aligatormeat')
            elseif WarMenu.Button('Buy Game Meat for ~pa~$'..game_price) then
                TriggerServerEvent("meatshop:buy", game_price, 'game')
            elseif WarMenu.Button('Buy Pork for ~pa~$'..pork_price) then
                TriggerServerEvent("meatshop:buy", pork_price, 'pork')
            elseif WarMenu.Button('Buy Mutton for ~pa~$'..mutton_price) then
                TriggerServerEvent("meatshop:buy", mutton_price, 'mutton')
            end
            WarMenu.Display()
 
        elseif WarMenu.IsMenuOpened('selllargemeat') then
            if WarMenu.Button('Sell your Big Game Meat for ~pa~$'..(math.floor(biggame_price*0.75*100)/100)..' each') then
                TriggerServerEvent("meatshop:sell", (math.floor(biggame_price*0.75*100)/100), 'biggame')  
             elseif WarMenu.Button('Sell your Venison for ~pa~$'..(math.floor(venison_price*0.75*100)/100)..' each') then
                TriggerServerEvent("meatshop:sell", (math.floor(venison_price*0.75*100)/100), 'venison')
             elseif WarMenu.Button('Sell your Beef for ~pa~$'..(math.floor(beef_price*0.75*100)/100)..' each') then
                TriggerServerEvent("meatshop:sell", (math.floor(beef_price*0.75*100)/100), 'beef')
             elseif WarMenu.Button('Sell your Alligator Meat for ~pa~$'..(math.floor(aligatormeat_price*0.75*100)/100)..' each') then
                TriggerServerEvent("meatshop:sell", (math.floor(aligatormeat_price*0.75*100)/100), 'aligatormeat')
             elseif WarMenu.Button('Sell your Game Meat for ~pa~$'..(math.floor(game_price*0.75*100)/100)..' each') then
                TriggerServerEvent("meatshop:sell", (math.floor(game_price*0.75*100)/100), 'game')
             elseif WarMenu.Button('Sell your Pork for ~pa~$'..(math.floor(pork_price*0.75*100)/100)..' each') then
                TriggerServerEvent("meatshop:sell", (math.floor(pork_price*0.75*100)/100), 'pork')
             elseif WarMenu.Button('Sell your Mutton for ~pa~$'..(math.floor(mutton_price*0.75*100)/100)..' each') then
                TriggerServerEvent("meatshop:sell", (math.floor(mutton_price*0.75*100)/100), 'mutton')
             end
             WarMenu.Display()
 
        elseif WarMenu.IsMenuOpened('buysmallmeat') then
            if WarMenu.Button('Buy Bird Meat for ~pa~$'..bird_price) then
                TriggerServerEvent("meatshop:buy", bird_price, 'bird')
            elseif WarMenu.Button('Buy Fish Meat for ~pa~$'..fishmeat_price) then
                TriggerServerEvent("meatshop:buy", fishmeat_price, 'fishmeat')
            elseif WarMenu.Button('Buy Herptile Meat for ~pa~$'..herptile_price) then
                TriggerServerEvent("meatshop:buy", herptile_price, 'herptile')
            elseif WarMenu.Button('Buy Stringy Meat for ~pa~$'..stringy_price) then
                TriggerServerEvent("meatshop:buy", stringy_price, 'stringy')
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('sellsmallmeat') then
            if WarMenu.Button('Sell your Bird Meat for ~pa~$'..(math.floor(bird_price*0.75*100)/100)..' each') then
                TriggerServerEvent("meatshop:sell", (math.floor(bird_price*0.75*100)/100), 'bird')
            elseif WarMenu.Button('Sell your Fish Meat for ~pa~$'..(math.floor(fishmeat_price*0.75*100)/100)..' each') then
                TriggerServerEvent("meatshop:sell", (math.floor(fishmeat_price*0.75*100)/100), 'fishmeat')
            elseif WarMenu.Button('Sell your Herptile Meat for ~pa~$'..(math.floor(herptile_price*0.75*100)/100)..' each') then
                TriggerServerEvent("meatshop:sell", (math.floor(herptile_price*0.75*100)/100), 'herptile')
            elseif WarMenu.Button('Sell your Stringy Meat for ~pa~$'..(math.floor(stringy_price*0.75*100)/100)..' each') then
                TriggerServerEvent("meatshop:sell", (math.floor(stringy_price*0.75*100)/100), 'stringy')
            end
            WarMenu.Display()
 
        elseif WarMenu.IsMenuOpened('buylargeCookedmeat') then
            if WarMenu.Button('Buy Big Game Meat for ~pa~$'..(math.floor(biggame_price*1.65*100)/100)) then
                TriggerServerEvent("cookedmeatshop:buy", (math.floor(biggame_price*1.65*100)/100), 'cookedbiggame')
            elseif WarMenu.Button('Buy Venison for ~pa~$'..(math.floor(venison_price*1.65*100)/100)) then
                TriggerServerEvent("cookedmeatshop:buy", (math.floor(venison_price*1.65*100)/100), 'cookedvenison')
            elseif WarMenu.Button('Buy Beef for ~pa~$'..(math.floor(beef_price*1.65*100)/100)) then
                TriggerServerEvent("cookedmeatshop:buy", (math.floor(beef_price*1.65*100)/100), 'cookedbeef')
            elseif WarMenu.Button('Buy Alligator Meat for ~pa~$'..(math.floor(aligatormeat_price*1.65*100)/100)) then
                TriggerServerEvent("cookedmeatshop:buy", (math.floor(aligatormeat_price*1.65*100)/100), 'cookedaligatormeat')
            elseif WarMenu.Button('Buy Game Meat for ~pa~$'..(math.floor(game_price*1.65*100)/100)) then
                TriggerServerEvent("cookedmeatshop:buy", (math.floor(game_price*1.65*100)/100), 'cookedgame')
            elseif WarMenu.Button('Buy Pork for ~pa~$'..(math.floor(pork_price*1.65*100)/100)) then
                TriggerServerEvent("cookedmeatshop:buy", (math.floor(pork_price*1.65*100)/100), 'cookedpork')
            elseif WarMenu.Button('Buy Mutton for ~pa~$'..(math.floor(mutton_price*1.65*100)/100)) then
                TriggerServerEvent("cookedmeatshop:buy", (math.floor(mutton_price*1.65*100)/100), 'cookedmutton')
            end
            WarMenu.Display()
 
        elseif WarMenu.IsMenuOpened('buysmallCookedmeat') then
            if WarMenu.Button('Buy Bird Meat for ~pa~$'..(math.floor(bird_price*1.65*100)/100)) then
                TriggerServerEvent("cookedmeatshop:buy", (math.floor(bird_price*1.65*100)/100), 'cookedbird')
            elseif WarMenu.Button('Buy Fish Meat for ~pa~$'..(math.floor(fishmeat_price*1.65*100)/100)) then
                TriggerServerEvent("cookedmeatshop:buy", (math.floor(fishmeat_price*1.65*100)/100), 'cookedfishmeat')
            elseif WarMenu.Button('Buy Herptile Meat for ~pa~$'..(math.floor(herptile_price*1.65*100)/100)) then
                TriggerServerEvent("cookedmeatshop:buy", (math.floor(herptile_price*1.65*100)/100), 'cookedherptile')
            elseif WarMenu.Button('Buy Stringy Meat for ~pa~$'..(math.floor(stringy_price*1.65*100)/100)) then
                TriggerServerEvent("cookedmeatshop:buy", (math.floor(stringy_price*1.65*100)/100), 'cookedstringy')
            end
             WarMenu.Display()
 
        elseif WarMenu.IsMenuOpened('selllargeCookedmeat') then
            if WarMenu.Button('Sell your Big Game Meat for ~pa~$'..(math.floor(biggame_price*100)/100)..' each') then
                TriggerServerEvent("cookedmeatshop:sell", (math.floor(biggame_price*100)/100), 'cookedbiggame')  
            elseif WarMenu.Button('Sell your Venison for ~pa~$'..(math.floor(venison_price*100)/100)..' each') then
                TriggerServerEvent("cookedmeatshop:sell", (math.floor(venison_price*100)/100), 'cookedvenison')
            elseif WarMenu.Button('Sell your Beef for ~pa~$'..(math.floor(beef_price*100)/100)..' each') then
                TriggerServerEvent("cookedmeatshop:sell", (math.floor(beef_price*100)/100), 'cookedbeef')
            elseif WarMenu.Button('Sell your Alligator Meat for ~pa~$'..(math.floor(aligatormeat_price*100)/100)..' each') then
                TriggerServerEvent("cookedmeatshop:sell", (math.floor(aligatormeat_price*100)/100), 'cookedaligatormeat')
            elseif WarMenu.Button('Sell your Game Meat for ~pa~$'..(math.floor(game_price*100)/100)..' each') then
                TriggerServerEvent("cookedmeatshop:sell", (math.floor(game_price*100)/100), 'cookedgame')
            elseif WarMenu.Button('Sell your Pork for ~pa~$'..(math.floor(pork_price*100)/100)..' each') then
                TriggerServerEvent("cookedmeatshop:sell", (math.floor(pork_price*100)/100), 'cookedpork')
            elseif WarMenu.Button('Sell your Mutton for ~pa~$'..(math.floor(mutton_price*100)/100)..' each') then
                TriggerServerEvent("cookedmeatshop:sell", (math.floor(mutton_price*100)/100), 'cookedmutton')
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('sellsmallCookedmeat') then
            if WarMenu.Button('Sell your Bird Meat for ~pa~$'..(math.floor(bird_price*100)/100)..' each') then
                TriggerServerEvent("cookedmeatshop:sell", (math.floor(bird_price*100)/100), 'cookedbird')
             elseif WarMenu.Button('Sell your Fish Meat for ~pa~$'..(math.floor(fishmeat_price*100)/100)..' each') then
                TriggerServerEvent("cookedmeatshop:sell", (math.floor(fishmeat_price*100)/100), 'cookedfishmeat')
             elseif WarMenu.Button('Sell your Herptile Meat for ~pa~$'..(math.floor(herptile_price*100)/100)..' each') then
                TriggerServerEvent("cookedmeatshop:sell", (math.floor(herptile_price*100)/100), 'cookedherptile')
             elseif WarMenu.Button('Sell your Stringy Meat for ~pa~$'..(math.floor(stringy_price*100)/100)..' each') then
                TriggerServerEvent("cookedmeatshop:sell", (math.floor(stringy_price*100)/100), 'cookedstringy')
             end
             WarMenu.Display()
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        if currentZone then
            if active == false then
                PromptSetEnabled(ShopPrompt, true)
                PromptSetVisible(ShopPrompt, true)
                active = true
            end
            if PromptHasHoldModeCompleted(ShopPrompt) then
               TriggerServerEvent('FetchEconomyData', 'biggame')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'venison')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'beef')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'aligatormeat')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'bird')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'game')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'pork')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'fishmeat')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'herptile')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'stringy')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'mutton')
               Citizen.Wait(1000)
				WarMenu.OpenMenu('butchershop')
                WarMenu.Display()
                PromptSetEnabled(ShopPrompt, false)
                PromptSetVisible(ShopPrompt, false)
                active = false

				currentZone = nil
			end
        else
			Citizen.Wait(500)
		end
	end
end)

--===========================================================BUTCHER SHOP END====================================================================





RegisterNetEvent('ksuie_butcher_shops:alert')	
AddEventHandler('ksuie_butcher_shops:alert', function(txt)
    SetTextScale(0.5, 0.5)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", txt, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)

    

            
     





