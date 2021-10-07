-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie

MenuData = {}
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
end)

--Gold Shop Locations
--Gold Shop Variables
local golden_nugget_econFactor
local goldbar_econFactor
local golden_nugget_multi
local goldbar_multi
local golden_nugget_price
local goldbar_price
local populated = false

RegisterNetEvent("Client:goldshop:ReceiveEconVariables")
AddEventHandler("Client:goldshop:ReceiveEconVariables", function(item, efac, mult, price)
    if item == 'golden_nugget' then
        golden_nugget_econFactor = efac 
        golden_nugget_multi = mult
        golden_nugget_price = (math.floor(price*golden_nugget_multi*100)/100)
    end
    if item == 'goldbar' then
        goldbar_econFactor = efac 
        goldbar_multi = mult
        goldbar_price = (math.floor(price*goldbar_multi*100)/100)
    end
    print("Goldshop MSG1: Gold Economy Updated: "..item)
end)

--===========================================================GOLD SHOP START====================================================================
local gactive = false
local gShopPrompt
local ghasAlreadyEnteredMarker, glastZone
local gcurrentZone = nil

function SetupgShopPrompt()
    Citizen.CreateThread(function()
        local str = 'Open Gold Shop'
        gShopPrompt = PromptRegisterBegin()
        PromptSetControlAction(gShopPrompt, 0xE8342FF2)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(gShopPrompt, str)
        PromptSetEnabled(gShopPrompt, false)
        PromptSetVisible(gShopPrompt, false)
        PromptSetHoldMode(gShopPrompt, true)
        PromptRegisterEnd(gShopPrompt)

    end)
end

AddEventHandler('ksuie_trader_shops:hasEnteredgoldMarker', function(zone3)
   gcurrentZone     = zone3
end)

AddEventHandler('ksuie_trader_shops:hasExitedgoldMarker', function(zone3)
    if gactive == true then
        PromptSetEnabled(gShopPrompt, false)
        PromptSetVisible(gShopPrompt, false)
        gactive = false
    end
    WarMenu.CloseMenu()
    gcurrentZone = nil
end)

Citizen.CreateThread(function()
    SetupgShopPrompt()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local isInMarker, gcurrentZone = false

        for k,v in ipairs(Config.GoldShop.coords) do
            if populated == false then
                if (Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z) < 100) then
                    local h = v.h
                    TriggerEvent('Populate:GoldShop', v.x, v.y, v.z, h)
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
                gcurrentZone = 'goldshop'
                glastZone    = 'goldshop'
            end
        end

		if isInMarker and not ghasAlreadyEnteredMarker then
			ghasAlreadyEnteredMarker = true
			TriggerEvent('ksuie_trader_shops:hasEnteredgoldMarker', gcurrentZone)
		end

		if not isInMarker and ghasAlreadyEnteredMarker then
			ghasAlreadyEnteredMarker = false
			TriggerEvent('ksuie_trader_shops:hasExitedgoldMarker', glastZone)
		end

    end
end)

-- menu start
Citizen.CreateThread(function()
    WarMenu.CreateMenu('goldshop', "Gold Shop")
    WarMenu.SetSubTitle('goldshop', 'Buy and Sell Gold')
    WarMenu.CreateSubMenu('buyg', 'goldshop', 'Buy Gold')
    WarMenu.CreateSubMenu('sellg', 'goldshop', 'Sell Gold')

    while true do

        if WarMenu.IsMenuOpened('goldshop') then
            if WarMenu.MenuButton('Buy Gold', 'buyg') then
            end
            if WarMenu.MenuButton('Sell Gold', 'sellg') then
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('buyg') then
            if WarMenu.Button('Buy Golden Nugget for ~pa~$'..golden_nugget_price) then
               TriggerServerEvent("goldshop:buy", golden_nugget_price, 'golden_nugget', 0)  
            elseif WarMenu.Button('Buy Gold Bar for ~pa~$'..goldbar_price) then
               TriggerServerEvent("goldshop:buy", goldbar_price, 'goldbar', 0)
            end
            WarMenu.Display()
			
        elseif WarMenu.IsMenuOpened('sellg') then
            if WarMenu.Button('Sell your Golden Nuggets for ~pa~$'..(math.floor(golden_nugget_price*.75*100)/100)..' each') then
               TriggerServerEvent("goldshop:sell", (math.floor(golden_nugget_price*.75*100)/100), 'golden_nugget')  
            elseif WarMenu.Button('Sell your Gold Bars for ~pa~$'..(math.floor(goldbar_price*.75*100)/100)..' each') then
               TriggerServerEvent("goldshop:sell", (math.floor(goldbar_price*.75*100)/100), 'goldbar')
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
        if gcurrentZone then
            if gactive == false then
                PromptSetEnabled(gShopPrompt, true)
                PromptSetVisible(gShopPrompt, true)
                gactive = true
            end
            if PromptHasHoldModeCompleted(gShopPrompt) then
                TriggerServerEvent('FetchEconomyData', 'golden_nugget')
                Citizen.Wait(3)
                TriggerServerEvent('FetchEconomyData', 'goldbar')                
                Citizen.Wait(1000)
 
			WarMenu.OpenMenu('goldshop')
                WarMenu.Display()
                PromptSetEnabled(gShopPrompt, false)
                PromptSetVisible(gShopPrompt, false)
                gactive = false

                gcurrentZone = nil
			end
        else
			Citizen.Wait(500)
		end
	end
end)

--===========================================================GOLD SHOP END====================================================================
RegisterNetEvent('ksuie_gold_shops:alert')	
AddEventHandler('ksuie_gold_shops:alert', function(txt)
    SetTextScale(0.5, 0.5)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", txt, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)


