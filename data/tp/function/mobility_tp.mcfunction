tp @s 3 53 2020 ~ ~
playsound minecraft:entity.enderman.teleport master @a 3 53 2020 1.2 1
particle minecraft:witch 3 54 2020 0.5 1 0.5 1 100 force
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have been teleported to the ","color":"yellow","bold":false},{"text":"Mobility","color":"gold","bold":false},{"text":" Market section.","color":"yellow","bold":false}]
tellraw @s {"text":" "}