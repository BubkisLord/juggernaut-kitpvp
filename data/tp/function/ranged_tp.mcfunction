tp @s 55 49 2017 ~-90 ~
playsound minecraft:entity.enderman.teleport master @a 55 49 2017 1.2 1
particle minecraft:witch 55 50 2017 0.5 1 0.5 1 100 force
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have been teleported to the ","color":"yellow","bold":false},{"text":"Ranged","color":"dark_aqua","bold":false},{"text":" Market section.","color":"yellow","bold":false}]
tellraw @s {"text":" "}