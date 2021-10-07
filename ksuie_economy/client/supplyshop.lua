-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie


MenuData = {}
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
end)

--ADD LOCAL SUPPLY SHOP VARIABLES
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
local populated = false


RegisterNetEvent("Client:supplyshop:ReceiveEconVariables")
AddEventHandler("Client:supplyshop:ReceiveEconVariables", function(item, efac, mult, price)
    if item == 'cloth' then
        cloth_econFactor = efac 
        cloth_multi = mult
        cloth_price = (math.floor(price*cloth_multi*100)/100)
    end
    if item == 'stones' then
        stones_econFactor = efac 
        stones_multi = mult
        stones_price = (math.floor(price*cloth_multi*100)/100)
    end
    if item == 'stick' then
        stick_econFactor = efac 
        stick_multi = mult
        stick_price = (math.floor(price*cloth_multi*100)/100)
    end
    if item == 'emptybottle' then
        emptybottle_econFactor = efac 
        emptybottle_multi = mult
        emptybottle_price = (math.floor(price*cloth_multi*100)/100)
    end
    if item == 'woodenlogs' then
        woodenlogs_econFactor = efac 
        woodenlogs_multi = mult
        woodenlogs_price = (math.floor(price*woodenlogs_multi*100)/100)
    end
    if item == 'rope' then
        rope_econFactor = efac 
        rope_multi = mult
        rope_price = (math.floor(price*cloth_multi*100)/100)
    end
    if item == 'woodenplanks' then
        woodenplanks_econFactor = efac 
        woodenplanks_multi = mult
        woodenplanks_price = (math.floor(price*cloth_multi*100)/100)
    end
    if item == 'hitch' then
        hitch_econFactor = efac 
        hitch_multi = mult
        hitch_price = (math.floor(price*cloth_multi*100)/100)
    end
    if item == 'tent' then
        tent_econFactor = efac 
        tent_multi = mult
        tent_price = (math.floor(price*cloth_multi*100)/100)
    end
    print("Supplyshop MSG1: Supply Economy Updated: "..item)
end)    
           
--===========================================================Supply SHOP START====================================================================
local active = false
local SupplyShopPrompt
local hasAlreadyEnteredMarker, lastZone
local currentZone = nil

function SetupSupplyShopPrompt()
    Citizen.CreateThread(function()
        local str = 'Open Supply Shop'
        SupplyShopPrompt = PromptRegisterBegin()
        PromptSetControlAction(SupplyShopPrompt, 0xE8342FF2)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(SupplyShopPrompt, str)
        PromptSetEnabled(SupplyShopPrompt, false)
        PromptSetVisible(SupplyShopPrompt, false)
        PromptSetHoldMode(SupplyShopPrompt, true)
        PromptRegisterEnd(SupplyShopPrompt)

    end)
end

AddEventHandler('ksuie_trader_shops:supply:hasEnteredMarker', function(zone)
    currentZone     = zone
end)

AddEventHandler('ksuie_trader_shops:supply:hasExitedMarker', function(zone)
    if active == true then
        PromptSetEnabled(SupplyShopPrompt, false)
        PromptSetVisible(SupplyShopPrompt, false)
        active = false
    end
    WarMenu.CloseMenu()
	currentZone = nil
end)

Citizen.CreateThread(function()
    SetupSupplyShopPrompt()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local isInMarker, currentZone = false

        for k,v in ipairs(Config.SupplyShop.coords) do
            if populated == false then
                if (Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z) < 100) then
                    local h = v.h
                    TriggerEvent('Populate:SupplyShop', v.x, v.y, v.z, h)
                    populated = true
                end
            end
            if populated == true then
                if (Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z) > 150) then
                    populated = false
                end
            end

            if (Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z) < 1.5) then
                isInMarker  = true
                currentZone = 'supplyshop'
                lastZone    = 'supplyshop'
            end
        end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('ksuie_trader_shops:supply:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('ksuie_trader_shops:supply:hasExitedMarker', lastZone)
		end

    end
end)

