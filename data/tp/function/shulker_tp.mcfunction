#Lobby
execute as @a at @s if block ~ ~-2 ~ gray_shulker_box run function tp:kit_select_tp
execute as @a at @s if block ~ ~-2 ~ cyan_shulker_box if entity @a[scores={health=..0}] run tellraw @a {"text":"[","color":"dark_gray","bold":true,"extra":[{"text":"ERROR","color":"red","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Not all players have respawned yet. Please wait for them to respawn or enter the game via the dedicated selection room.","color":"red"}]} 
execute as @a at @s if block ~ ~-2 ~ cyan_shulker_box unless entity @a[scores={health=..0}] run scoreboard players set #survival_customisation teams_mode 0
execute as @a at @s if block ~ ~-2 ~ cyan_shulker_box unless entity @a[scores={health=..0}] run function survival:start
execute as @a at @s if block ~ ~-2 ~ cyan_shulker_box if entity @a[scores={health=..0}] run tellraw @a {"text":"[","color":"dark_gray","bold":true,"extra":[{"text":"ERROR","color":"red","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Not all players have respawned yet. Please wait for them to respawn or enter the game via the dedicated selection room.","color":"red"}]} 
execute as @a at @s if block ~ ~-2 ~ orange_shulker_box unless entity @a[scores={health=..0}] run scoreboard players set #juggernaut_customisation completable_stations 1
execute as @a at @s if block ~ ~-2 ~ orange_shulker_box unless entity @a[scores={health=..0}] run function juggernaut:start_pregame
execute as @a at @s if block ~ ~-2 ~ orange_shulker_box if entity @a[scores={health=..0}] run tellraw @a {"text":"[","color":"dark_gray","bold":true,"extra":[{"text":"ERROR","color":"red","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Not all players have respawned yet. Please wait for them to respawn or enter the game via the dedicated selection room.","color":"red"}]} 
execute as @a at @s if block ~ ~-2 ~ green_shulker_box unless entity @a[scores={health=..0}] run scoreboard players set #juggernaut_customisation completable_stations 0
execute as @a at @s if block ~ ~-2 ~ green_shulker_box unless entity @a[scores={health=..0}] run function juggernaut:start_pregame
execute as @a at @s if block ~ ~-2 ~ purple_shulker_box if entity @a[scores={health=..0}] run tellraw @a {"text":"[","color":"dark_gray","bold":true,"extra":[{"text":"ERROR","color":"red","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Not all players have respawned yet. Please wait for them to respawn or enter the game via the dedicated selection room.","color":"red"}]} 
execute as @a at @s if block ~ ~-2 ~ purple_shulker_box unless entity @a[scores={health=..0}] run scoreboard players set #survival_customisation teams_mode 1
execute as @a at @s if block ~ ~-2 ~ purple_shulker_box unless entity @a[scores={health=..0}] run function survival:start

#Tutorial
execute as @a[level=0..9] at @s if block ~ ~-2 ~ blue_shulker_box run tp @s ~ ~ ~1
execute as @a[tag=!ul.Warrior] at @s if block ~ ~-2 ~ light_blue_shulker_box run tp @s ~ ~ ~1