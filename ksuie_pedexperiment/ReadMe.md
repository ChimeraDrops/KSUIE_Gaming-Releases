-- Created by KSUIE_Gaming for MiscreantMafia RP : Discord : https://discord.gg/vydyEUgeDw
-- Ksuie.Gaming Twitch : www.twitch.tv/ksuie

# PURPOSE & NOTES
- This script allows you to spawn every ped in the game in rows so you can evaluate the ped models. I built it to experiment with spawning in peds.  You can also change relationships and evaluate ped relationships, or assign tasks to evaluate tasks. You have to do this manually by editing the pedclient.lua file.
- You can only spawn in about 90 - 100 peds per run. 
- Change coordinates in pedclient.lua to set initial spawn point, you have to be on flat ground or it will begin spawning peds under map and get all crazy.
- To change the peds you want to spawn adjust the i value in the fore loop. i value = start ped PedsToCreate = end of loop ped
- Some models are scuffed if you hit a scuffed ped check you F8 to see what it's number is and then you can either start the next loop higher than that or you can delete it but you will have to change all the id numbers so the are in order for the loop to work properly

# INSTALLATION
- Put ksuie_pedexperiment in your resources folder
- ensure ksuie_pedexperiment in your server.cfg
- use command /loadpeds to spawn in your ped loop

# THANK YOU
If you like this simple script and find it helpful please give me a follow on my twitch channel and feel free to join my Discord.

