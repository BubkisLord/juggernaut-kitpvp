tp @s 2054.5 100.06250 0.5
playsound minecraft:entity.enderman.teleport master @a 2054.5 100.06250 0.5 1.2 1
particle minecraft:witch 2054.5 100.1 0.5 0.5 1 0.5 1 100 force
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have been teleported to the Main Lobby.","color":"yellow","bold":false}]
tellraw @s {"text":" "}
execute at @s run kill @n[type=item,nbt={Item:{id:"minecraft:dark_oak_door"}}]