tag @s add newbie
team join newbie @s
tag @s add tutorial.player
scoreboard players set @s kills 0
scoreboard players set @s seconds 90
scoreboard players set @s deaths 0
scoreboard players set @s bow 0
scoreboard players set @s crossbow 0
scoreboard players set @s trident 0
scoreboard players set @s kitsunlocked 0
scoreboard players set @s kitsnotunlocked 32
scoreboard players set @s favourite1 0
scoreboard players set @s favourite2 0
scoreboard players set @s favourite3 0
scoreboard players set @s kitTokens 0
scoreboard players set @s exit_count 0
scoreboard players set @s skip_prompt 0
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Welcome to Jakob's KitPvP, ","color":"yellow","bold":false},{"selector":"@s","bold":false},{"text":"!","color":"yellow","bold":false}]
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Please go through this quick tutorial so you know what to do.","color":"yellow","bold":false}]
tellraw @s {"text":" "}
tp @s 0 101 -1995 180 0
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
execute as @s at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 0.7
clear @s