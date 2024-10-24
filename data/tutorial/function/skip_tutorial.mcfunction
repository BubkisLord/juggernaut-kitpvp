tag @s remove tutorial.player
tag @s add lobby.player
tag @s[tag=!ul.Warrior] add ul.Warrior
xp set @s 0 levels
scoreboard players set @s skip_prompt 0

tp @s 2000 100.06250 0
playsound minecraft:entity.enderman.teleport master @a 2000 100.06250 0 1.2 1
particle minecraft:witch 2000 101 0 0.5 1 0.5 1 100 force
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have successfully skipped the tutorial! You are now in the Main Lobby.","color":"yellow","bold":false}]
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"If you ever want to retake the tutorial, use the clickable signs in this room.","color":"yellow","bold":false}]
tellraw @s {"text":" "}
execute at @s run kill @n[type=item,nbt={Item:{id:"minecraft:book"}},distance=..3]