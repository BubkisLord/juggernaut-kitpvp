scoreboard objectives add teams_mode dummy
scoreboard players add #jug_pvp_customisation teams_mode 1
execute if score #jug_pvp_customisation teams_mode matches 2.. run scoreboard players set #jug_pvp_customisation teams_mode 0
execute if score #jug_pvp_customisation teams_mode matches 0 run setblock 2051 107 -6 waxed_copper_bulb[lit=false]
execute if score #jug_pvp_customisation teams_mode matches 1 run setblock 2051 107 -6 waxed_copper_bulb[lit=true]
execute positioned 2051 108 -6 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1