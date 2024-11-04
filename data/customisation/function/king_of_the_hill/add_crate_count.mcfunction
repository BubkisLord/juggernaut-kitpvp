scoreboard objectives add crate_count dummy
scoreboard players add #king_of_the_hill_customisation crate_count 2
execute if score #king_of_the_hill_customisation crate_count matches 9.. run scoreboard players set #king_of_the_hill_customisation crate_count 4
fill 2048 107 1 2048 107 -1 waxed_weathered_copper_bulb[lit=false]
execute if score #king_of_the_hill_customisation crate_count matches 4 run setblock 2048 107 1 waxed_weathered_copper_bulb[lit=true]
execute if score #king_of_the_hill_customisation crate_count matches 6 run setblock 2048 107 0 waxed_weathered_copper_bulb[lit=true]
execute if score #king_of_the_hill_customisation crate_count matches 8 run setblock 2048 107 -1 waxed_weathered_copper_bulb[lit=true]
execute positioned 2048 107 2 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1