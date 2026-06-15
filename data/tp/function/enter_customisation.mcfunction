clear @s
effect clear @s
effect give @s minecraft:instant_health 1 100 true
xp set @s 0 points
xp set @s 0 levels
tag @s add lobby.player
tag @s remove autorespawn
scoreboard players set @s seconds 90
scoreboard players set @s exit_count 0

tp @s 2054 85.0625 -3
playsound minecraft:entity.enderman.teleport master @a 2054 85.4625 -3 1.2 1
particle minecraft:witch 2054 85.4625 -3 0.5 1 0.5 1 100 force