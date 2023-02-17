local QBCore = exports['qb-core']:GetCoreObject()

local RentalPed = {}
local RentalsOut = {}

CreateThread(function()
    for k, v in pairs(Config.RentalLocations) do
        local current = v.ped

        RequestModel(current)
        while not HasModelLoaded(current) do
            Wait(0)
        end

        RentalPed[k] = CreatePed(0, current, v["pedcoords"].x, v["pedcoords"].y, v["pedcoords"].z, v["pedcoords"].w, false, false)
        TaskStartScenarioInPlace(RentalPed[k], v["scenario"], 0, true)
        FreezeEntityPosition(RentalPed[k], true)
        SetEntityInvincible(RentalPed[k], true)
        SetBlockingOfNonTemporaryEvents(RentalPed[k], true)

        exports['qb-target']:AddTargetEntity(RentalPed[k], {
            options = v.target.options,
            distance = v.target.distance
        })

        local RentalBlip = AddBlipForCoord(v.pedcoords.x, v.pedcoords.y, v.pedcoords.z)
        SetBlipSprite(RentalBlip, v.blip)
        SetBlipScale(RentalBlip, 0.6)
        SetBlipDisplay(RentalBlip, 6)
        SetBlipColour(RentalBlip, v.blipcolor)
        SetBlipAsShortRange(RentalBlip, false)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(v.label)
        EndTextCommandSetBlipName(RentalBlip)
    end
end)

RegisterNetEvent('ksuie-vehrental:Client:OpenCarMenu', function(data)
    local menuOptions = {}
    for i,j in pairs(Config.RentalCars) do
        menuOptions[#menuOptions+1] = {value = i, text = j.name.." : $"..j.price, data = j.price}
    end
    local dialog = exports['qb-input']:ShowInput({
        header = "Available Cars",
        submitText = "Choose Car to Rent",
        inputs = {
            {
                text = "Car Name : Rental Price", -- text you want to be displayed as a input header
                name = "car_rent_selected", -- name of the input should be unique otherwise it might override
                type = "select", -- type of the input - Select is useful for 3+ amount of "or" options e.g; someselect = none OR other OR other2 OR other3...etc
                options = menuOptions
            }
        }
    })
    if dialog ~= nil then
        local pickedcar = dialog.car_rent_selected
        local DataForward = {car = pickedcar, data = data.params.location, type = 'car'}
        TriggerServerEvent('ksuie-veh:server:checkfunds', DataForward)
    end
end)

RegisterNetEvent('RentCarSelected', function(DataForward)
    TriggerServerEvent('ksuie-vehrental:server:RentCarSelected', DataForward)
end)

RegisterNetEvent('ksuie-vehrental:client:RentCar', function(coords, DataForward)
    local PlayerData = QBCore.Functions.GetPlayerData()
    QBCore.Functions.SpawnVehicle(DataForward.car, function(veh)
        SetEntityHeading(veh, coords.w)
        exports['ps-fuel']:SetFuel(veh, 100.0)
        TriggerServerEvent('ksuie-vehrental:Server:GetPapers', GetVehicleNumberPlateText(veh), DataForward.car)
        TriggerServerEvent('ksuie-vehrental:server:GetKeys', GetVehicleNumberPlateText(veh))
        TriggerServerEvent('qb-vehiclekeys:server:GiveVehicleKeys', Player, GetVehicleNumberPlateText(veh))
        TriggerEvent('ksuie-vehrental:client:slotoccupado', veh, coords)
        SpawnVehicle = true
        RentalsOut[#RentalsOut+1] = {veh = veh, renter = PlayerData.citizenid, model = DataForward.car}
    end, coords, true)
end)

RegisterNetEvent('ksuie-vehrental:client:slotoccupado', function(veh, coords)
    local slotoccupado = true
    while slotoccupado do
        Wait(2000)
        local VehLocation = GetEntityCoords(veh)
        local distance = GetDistanceBetweenCoords(VehLocation.x,VehLocation.y,VehLocation.z, coords.x, coords.y, coords.z, false)
        if distance > 6 then
            slotoccupado = false
            TriggerServerEvent('ksuie-vehrental:server:clearslot', coords)
        end
    end
end)

RegisterNetEvent("ksuie-vehrental:Client:ReturnCar", function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local playerPed = PlayerPedId()
    local pedcoords = GetEntityCoords(playerPed)
    for i,j in pairs(RentalsOut) do
        if PlayerData.citizenid == j.renter then
            local vehcoords = GetEntityCoords(j.veh)
            local distance = GetDistanceBetweenCoords(vehcoords.x,vehcoords.y,vehcoords.z, pedcoords.x, pedcoords.y, pedcoords.z, false)
            if distance <= 30 then
                TriggerEvent('ksuie-vehrental:client:returncar', j.veh, j.model)
            end
        end
    end
end)

RegisterNetEvent('ksuie-vehrental:client:returncar', function(veh, model)
    DeleteEntity(veh)
    TriggerServerEvent('ksuie-vehrental:server:returncar', model)
end)

RegisterNetEvent('ksuie-vehrental:Client:OpenBoatMenu', function(data)
    QBCore.Debug(data)
    local menuOptions = {}
    for i,j in pairs(Config.BoatRental) do
        menuOptions[#menuOptions+1] = {value = i, text = j.name.." : $"..j.price, data = j.price}
    end
    local dialog = exports['qb-input']:ShowInput({
        header = "Available Boats",
        submitText = "Choose Boat to Rent",
        inputs = {
            {
                text = "Boat Name : Rental Price", -- text you want to be displayed as a input header
                name = "car_rent_selected", -- name of the input should be unique otherwise it might override
                type = "select", -- type of the input - Select is useful for 3+ amount of "or" options e.g; someselect = none OR other OR other2 OR other3...etc
                options = menuOptions
            }
        }
    })
    if dialog ~= nil then
        local pickedcar = dialog.car_rent_selected
        local DataForward = {car = pickedcar, data = data.params.location, type = 'boat'}
        TriggerServerEvent('ksuie-veh:server:checkfunds', DataForward)
    end
end)
