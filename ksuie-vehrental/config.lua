Config = {}

Config.RentalLocations = {
    [1] = {
        name = 'legion',
        pedcoords = vector4(111.06, -1090.12, 29.3-1, 354.17),
        icon = 'fas fa-clipboard',
        ped = 'a_m_y_hipster_03',
        scenario = "WORLD_HUMAN_CLIPBOARD",
        blip = 724,
        blipcolor = 32,
        label = 'Car Rental',
		target = {
			options = {
				{
					type = "client",
					event = "ksuie-vehrental:Client:OpenCarMenu",
					icon = "fas fa-clipboard",
					label = "Rent Car",
					targeticon = 'fas fa-clipboard',
                    position = 1,
                    params = {location = 'legion'}
				},
                {
					type = "client",
					event = "ksuie-vehrental:Client:ReturnCar",
					icon = "fas fa-clipboard",
					label = "Return Car",
					targeticon = 'fas fa-clipboard',
                    position = 2,
                    params = {location = 'legion'}

				},
			},
			distance = 2.0
		},
    },
    [2] = {
        name = 'airport',
        pedcoords = vector4(-1036.67, -2682.75, 14.07-1, 335.81),
        icon = 'fas fa-clipboard',
        ped = 'a_m_y_hipster_03',
        scenario = "WORLD_HUMAN_CLIPBOARD",
        blip = 724,
        blipcolor = 32,
        label = 'Car Rental',
		target = {
			options = {
				{
					type = "client",
					event = "ksuie-vehrental:Client:OpenCarMenu",
					icon = "fas fa-clipboard",
					label = "Rent Car",
					targeticon = 'fas fa-clipboard',
                    position = 1,
                    params = {location = 'airport'}

				},
                {
					type = "client",
					event = "ksuie-vehrental:Client:ReturnCar",
					icon = "fas fa-clipboard",
					label = "Return Car",
					targeticon = 'fas fa-clipboard',
                    position = 2,
                    params = {location = 'airport'}

				},
			},
			distance = 2.0
		},
    },
    [3] = {
        name = 'docks',
        pedcoords = vector4(-990.41, -1406.41, 1.6-1, 198.76),
        icon = 'fas fa-clipboard',
        ped = 'a_m_y_hipster_03',
        scenario = "WORLD_HUMAN_CLIPBOARD",
        blip = 724,
        blipcolor = 410,
        label = 'Boat Rental',
		target = {
			options = {
				{
					type = "client",
					event = "ksuie-vehrental:Client:OpenBoatMenu",
					icon = "fas fa-clipboard",
					label = "Rent Boat",
					targeticon = 'fas fa-clipboard',
                    position = 1,
                    params = {location = 'docks'}

				},
                {
					type = "client",
					event = "ksuie-vehrental:Client:ReturnCar",
					icon = "fas fa-clipboard",
					label = "Return Boat",
					targeticon = 'fas fa-clipboard',
                    position = 2,
                    params = {location = 'docks'}
				},
			},
			distance = 2.0
		},
    },
}

Config.RentalCars = {    
    ["blista2"] = {
        name = "Dinka Blista Compact",
        price = 400
    },
    ["primo2"] = {
        name = "Albany Primo Custom",
        price = 500
    },
    ["gresley"] = {
        name = "Bravado Gresley",
        price = 600
    },
    ["granger"] = {
        name = "Declasse Granger",
        price = 700
    },
    ["seminole"] = {
        name = "Canis Seminole",
        price = 800
    },
    ["zion"] = {
        name = "Übermacht Zion",
        price = 900
    },
    ["rumpo"] = {
        name = "Bravado Rumpo",
        price = 1000
    },
}

Config.BoatRental = {
    ["seashark"] = {
        name = "Jet Ski",
        price = 500
    },
    ["jetmax"] = {
        name = "Small Ski Boat",
        price = 1000
    },
    ["tropic"] = {
        name = "Cruiser",
        price = 1500
    },
    ["marquis"] = {
        name = "Sail Boat",
        price = 2000
    },
    ["suntrap"] = {
        name = "Jet Boat",
        price = 2500
    },
    ["longfin"] = {
        name = "Big Ski Boat",
        price = 3000
    },
    ["speeder"] = {
        name = "Large Cruiser",
        price = 5000
    },
    ["toro"] = {
        name = "Fancy Cruiser",
        price = 6000
    },
}

Config.SpawnSlots = {
    ['legion'] = {
        slot1 = {coords = vector4(104.37, -1079.2, 29.19, 338.69), occupied = false}, 
        slot2 = {coords = vector4(107.75, -1079.93, 29.19, 341.92), occupied = false}, 
        slot3 = {coords = vector4(111.24, -1081.28, 29.19, 336.82), occupied = false}
    },
    ['airport'] ={
        slot1 = {coords = vector4(-1039.0, -2679.08, 13.83, 326.13), occupied = false}, 
        slot2 = {coords = vector4(-1041.95, -2676.55, 13.83, 321.46), occupied = false}, 
        slot3 = {coords = vector4(-1044.79, -2674.37, 13.83, 321.08), occupied = false}
    },
    ['docks'] = {
        slot1 = {coords = vector4(-999.63, -1399.68, 1.57, 20.53), occupied = false}, 
        slot2 = {coords = vector4(-991.53, -1395.81, 1.57, 13.28), occupied = false}, 
        slot3 = {coords = vector4(-982.48, -1392.92, 1.57, 25.17), occupied = false}
    },
}