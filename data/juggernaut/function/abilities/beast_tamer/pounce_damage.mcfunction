damage @s 8 minecraft:mob_attack by @n[type=goat,tag=pouncing]
tag @s add pounce_hit

execute store result score #px tmp run data get entity @s Pos[0] 1000
execute store result score #pz tmp run data get entity @s Pos[2] 1000

execute store result score #wx tmp run data get entity @e[type=goat,tag=pouncing,limit=1,sort=nearest] Pos[0] 1000
execute store result score #wz tmp run data get entity @e[type=goat,tag=pouncing,limit=1,sort=nearest] Pos[2] 1000

scoreboard players operation #rx tmp = #px tmp
scoreboard players operation #rx tmp -= #wx tmp
scoreboard players operation #rz tmp = #pz tmp
scoreboard players operation #rz tmp -= #wz tmp

execute store result entity @s Motion[0] double 0.004 run scoreboard players get #rx tmp
execute store result entity @s Motion[2] double 0.004 run scoreboard players get #rz tmp
data modify entity @s Motion[1] set value 0.4