-- menu start
Citizen.CreateThread(function()
    WarMenu.CreateMenu('supplyshop', "Supply Shop")
    WarMenu.SetSubTitle('supplyshop', 'Buy and Sell Supplies')
    WarMenu.CreateSubMenu('buyharvestsup', 'supplyshop', 'Buy Harvested Supplies')
    WarMenu.CreateSubMenu('sellharvestsup', 'supplyshop', 'Sell Harvested Supplies')
    WarMenu.CreateSubMenu('buypreparedsup', 'supplyshop', 'Buy Prepared Supplies')
    WarMenu.CreateSubMenu('sellpreparedsup', 'supplyshop', 'Sell Prepared Supplies')


    while true do

        if WarMenu.IsMenuOpened('supplyshop') then
            if WarMenu.MenuButton('Buy Harvested Supplies', 'buyharvestsup') then
            end
            if WarMenu.MenuButton('Sell Harvested Supplies', 'sellharvestsup') then
            end
            if WarMenu.MenuButton('Buy Prepared Supplies', 'buypreparedsup') then
            end
            if WarMenu.MenuButton('Sell Prepared Supplies', 'sellpreparedsup') then
            end

            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('buyharvestsup') then
            if WarMenu.Button('Buy Cloth for ~pa~$'..cloth_price) then
                TriggerServerEvent("supplyshop:buy", cloth_price, "cloth")
             elseif WarMenu.Button('Buy Rope for ~pa~$'..rope_price) then
                TriggerServerEvent("supplyshop:buy", rope_price, "rope")
             elseif WarMenu.Button('Buy Stones for ~pa~$'..stones_price) then
                TriggerServerEvent("supplyshop:buy", stones_price, "stones")
             elseif WarMenu.Button('Buy Logs for ~pa~$'..woodenlogs_price) then
                TriggerServerEvent("supplyshop:buy", woodenlogs_price, "woodenlogs")
             elseif WarMenu.Button('Buy Stick for ~pa~$'..stick_price) then
                TriggerServerEvent("supplyshop:buy", stick_price, "stick")
             elseif WarMenu.Button('Buy Empty Bottle for ~pa~$'..emptybottle_price) then
                TriggerServerEvent("supplyshop:buy", emptybottle_price, "emptybottle", 0)
             end
             WarMenu.Display()
  
        elseif WarMenu.IsMenuOpened('sellharvestsup') then
            if WarMenu.Button('Sell your Cloth for ~pa~$'..(math.floor(cloth_price*.75*100)/100)..' each') then
                TriggerServerEvent("supplyshop:sell",(math.floor(cloth_price*.75*100)/100), "cloth")
             elseif WarMenu.Button('Sell your Rope for ~pa~$'..(math.floor(rope_price*.75*100)/100)..' each') then
                TriggerServerEvent("supplyshop:sell", (math.floor(rope_price*.75*100)/100), "rope")
             elseif WarMenu.Button('Sell your Stones for ~pa~$'..(math.floor(stones_price*.75*100)/100)..' each') then
                TriggerServerEvent("supplyshop:sell", (math.floor(stones_price*.75*100)/100), "stones")
             elseif WarMenu.Button('Sell your Logs for ~pa~$'..(math.floor(woodenlogs_price*.75*100)/100)..' each') then
                TriggerServerEvent("supplyshop:sell", (math.floor(woodenlogs_price*.75*100)/100), "woodenlogs")
             elseif WarMenu.Button('Sell your Stick for ~pa~$'..(math.floor(stick_price*.75*100)/100)..' each') then
                TriggerServerEvent("supplyshop:sell", (math.floor(stick_price*.75*100)/100), "stick")
             elseif WarMenu.Button('Sell your Empty Bottle for ~pa~$'..(math.floor(emptybottle_price*.75*100)/100)..' each') then
                TriggerServerEvent("supplyshop:sell", (math.floor(emptybottle_price*.75*100)/100), "emptybottle")
             end
              WarMenu.Display()

        elseif WarMenu.IsMenuOpened('buypreparedsup') then
            if WarMenu.Button('Buy Wood Planks for ~pa~$'..woodenplanks_price) then
                TriggerServerEvent("supplyshop:buy", woodenplanks_price, "woodenplanks")
            elseif WarMenu.Button('Buy Hitch for ~pa~$'..hitch_price) then
                TriggerServerEvent("supplyshop:buy", hitch_price, "hitch")
            elseif WarMenu.Button('Buy Tent for ~pa~$'..tent_price) then
                TriggerServerEvent("supplyshop:buy", tent_price, "tent")
            end
            WarMenu.Display()
    
        elseif WarMenu.IsMenuOpened('sellpreparedsup') then
            if WarMenu.Button('Sell your Wood Planks for ~pa~$'..(math.floor(woodenplanks_price*.75*100)/100)..' each') then
                TriggerServerEvent("supplyshop:sell", (math.floor(woodenplanks_price*.75*100)/100), "woodenplanks")
            elseif WarMenu.Button('Sell your Hitch for ~pa~$'..(math.floor(hitch_price*.75*100)/100)..' each') then
                TriggerServerEvent("supplyshop:sell", (math.floor(hitch_price*.75*100)/100), "hitch")
            elseif WarMenu.Button('Sell your Tent for ~pa~$'..(math.floor(tent_price*.75*100)/100)..' each') then
                TriggerServerEvent("supplyshop:sell", (math.floor(tent_price*.75*100)/100), "tent")
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
                PromptSetEnabled(SupplyShopPrompt, true)
                PromptSetVisible(SupplyShopPrompt, true)
                active = true
            end
            if PromptHasHoldModeCompleted(SupplyShopPrompt) then
               TriggerServerEvent('FetchEconomyData', 'cloth')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'stones')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'stick')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'emptybottle')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'woodenlogs')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'rope')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'woodenplanks')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'hitch')
               Citizen.Wait(3)
               TriggerServerEvent('FetchEconomyData', 'tent')
               
               Citizen.Wait(1000)
				WarMenu.OpenMenu('supplyshop')
                WarMenu.Display()
                PromptSetEnabled(SupplyShopPrompt, false)
                PromptSetVisible(SupplyShopPrompt, false)
                active = false

				currentZone = nil
			end
        else
			Citizen.Wait(500)
		end
	end
end)

--===========================================================Supply SHOP END====================================================================





RegisterNetEvent('ksuie_supply_shops:alert')	
AddEventHandler('ksuie_supply_shops:alert', function(txt)
    SetTextScale(0.5, 0.5)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", txt, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)
