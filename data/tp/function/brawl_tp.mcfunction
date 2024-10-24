tp @s 25 61 1971 ~-90 ~
playsound minecraft:entity.enderman.teleport master @a 25 61 1971 1.2 1
particle minecraft:witch 25 62 1971 0.5 1 0.5 1 100 force
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have been teleported to the ","color":"yellow","bold":false},{"text":"Brawl","color":"dark_green","bold":false},{"text":" Market section.","color":"yellow","bold":false}]
tellraw @s {"text":" "}