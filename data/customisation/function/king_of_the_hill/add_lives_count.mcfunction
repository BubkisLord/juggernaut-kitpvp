scoreboard objectives add lives_count dummy
scoreboard players add #king_of_the_hill_customisation lives_count 1
execute if score #king_of_the_hill_customisation lives_count matches 4.. run scoreboard players set #king_of_the_hill_customisation lives_count 1
scoreboard players set #king_of_the_hill_customisation infinite_lives 0
setblock 2048 107 4 waxed_weathered_copper_bulb[lit=false]
fill 2048 108 1 2048 108 -1 waxed_weathered_copper_bulb[lit=false]
execute if score #king_of_the_hill_customisation lives_count matches 1 run setblock 2048 108 1 waxed_weathered_copper_bulb[lit=true]
execute if score #king_of_the_hill_customisation lives_count matches 2 run setblock 2048 108 0 waxed_weathered_copper_bulb[lit=true]
execute if score #king_of_the_hill_customisation lives_count matches 3 run setblock 2048 108 -1 waxed_weathered_copper_bulb[lit=true]
execute positioned 2048 108 2 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1