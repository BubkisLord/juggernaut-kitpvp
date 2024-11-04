scoreboard objectives add infinite_lives dummy
scoreboard players add #king_of_the_hill_customisation infinite_lives 1
execute if score #king_of_the_hill_customisation infinite_lives matches 2.. run scoreboard players set #king_of_the_hill_customisation infinite_lives 0
execute if score #king_of_the_hill_customisation infinite_lives matches 0 run setblock 2048 107 4 waxed_weathered_copper_bulb[lit=false]
execute if score #king_of_the_hill_customisation infinite_lives matches 1 run setblock 2048 107 4 waxed_weathered_copper_bulb[lit=true]
execute if score #king_of_the_hill_customisation infinite_lives matches 1 run fill 2048 108 1 2048 108 -1 waxed_weathered_copper_bulb[lit=false]
execute if score #king_of_the_hill_customisation infinite_lives matches 1 run scoreboard players remove #king_of_the_hill_customisation lives_count 1
execute positioned 2048 108 4 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1