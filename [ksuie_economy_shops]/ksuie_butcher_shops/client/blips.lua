--meat blip = 1664425300
--supply blip = 819673798
--gold blip = 688589278

local blips = {
	-- add butcher shop blips to map
	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = -1322.1, y = 2438.61, z = 309.61 },
	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = 592.89, y = 1686.98, z = 187.39 },
	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = 2540.9, y = 802.33, z = 76.38 },
	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = 1876.53, y = -735.35, z = 42.66 },
	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = -1814.81, y = 653.36, z = 131.82 },
	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = -1980.1, y = -1648.22, z = 117.12 },
	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = -3551.47, y = -3013.28, z = 11.83 },
	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = -5227.56, y = -3470.52, z = -20.57 },
	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = -5179.11, y = -2112.87, z = 12.61 },
	{ name = 'Meat Shop', sprite = -1665418949, native = 1664425300, x = -3965.42, y = -2135.54, z = -5.24 },

}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(info.native, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
		SetBlipScale(blip, 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end
end)



