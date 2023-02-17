local QBCore = exports['qb-core']:GetCoreObject()

local refund = 0

RegisterNetEvent('ksuie-veh:server:checkfunds', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local model = data.car
    local type = data.type
    if type == 'car' then
        local totalPrice= Config.RentalCars[model].price
        if Player.Functions.GetMoney('cash') >= totalPrice then
            Player.Functions.RemoveMoney('cash', totalPrice)
            refund = totalPrice
            TriggerClientEvent('RentCarSelected',src, data)
        elseif Player.Functions.GetMoney('bank') >= totalPrice then
            Player.Functions.RemoveMoney('bank', totalPrice)
            refund = totalPrice
            TriggerClientEvent('RentCarSelected',src, data)
        else
            QBCore.Functions.Notify(src, 'Get yo broke ass out of here.', 'error', 3000)
        end
    elseif type == 'boat' then
        local totalPrice = Config.BoatRental[model].price
        if Player.Functions.GetMoney('cash') >= totalPrice then
            Player.Functions.RemoveMoney('cash', totalPrice)
            refund = totalPrice
            TriggerClientEvent('RentCarSelected',src, data)
        elseif Player.Functions.GetMoney('bank') >= totalPrice then
            Player.Functions.RemoveMoney('bank', totalPrice)
            refund = totalPrice
            TriggerClientEvent('RentCarSelected',src, data)
        else
            QBCore.Functions.Notify(src, 'Get yo broke ass out of here.', 'error', 3000)
        end
    end
end)


RegisterNetEvent('ksuie-vehrental:server:RentCarSelected', function(DataForward)
    local src= source
    local Player = QBCore.Functions.GetPlayer(src)
    local found = false
    local foundslot = false
    for i,j in pairs(Config.SpawnSlots[DataForward.data]) do
        if not found then
            if j.occupied then
                print('slottaken')
            else
                j.occupied = true
                foundslot = true
                TriggerClientEvent('ksuie-vehrental:client:RentCar',src, j.coords, DataForward)
                found = true
            end
        end
    end
    if not foundslot then
        QBCore.Functions.Notify(src, 'No Empty Slots Available', 'error', 3000)
        Player.Functions.AddMoney('cash', refund)
    end
end)

RegisterNetEvent('ksuie-vehrental:Server:GetPapers', function(licenseplate, model)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {
        name = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.." "..Player.PlayerData.citizenid,
        veh = QBCore.Shared.Vehicles[model]["brand"].." "..QBCore.Shared.Vehicles[model]["name"],
        plate = licenseplate,
        model = model
    }
    Player.Functions.AddItem("rentalpapers", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rentalpapers'], "add")
    

end)

RegisterNetEvent('ksuie-vehrental:server:GetKeys', function(plate)
    local src = source
    TriggerClientEvent("qb-vehiclekeys:client:AddKeys", src, plate)
end)


RegisterNetEvent('ksuie-vehrental:server:clearslot', function(coords)
    for i,j in pairs(Config.SpawnSlots) do
        for k,v in pairs(j) do
            if v.coords == coords then
                v.occupied = false
            end
        end
    end
end)

RegisterNetEvent('ksuie-vehrental:server:returncar', function(model)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for i,j in pairs(Config.RentalCars) do
        local totalPrice = j.price
        if model == i then
            Player.Functions.AddMoney('cash', totalPrice*0.75)
            break
        end
    end
    for i,j in pairs(Config.BoatRental) do
        local totalPrice = j.price
        if model == i then
            Player.Functions.AddMoney('cash', totalPrice*0.75)
            break
        end
    end
end)