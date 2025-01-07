execute if score #game_state var matches 10 as @n[type=armor_stand,tag=runner_kit_selection_room] at @s run particle campfire_cosy_smoke ~ ~1 ~ 7 1 7 0.00001 1 force
execute if score #game_state var matches 10 as @n[type=armor_stand,tag=runner_kit_selection_room] at @s run effect give @a[distance=..30] weakness 1 255 true

execute if score #game_state var matches 10 as @n[type=armor_stand,tag=juggernaut_kit_selection_room] at @s run particle ash ~ ~1 ~ 7 1 7 0.00001 5 force
execute if score #game_state var matches 10 as @n[type=armor_stand,tag=juggernaut_kit_selection_room] at @s run particle white_ash ~ ~1 ~ 7 1 7 0.00001 5 force
execute if score #game_state var matches 10 as @n[type=armor_stand,tag=juggernaut_kit_selection_room] at @s run particle crimson_spore ~ ~1 ~ 7 1 7 0.00001 5 force