scoreboard objectives add perks_enabled dummy
scoreboard players add #juggernaut_customisation perks_enabled 1
execute if score #juggernaut_customisation perks_enabled matches 2.. run scoreboard players set #juggernaut_customisation perks_enabled 0
execute if score #juggernaut_customisation perks_enabled matches 0 run setblock 2057 107 6 waxed_copper_bulb[lit=false]
execute if score #juggernaut_customisation perks_enabled matches 1 run setblock 2057 107 6 waxed_copper_bulb[lit=true]
execute positioned 2057 107 6 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1