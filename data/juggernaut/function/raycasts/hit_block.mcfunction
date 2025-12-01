execute store result score #hit_function_id var run data get storage juggernaut:raycasts/hit hit_function_id
execute if score #hit_function_id var matches 6 run execute as @s at @s positioned ^ ^2 ^-1 run summon armor_stand ~ ~ ~ {Tags:["camera","kill_on_end_game"],Invisible:true,Invulnerable:true,NoGravity:true}
execute if score #hit_function_id var matches 6 at @s run execute as @n[type=armor_stand,tag=camera] run data modify entity @s CustomName set value {"text":"Camera","color":"#FFD700","italic":false}
execute if score #hit_function_id var matches 6 at @s run execute as @n[type=armor_stand,tag=camera] at @s unless block ~ ~ ~ #air run tp @s ~ ~1 ~
execute if score #hit_function_id var matches 6 run execute as @n[type=armor_stand] run tp @s ~ ~ ~ facing entity @p[tag=eclipse_stalker]
execute if score #hit_function_id var matches 6 run particle dust{color:16711680,scale:1.2} ~ ~ ~ 0.05 0.05 0.05 0 30 force
execute if score #hit_function_id var matches 6 run scoreboard players set @p[tag=eclipse_stalker] jug_kit_cooldown 4