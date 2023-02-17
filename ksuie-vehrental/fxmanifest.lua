fx_version 'cerulean'
game 'gta5'

description 'ksuie-winemaking'
version '1.0.0'

shared_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'@qb-core/shared/locale.lua',
	'config.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
}
client_script {
	'client/*.lua',
}

lua54 'yes'

