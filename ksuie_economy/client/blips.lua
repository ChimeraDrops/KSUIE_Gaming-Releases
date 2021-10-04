--meat blip = -1665418949
--supply blip = 819673798
--gold blip = 688589278
--provision blip = 1475879922

local blips = {
	-- add butcher shop blips to map
	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = 591.77, y = 1689.97, z = 187.45 },
--	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = 00, y = 00, z = 00 },

	{ name = 'Gold Shop', sprite = 688589278, native = 1664425300, x = 559.65, y = 1696.67, z = 185.88 },
--	{ name = 'Gold Shop', sprite = 688589278, native = 1664425300, x = 00, y = 00, z = 00 },

	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = 581.09, y = 1698.87, z = 187.44 },
--	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = 00, y = 00, z = 00 },

	{ name = 'Provision Shop', sprite = 1475879922, native = 1664425300, x = 584.56, y = 1694.75, z = 187.39 },
--	{ name = 'Provision Shop', sprite = 1475879922, native = 1664425300, x = 00, y = 00, z = 00 },


}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(info.native, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
		SetBlipScale(blip, 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end
end)



