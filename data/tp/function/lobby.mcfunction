tag @s add lobby.player

tp @s 2000 100.06250 0
playsound minecraft:entity.enderman.teleport master @a 2000 100.06250 0 1.2 1
particle minecraft:witch 2000 101 0 0.5 1 0.5 1 100 force
execute at @s run kill @n[type=item,nbt={Item:{id:"minecraft:dark_oak_door"}}]