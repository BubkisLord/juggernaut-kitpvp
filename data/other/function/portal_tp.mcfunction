tp @s @e[tag=portaltp,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You went through the ","color":"yellow","bold":false},{"text":"Nether Portal","color":"dark_purple","bold":false},{"text":".","color":"yellow","bold":false}]
tellraw @s {"text":" "}