--meat blip = 1664425300
--supply blip = 819673798
--gold blip = 688589278

local blips = {
	-- add butcher shop blips to map
	{ name = 'Gold Shop', sprite = 688589278, native = 1664425300, x = 558.75, y = 1696.42, z = 185.87 },
	{ name = 'Gold Shop', sprite = 688589278, native = 1664425300, x = 2578.17, y = 783.28, z = 83.79 },
	{ name = 'Gold Shop', sprite = 688589278, native = 1664425300, x = -2193.67, y = 717.01, z = 122.3 },
	{ name = 'Gold Shop', sprite = 688589278, native = 1664425300, x = -1978.49, y = -1667.97, z = 118.18 },
	{ name = 'Gold Shop', sprite = 688589278, native = 1664425300, x = -5221.2, y = -3460.13, z = -21.26 },
	{ name = 'Gold Shop', sprite = 688589278, native = 1664425300, x = -5212.28, y = -2113.8, z = 12.68 },
	{ name = 'Gold Shop', sprite = 688589278, native = 1664425300, x = -3954.65, y = -2127.17, z = -4.15 },

}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(info.native, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
		SetBlipScale(blip, 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end
end)



