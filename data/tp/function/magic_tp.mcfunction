tp @s 0 63 1974 ~ ~
playsound minecraft:entity.enderman.teleport master @a 0 63 1974 1.2 1
particle minecraft:witch 0 64 1974 0.5 1 0.5 1 100 force
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have been teleported to the ","color":"yellow","bold":false},{"text":"Magic","color":"dark_purple","bold":false},{"text":" Market section.","color":"yellow","bold":false}]
tellraw @s {"text":" "}