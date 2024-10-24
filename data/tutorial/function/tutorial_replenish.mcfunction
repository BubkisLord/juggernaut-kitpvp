tp @s 0 101 -2096
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Nothing to replenish; this is a tutorial. Too bad!","color":"yellow","bold":false}]
tellraw @s {"text":" "}
xp set @s 0 levels
tag @s add lobby.player
tag @s remove tutorial.player