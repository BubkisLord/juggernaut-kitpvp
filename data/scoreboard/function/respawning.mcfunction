tag @s add respawning
execute if score #game_state var matches 10..19 run function juggernaut:respawning
execute if score #game_state var matches 20..29 run function survival:respawning
execute if score #game_state var matches 30..39 run function king_of_the_hill:respawning
execute if score #game_state var matches 50..59 run function hide_and_seek:respawning
execute if score #game_state var matches 0 run function scoreboard:kitpvp_respawn
tag @s remove respawning