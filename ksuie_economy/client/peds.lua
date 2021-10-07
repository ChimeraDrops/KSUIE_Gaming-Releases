Peds_generalstore = {
    [1]={model ='U_F_M_TumGeneralStoreOwner_01', outfit = 0},
    [2]={model ='U_M_M_ARMGENERALSTOREOWNER_01', outfit = 0},
    [3]={model ='U_M_M_NbxGeneralStoreOwner_01', outfit = 0},
    [4]={model ='U_M_M_RhdGenStoreOwner_01', outfit = 0},
    [5]={model ='U_M_M_StrGenStoreOwner_01', outfit = 0},
    [6]={model ='U_M_M_ValGenStoreOwner_01', outfit = 0},
    [7]={model ='U_M_M_WaLGENERALSTOREOWNER_01', outfit = 0},
    [8]={model ='U_M_O_BlWGeneralStoreOwner_01', outfit = 0},
    }

Peds_bartenders = {
    [1]={model ='U_M_M_NbxBartender_01', outfit = 0},
    [2]={model ='U_M_M_NbxBartender_02', outfit = 0},
    [3]={model ='U_M_M_RhdBartender_01', outfit = 0},
    [4]={model ='U_M_M_TumBartender_01', outfit = 0},
    [5]={model ='U_M_M_ValBartender_01', outfit = 0},
    [6]={model ='U_M_O_ARMBARTENDER_01', outfit = 0},
    [7]={model ='U_M_O_BlWBartender_01', outfit = 0},
    [8]={model ='U_M_O_ValBartender_01', outfit = 0},
    [9]={model ='U_F_M_TljBartender_01', outfit = 0},
    [10]={model ='U_F_M_VHTBARTENDER_01', outfit = 0},
    }

Peds_exoticshop = {
    [1]={model ='U_M_M_SDEXOTICSSHOPKEEPER_01', outfit = 0},
    [2]={model ='U_M_O_VhTExoticShopkeeper_01', outfit = 0},
    }

Peds_butchers = {
    [1]={model ='U_M_M_TumButcher_01', outfit = 0},
    [2]={model ='U_M_M_VALBUTCHER_01', outfit = 0},
    [3]={model ='S_M_M_UNIBUTCHERS_01', outfit = 0},
    }

Peds_trappers = {
    [1]={model ='U_M_M_ValBearTrap_01', outfit = 0},
    [2]={model ='U_M_M_SDTRAPPER_01', outfit = 0},
    [3]={model ='G_M_M_UniMountainMen_01', outfit = 0},
    }

Peds_miners = {
    [1]={model ='A_M_M_AsbMiner_01', outfit = 0},
    [2]={model ='A_M_M_ASBMINER_02', outfit = 0},
    [3]={model ='A_M_M_ASBMINER_03', outfit = 0},
    [4]={model ='A_M_M_asbminer_04', outfit = 0},
    [5]={model ='A_M_Y_AsbMiner_01', outfit = 0},
    [6]={model ='A_M_Y_AsbMiner_02', outfit = 0},
    [7]={model ='A_M_Y_ASBMINER_03', outfit = 0},
    [8]={model ='A_M_Y_ASBMINER_04', outfit = 0},
    [9]={model ='CS_obediahhinton', outfit = 0},
    }

AddEventHandler('Populate:GoldShop', function(x,y,z,h)
    print("LOADING PEDS")
    local pedmodel = Peds_miners[math.random(1,9)]
    local model = GetHashKey(pedmodel.model)
    print(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(100)
        print("ped loading")
    end
    Citizen.Wait(800)
    if HasModelLoaded(model) then
        print("model has loaded")
        newPed = CreatePed_2(model, x, y, z, h, true, false, false, false)
        Citizen.InvokeNative(0x9587913B9E772D29, newPed, true)--Set entity on ground properly
        print("x="..x.." y="..y.." z="..z.." h="..h)
        Citizen.InvokeNative(0x4AD96EF928BD4F9A, model) --model no longer neaded
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, newPed, 0, true) --SetPedOutfitPreset
        Citizen.InvokeNative(0x283978A15512B2FE, newPed, false) --SetRandomOutfitVariation Native
        SetEntityAsMissionEntity(newPed, true, false) --Makes Entitity Part of Environment I Think, last boolean determines if they are permanent or not
        RequestCollisionAtCoord(x,y,z)
--            TaskCombatPed(newPed, player, 0, 16)--From FiveM (0,16) are correct values
        TaskStandStill(newPed,(1000*60*10))
    end
end)

