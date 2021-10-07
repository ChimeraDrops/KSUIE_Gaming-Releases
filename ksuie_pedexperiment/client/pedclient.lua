-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie


local x2 = 0
local y2 = 0
local yoffset = 1
local xoffset = 1

--local spawncoords = {-3630.47,-3042.7,8.02}
local tick = 1000
local newPed

RegisterNetEvent('LoadPeds')
AddEventHandler('LoadPeds', function(args)
--!!!Make newPed Hate Player
    AddRelationshipGroup("PedsLoaded")
    AddRelationshipGroup("Players")
    SetRelationshipBetweenGroups(0,`PedsLoaded`,`Players`)
    local player = GetPlayerPed(-1)
    SetPedRelationshipGroupHash(player, `Players`)

    --end Hate
--[[    
    Citizen.Wait(300)

    local ExperimentPeds = ExperimentPeds[math.random(#ExperimentPeds)]
    local model = GetHashKey(ExperimentPeds.model)

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end

    local ped = CreatePed_2(model, spawncoords, 0, true, false, false, false)
    SetModelAsNoLongerNeeded(model)

    SetPedOutfitPreset(ped, 0)
]]


    print("LOADING PEDS")
    local PedsToCreate = 1125
    for i = 1, PedsToCreate do
        print("i = ", i)
        local pedmodel = ExperimentPeds[i]
        local model = GetHashKey(pedmodel.model)
        print(model)
        local player = GetPlayerPed()
        local x = -3618.92
        local y = -2502.09
        local z = -14.12
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(100)
            print("ped scuffed ="..i)
        end
        Citizen.Wait(800)
        if HasModelLoaded(model) then
            print("model has loaded")
            x2 = x-xoffset
            y2 = y+yoffset
            newPed = CreatePed_2(model, x2, y2, z, 0.0, true, false, false, false)
            Citizen.InvokeNative(0x9587913B9E772D29, newPed, true)
            print("x="..x2.." y="..y2.." z="..z)
            Citizen.InvokeNative(0x4AD96EF928BD4F9A, model) --model no longer neaded
            Citizen.InvokeNative(0x77FF8D35EEC6BBC4, newPed, 0, true) --SetPedOutfitPreset
            Citizen.InvokeNative(0x283978A15512B2FE, newPed, false) --SetRandomOutfitVariation Native
            SetEntityAsMissionEntity(newPed, true, false) --Makes Entitity Part of Environment I Think, last boolean determines if they are permanent or not
            RequestCollisionAtCoord(x2,y2,z)
--            TaskCombatPed(newPed, player, 0, 16)--From FiveM (0,16) are correct values
            TaskStandStill(newPed,tick*240)
            SetPedRelationshipGroupHash(newPed, `PedsLoaded`)
        end
        xoffset = xoffset + 1
        if (xoffset) > 20 then
            xoffset = 0
            yoffset = yoffset-1
        end
    end
end)

