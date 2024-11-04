scoreboard objectives add teams_mode dummy
scoreboard players add #king_of_the_hill_customisation teams_mode 1
execute if score #king_of_the_hill_customisation teams_mode matches 2.. run scoreboard players set #king_of_the_hill_customisation teams_mode 0
execute if score #king_of_the_hill_customisation teams_mode matches 0 run setblock 2048 108 -4 waxed_weathered_copper_bulb[lit=false]
execute if score #king_of_the_hill_customisation teams_mode matches 1 run setblock 2048 108 -4 waxed_weathered_copper_bulb[lit=true]
execute positioned 2048 108 -3 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1