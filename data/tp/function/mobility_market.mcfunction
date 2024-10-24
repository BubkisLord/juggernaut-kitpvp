tp @s 1996 100 -5.0 90 5
playsound minecraft:entity.enderman.teleport master @a 1996 100 -5.0 1.2 1
particle minecraft:witch 1996 101 -5.0 0.5 1 0.5 1 100 force
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Walk through the portal to go to the ","color":"yellow","bold":false},{"text":"Mobility","color":"gold","bold":false},{"text":" market section!","color":"yellow","bold":false}]
tellraw @s {"text":" "}