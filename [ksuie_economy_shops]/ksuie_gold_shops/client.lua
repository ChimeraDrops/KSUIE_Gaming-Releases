MenuData = {}
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
end)

--add gold locations
local goldshop = {
    {x = 558.75, y = 1696.42, z = 185.87},
     {x = 2578.17, y = 783.28, z = 83.79},
     {x = -2193.67, y = 717.01, z = 122.3},
     {x = -1978.49, y = -1667.97, z = 118.18},
     {x = -5221.2, y = -3460.13, z = -21.26},
    {x = -5212.28, y = -2113.8, z = 12.68},
     {x = -3954.65, y = -2127.17, z = -4.15},
 }
local golden_nugget_price = 0
local goldbar_price =0
local golden_nugget_econFactor = 1000
local goldbar_econFactor = 1000

RegisterNetEvent('ReceiveGoldFactors')
AddEventHandler('ReceiveGoldFactors', function ( golden_nugget_econFactor, goldbar_econFactor, blank)
    golden_nugget_econFactor = golden_nugget_econFactor
    goldbar_econFactor = goldbar_econFactor
end)

local golden_nugget_mult = golden_nugget_econFactor/1000
local goldbar_mult = golden_nugget_econFactor/1000

 RegisterNetEvent('GoldPriceFetched')
 AddEventHandler('GoldPriceFetched', function( goldnug, gbar, blank)
    golden_nugget_price = goldnug
    print("C34: price"..goldnug)
    goldbar_price = gbar
    print("C36: price"..gbar)

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

        for k,v in ipairs(goldshop) do
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
            if WarMenu.Button('Buy Golden Nugget for ~pa~$'..(math.floor(golden_nugget_price*golden_nugget_mult*100)/100)) then
               TriggerServerEvent("goldshop:buy", (math.floor(golden_nugget_price*golden_nugget_mult*100)/100), "golden_nugget", 0)  
            elseif WarMenu.Button('Buy Gold Bar for ~pa~$'..(math.floor(goldbar_price*goldbar_mult*100)/100)) then
               TriggerServerEvent("goldshop:buy", (math.floor(goldbar_price*goldbar_mult*100)/100), "goldbar", 0)
            end
            WarMenu.Display()
			
        elseif WarMenu.IsMenuOpened('sellg') then
            if WarMenu.Button('Sell your Golden Nuggets for ~pa~$'..(math.floor(golden_nugget_price*golden_nugget_mult*100)/100)..' each') then
               TriggerServerEvent("goldshop:sell", (math.floor(golden_nugget_price*golden_nugget_mult*100)/100), "golden_nugget")  
            elseif WarMenu.Button('Sell your Gold Bars for ~pa~$'..(math.floor(goldbar_price*goldbar_mult*100)/100)..' each') then
               TriggerServerEvent("goldshop:sell", (math.floor(goldbar_price*goldbar_mult*100)/100), "goldbar")
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
                TriggerServerEvent('GoldPrice')
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

