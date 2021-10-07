-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie

MenuData = {}
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
end)

local wheat_econFactor
local apple_econFactor
local blueberry_econFactor
local bread_econFactor
local water_econFactor
local cigar_econFactor
local wheat_multi
local apple_multi
local blueberry_multi
local bread_multi
local water_multi
local cigar_multi
local wheat_price
local apple_price
local blueberry_price
local bread_price
local water_price
local cigar_price
local populated = false


RegisterNetEvent("Client:provisionshop:ReceiveEconVariables")
AddEventHandler("Client:provisionshop:ReceiveEconVariables", function(item, efac, mult, price)
    if item == 'wheat' then
        wheat_econFactor = efac 
        wheat_multi = mult
        wheat_price = (math.floor(price*wheat_multi*100)/100)
    end
    if item == 'apple' then
        apple_econFactor = efac 
        apple_multi = mult
        apple_price = (math.floor(price*apple_multi*100)/100)
    end
    if item == 'blueberry' then
        blueberry_econFactor = efac 
        blueberry_multi = mult
        blueberry_price = (math.floor(price*blueberry_multi*100)/100)
    end
    if item == 'bread' then
        bread_econFactor = efac 
        bread_multi = mult
        bread_price = (math.floor(price*bread_multi*100)/100)
    end
    if item == 'water' then
        water_econFactor = efac 
        water_multi = mult
        water_price = (math.floor(price*water_multi*100)/100)
    end
    if item == 'cigar' then
        cigar_econFactor = efac 
        cigar_multi = mult
        cigar_price = (math.floor(price*cigar_multi*100)/100)
    end
    print("Provisionshop MSG1: Provision Economy Updated: "..item)

end)

--===========================================================Provision SHOP START====================================================================
local active = false
local ProvisionShopPrompt
local hasAlreadyEnteredMarker, lastZone
local currentZone = nil

function SetupProvisionShopPrompt()
    Citizen.CreateThread(function()
        local str = 'Open Provision Shop'
        ProvisionShopPrompt = PromptRegisterBegin()
        PromptSetControlAction(ProvisionShopPrompt, 0xE8342FF2)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(ProvisionShopPrompt, str)
        PromptSetEnabled(ProvisionShopPrompt, false)
        PromptSetVisible(ProvisionShopPrompt, false)
        PromptSetHoldMode(ProvisionShopPrompt, true)
        PromptRegisterEnd(ProvisionShopPrompt)

    end)
end

AddEventHandler('ksuie_trader_shops:provision:hasEnteredMarker', function(zone)
    currentZone     = zone
end)

AddEventHandler('ksuie_trader_shops:provision:hasExitedMarker', function(zone)
    if active == true then
        PromptSetEnabled(ProvisionShopPrompt, false)
        PromptSetVisible(ProvisionShopPrompt, false)
        active = false
    end
    WarMenu.CloseMenu()
	currentZone = nil
end)

Citizen.CreateThread(function()
    SetupProvisionShopPrompt()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local isInMarker, currentZone = false

        for k,v in ipairs(Config.ProvisionShop.coords) do
            if populated == false then
                if (Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z) < 100) then
                    local h = v.h
                    TriggerEvent('Populate:ProvisionShop', v.x, v.y, v.z, h)
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
                currentZone = 'Provisionshop'
                lastZone    = 'Provisionshop'

            end
        end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('ksuie_trader_shops:provision:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('ksuie_trader_shops:provision:hasExitedMarker', lastZone)
		end

    end
end)

