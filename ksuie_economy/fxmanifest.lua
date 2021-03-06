-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie

fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


server_scripts {
	'@mysql-async/lib/MySQL.lua',
    'server/server.lua',
    'config.lua',
}

client_scripts {
    'config.lua',
    'client/blips.lua',
    'client/warmenu.lua',
    'client/goldshop.lua',
    'client/meatshop.lua',
    'client/provisionshop.lua',
    'client/supplyshop.lua',
    'client/natives.lua',
    'client/peds.lua',
}