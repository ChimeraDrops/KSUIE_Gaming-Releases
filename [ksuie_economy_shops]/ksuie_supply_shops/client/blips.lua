--meat blip = 1664425300
--supply blip = 819673798
--gold blip = 688589278

local blips = {
	-- add butcher shop blips to map
	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = -1348.8, y = 2438.4, z = 308.42 },
	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = 584.83, y = 1694.74, z = 187.4 },
	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = 2555.96, y = 765.82, z = 78.31 },
	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = 1878.22, y = -770.93, z = 42.46 },
	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = -2200.42, y = 727.80, z = 122.75 },
	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = -1981.84, y = -1619.87, z = 118.09 },
	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = -3549.31, y = -3043.77, z = 11.94 },
	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = -5225.43, y = -3489.99, z = -20.54 },
	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = -5192.97, y = -2099.01, z = 12.39 },
	{ name = 'Supply Shop', sprite = 819673798, native = 1664425300, x = -3967.68, y = -2143.79, z = -5.59 },

}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(info.native, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
		SetBlipScale(blip, 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end
end)