AddEventHandler('Populate:MeatShop', function(x,y,z,h)
    print("LOADING PEDS")
    local pedmodel = Peds_butchers[math.random(1,3)]
    local model = GetHashKey(pedmodel.model)
    print(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(100)
        print("ped loading")
    end
    Citizen.Wait(800)
    if HasModelLoaded(model) then
        print("model has loaded")
        newPed = CreatePed_2(model, x, y, z, h, true, false, false, false)
        Citizen.InvokeNative(0x9587913B9E772D29, newPed, true)--Set entity on ground properly
        print("x="..x.." y="..y.." z="..z.." h="..h)
        Citizen.InvokeNative(0x4AD96EF928BD4F9A, model) --model no longer neaded
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, newPed, 0, true) --SetPedOutfitPreset
        Citizen.InvokeNative(0x283978A15512B2FE, newPed, false) --SetRandomOutfitVariation Native
        SetEntityAsMissionEntity(newPed, true, false) --Makes Entitity Part of Environment I Think, last boolean determines if they are permanent or not
        RequestCollisionAtCoord(x,y,z)
--            TaskCombatPed(newPed, player, 0, 16)--From FiveM (0,16) are correct values
        TaskStandStill(newPed,(1000*60*10))
    end
end)

AddEventHandler('Populate:ProvisionShop', function(x,y,z,h)
    print("LOADING PEDS")
    local pedmodel = Peds_bartenders[math.random(1,10)]
    local model = GetHashKey(pedmodel.model)
    print(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(100)
        print("ped loading")
    end
    Citizen.Wait(800)
    if HasModelLoaded(model) then
        print("model has loaded")
        newPed = CreatePed_2(model, x, y, z, h, true, false, false, false)
        Citizen.InvokeNative(0x9587913B9E772D29, newPed, true)--Set entity on ground properly
        print("x="..x.." y="..y.." z="..z.." h="..h)
        Citizen.InvokeNative(0x4AD96EF928BD4F9A, model) --model no longer neaded
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, newPed, 0, true) --SetPedOutfitPreset
        Citizen.InvokeNative(0x283978A15512B2FE, newPed, false) --SetRandomOutfitVariation Native
        SetEntityAsMissionEntity(newPed, true, false) --Makes Entitity Part of Environment I Think, last boolean determines if they are permanent or not
        RequestCollisionAtCoord(x,y,z)
--            TaskCombatPed(newPed, player, 0, 16)--From FiveM (0,16) are correct values
        TaskStandStill(newPed,(1000*60*10))
    end
end)

AddEventHandler('Populate:SupplyShop', function(x,y,z,h)
    print("LOADING PEDS")
    local pedmodel = Peds_generalstore[math.random(1,8)]
    local model = GetHashKey(pedmodel.model)
    print(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(100)
        print("ped loading")
    end
    Citizen.Wait(800)
    if HasModelLoaded(model) then
        print("model has loaded")
        newPed = CreatePed_2(model, x, y, z, h, true, false, false, false)
        Citizen.InvokeNative(0x9587913B9E772D29, newPed, true)--Set entity on ground properly
        print("x="..x.." y="..y.." z="..z.." h="..h)
        Citizen.InvokeNative(0x4AD96EF928BD4F9A, model) --model no longer neaded
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, newPed, 0, true) --SetPedOutfitPreset
        Citizen.InvokeNative(0x283978A15512B2FE, newPed, false) --SetRandomOutfitVariation Native
        SetEntityAsMissionEntity(newPed, true, false) --Makes Entitity Part of Environment I Think, last boolean determines if they are permanent or not
        RequestCollisionAtCoord(x,y,z)
--            TaskCombatPed(newPed, player, 0, 16)--From FiveM (0,16) are correct values
        TaskStandStill(newPed,(1000*60*10))
    end
end)