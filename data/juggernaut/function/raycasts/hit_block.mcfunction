execute store result score #hit_function_id var run data get storage juggernaut:raycasts/hit hit_function_id
execute if score #hit_function_id var matches 6 run execute as @s at @s positioned ^ ^ ^-1 run summon armor_stand ~ ~ ~ {Tags:["camera","kill_on_end_game"],Invisible:true,Invulnerable:true,NoGravity:true}
execute if score #hit_function_id var matches 6 run execute as @n[type=armor_stand] run tp @s ~ ~ ~ facing entity @p[tag=eclipse_stalker]
execute if score #hit_function_id var matches 6 run particle dust{color:[100,0,0],scale:1.2} ~ ~ ~ 0.05 0.05 0.05 0 30 force
execute if score #hit_function_id var matches 6 run scoreboard players set @p[tag=stalker] jug_kit_cooldown 30