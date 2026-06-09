clear @s
effect clear @s
effect give @s minecraft:instant_health 1 100 true
xp set @s 0 points
xp set @s 0 levels
tag @s add lobby.player
tag @s remove autorespawn
scoreboard players set @s seconds 90
scoreboard players set @s exit_count 0

tp @s 2000 100.06250 0
playsound minecraft:entity.enderman.teleport master @a 2000 100.06250 0 1.2 1
particle minecraft:witch 2000 101 0 0.5 1 0.5 1 100 force
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"SYSTEM","color":"#30add3","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have returned to the Main Lobby.","color":"yellow","bold":false}]
tellraw @s {"text":" "}
execute at @s run kill @n[type=item,nbt={Item:{id:"minecraft:dark_oak_door"}}]