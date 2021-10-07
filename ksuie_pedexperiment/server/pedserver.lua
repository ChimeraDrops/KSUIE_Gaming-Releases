-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterCommand("loadpeds", function(source, args)
    local _source = source
    print("start")
        TriggerClientEvent('LoadPeds', _source, args)
 end, false)

 
--[[
Citizen.CreateThread(function()
    local tick = 20000
    while tick do
        if tick > 0 then
            print("Ped Experiment Started")
            Citizen.Wait(tick)
        end
    end
end)
]]