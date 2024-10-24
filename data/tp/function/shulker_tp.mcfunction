#Lobby
execute as @a at @s if block ~ ~-2 ~ gray_shulker_box run function tp:kit_select_tp
execute as @a at @s if block ~ ~-2 ~ green_shulker_box run function tp:brawl_tp
execute as @a at @s if block ~ ~-2 ~ cyan_shulker_box run function tp:ranged_tp
execute as @a at @s if block ~ ~-2 ~ orange_shulker_box run function tp:mobility_tp
execute as @a at @s if block ~ ~-2 ~ purple_shulker_box run function tp:magic_tp
execute as @a at @s if block ~ ~-2 ~ red_shulker_box if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run function juggernaut:start_pregame

#Tutorial
execute as @a[level=0..9] at @s if block ~ ~-2 ~ blue_shulker_box run tp @s ~ ~ ~1
execute as @a[tag=!ul.Warrior] at @s if block ~ ~-2 ~ light_blue_shulker_box run tp @s ~ ~ ~1