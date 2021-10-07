--meat blip = -1665418949
--supply blip = 819673798
--gold blip = 688589278
--provision blip = 1475879922
local blips = {
	-- add butcher shop blips to map
	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, Config.MeatShop.coords[1].x, Config.MeatShop.coords[1].y, Config.MeatShop.coords[1].z},
--	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = Config.MeatShop.coords[1].x, y = Config.MeatShop.coords[1].y, z = Config.MeatShop.coords[1].z },

	{ name = 'Gold Shop', sprite = 688589278, native = 1664425300, Config.GoldShop.coords[1].x, Config.GoldShop.coords[1].y, Config.GoldShop.coords[1].z},
--	{ name = 'Gold Shop', sprite = 688589278, native = 1664425300, x = Config.GoldShop.coords[1], y = Config.GoldShop.coords[1].y, z = Config.GoldShop.coords[1].z },

	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, Config.SupplyShop.coords[1].x, Config.SupplyShop.coords[1].y, Config.SupplyShop.coords[1].z},
--	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = Config.SupplyShop.coords[1].x, y = Config.SupplyShop.coords[1].y, z = Config.SupplyShop.coords[1].z },

	{ name = 'Provision Shop', sprite = 1475879922, native = 1664425300, Config.ProvisionShop.coords[1].x, Config.ProvisionShop.coords[1].y, Config.ProvisionShop.coords[1].z},
--	{ name = 'Provision Shop', sprite = 1475879922, native = 1664425300, x = Config.ProvisionShop.coords[1].x, y = Config.ProvisionShop.coords[1].y, z = Config.ProvisionShop.coords[1].z },


}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(info.native, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
		SetBlipScale(blip, 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end
end)



