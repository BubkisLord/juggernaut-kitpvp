tag @e[type=armor_stand,tag=survival_chest_indicator,limit=1,sort=random,tag=!legendary] add setting_legendary
execute as @e[type=armor_stand,tag=setting_legendary] at @s run setblock ~ ~ ~ air replace
execute as @e[type=armor_stand,tag=setting_legendary] at @s run kill @e[type=item,distance=..1]
execute as @e[type=armor_stand,tag=setting_legendary] at @s run setblock ~ ~ ~ chest{LootTable:"survival:chests/legendary"} replace
execute as @e[type=armor_stand,tag=setting_legendary] at @s run tag @s remove common
execute as @e[type=armor_stand,tag=setting_legendary] at @s run tag @s remove uncommon
execute as @e[type=armor_stand,tag=setting_legendary] at @s run tag @s remove rare
execute as @e[type=armor_stand,tag=setting_legendary] at @s run tag @s add legendary
execute as @e[type=armor_stand,tag=setting_legendary] at @s run tag @s remove setting_legendary