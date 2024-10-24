tag @s remove lobby.player
tag @s add tutorial.player
scoreboard players set @s skip_prompt 0
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Welcome back to the tutorial!","color":"yellow","bold":false}]
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"If you're still confused after this, consider taking a look at the Guide Book. You can find it in one of the lecterns in the Main Lobby.","color":"yellow","bold":false}]
tellraw @s {"text":" "}
tp @s 0 101 -1995 180 0
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
clear @s