-- menu start
Citizen.CreateThread(function()
    WarMenu.CreateMenu('Provisionshop', "Provision Shop")
    WarMenu.SetSubTitle('Provisionshop', 'Buy and Sell Provisions')
    WarMenu.CreateSubMenu('buyharvestprov', 'Provisionshop', 'Buy Harvested Provisions')
    WarMenu.CreateSubMenu('sellharvestprov', 'Provisionshop', 'Sell Harvested Provisions')
    WarMenu.CreateSubMenu('buypreparedprov', 'Provisionshop', 'Buy Prepared Provisions')
    WarMenu.CreateSubMenu('sellpreparedprov', 'Provisionshop', 'Sell Prepared Provisions')
    WarMenu.CreateSubMenu('buymiscprov', 'Provisionshop', 'Buy Misc Provisions')
    WarMenu.CreateSubMenu('sellmiscprov', 'Provisionshop', 'Sell Misc Provisions')


    while true do

        if WarMenu.IsMenuOpened('Provisionshop') then
            if WarMenu.MenuButton('Buy Harvested Provisions', 'buyharvestprov') then
            end
            if WarMenu.MenuButton('Sell Harvested Provisions', 'sellharvestprov') then
            end
            if WarMenu.MenuButton('Buy Prepared Provisions', 'buypreparedprov') then
            end
            if WarMenu.MenuButton('Sell Prepared Provisions', 'sellpreparedprov') then
            end
            if WarMenu.MenuButton('Buy Misc Provisions', 'buymiscprov') then
            end
            if WarMenu.MenuButton('Sell Misc Provisions', 'sellmiscprov') then
            end

            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('buyharvestprov') then
            if WarMenu.Button('Buy Apple for ~pa~$'..apple_price) then
                TriggerServerEvent("provisionshop:buy", apple_price, "apple")  
            elseif WarMenu.Button('Buy Blueberry for ~pa~$'..blueberry_price) then
                TriggerServerEvent("provisionshop:buy", blueberry_price, "blueberry")
            elseif WarMenu.Button('Buy Wheat for ~pa~$'..wheat_price) then
                TriggerServerEvent("provisionshop:buy", wheat_price, "wheat")
            end
            WarMenu.Display()
 
        elseif WarMenu.IsMenuOpened('sellharvestprov') then
            if WarMenu.Button('Sell your Apples for ~pa~$'..(math.floor(apple_price*0.75*100)/100)..' each') then
                TriggerServerEvent("provisionshop:sell", (math.floor(apple_price*0.75*100)/100), "apple")  
             elseif WarMenu.Button('Sell your Blueberries for ~pa~$'..(math.floor(blueberry_price*0.75*100)/100)..' each') then
                TriggerServerEvent("provisionshop:sell", (math.floor(blueberry_price*0.75*100)/100), "blueberry")
             elseif WarMenu.Button('Sell your Wheat for ~pa~$'..(math.floor(wheat_price*0.75*100)/100)..' each') then
                TriggerServerEvent("provisionshop:sell", (math.floor(wheat_price*0.75*100)/100), "wheat")
             end
             WarMenu.Display()

        elseif WarMenu.IsMenuOpened('buypreparedprov') then
            if WarMenu.Button('Buy Bread for ~pa~$'..bread_price) then
                TriggerServerEvent("provisionshop:buy", bread_price, "bread")  
            elseif WarMenu.Button('Buy Water for ~pa~$'..water_price) then
                TriggerServerEvent("provisionshop:buy", water_price, "water")
            end
            WarMenu.Display()
    
        elseif WarMenu.IsMenuOpened('sellpreparedprov') then
            if WarMenu.Button('Sell your Bread for ~pa~$'..(math.floor(bread_price*0.75*100)/100)..' each') then
                TriggerServerEvent("provisionshop:sell", (math.floor(bread_price*0.75*100)/100), "bread")  
            elseif WarMenu.Button('Sell your Water for ~pa~$'..(math.floor(water_price*0.75*100)/100)..' each') then
                TriggerServerEvent("provisionshop:sell", (math.floor(water_price*0.75*100)/100), "water")
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('buymiscprov') then
            if WarMenu.Button('Buy Cigar for ~pa~$'..cigar_price) then
                TriggerServerEvent("provisionshop:buy", cigar_price, "cigar")  
            end
            WarMenu.Display()
    
        elseif WarMenu.IsMenuOpened('sellmiscprov') then
            if WarMenu.Button('Sell your Cigars for ~pa~$'..(math.floor(cigar_price*0.75*100)/100)..' each') then
                TriggerServerEvent("provisionshop:sell", (math.floor(cigar_price*0.75*100)/100), "cigar")  
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
                PromptSetEnabled(ProvisionShopPrompt, true)
                PromptSetVisible(ProvisionShopPrompt, true)
                active = true
            end
            if PromptHasHoldModeCompleted(ProvisionShopPrompt) then
                TriggerServerEvent('FetchEconomyData', 'blueberry')
                Citizen.Wait(3)
                TriggerServerEvent('FetchEconomyData', 'apple')
                Citizen.Wait(3)
                TriggerServerEvent('FetchEconomyData', 'wheat')
                Citizen.Wait(3)
                TriggerServerEvent('FetchEconomyData', 'bread')
                Citizen.Wait(3)
                TriggerServerEvent('FetchEconomyData', 'water')
                Citizen.Wait(3)
                TriggerServerEvent('FetchEconomyData', 'cigar')
                Citizen.Wait(1000)
                WarMenu.OpenMenu('Provisionshop')
                WarMenu.Display()
                PromptSetEnabled(ProvisionShopPrompt, false)
                PromptSetVisible(ProvisionShopPrompt, false)
                active = false

				currentZone = nil
			end
        else
			Citizen.Wait(500)
		end
	end
end)

--===========================================================Provision SHOP END====================================================================





RegisterNetEvent('ksuie_provision_shops:alert')	
AddEventHandler('ksuie_provision_shops:alert', function(txt)
    SetTextScale(0.5, 0.5)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", txt, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)
