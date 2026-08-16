tag @s add respawning
kill @e[type=minecraft:experience_orb]
execute if score #game_state var matches 10..19 run function juggernaut:respawning
execute if score #game_state var matches 20..29 run function survival:respawning
tag @s remove respawning