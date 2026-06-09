tag @s add respawning
execute if score #game_state var matches 10..19 run function juggernaut:respawning
execute if score #game_state var matches 20..29 run function survival:respawning
execute if score #game_state var matches 30..39 run function king_of_the_hill:respawning
execute if score #game_state var matches 40..49 run function jug_pvp:respawning
tag @s remove respawning