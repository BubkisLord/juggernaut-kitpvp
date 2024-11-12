execute store result score #hit_function_id var run data get storage juggernaut:raycasts/hit hit_function_id
execute if score #hit_function_id var matches 1 run damage @s 4 dragon_breath by @p[tag=dragon]
execute if score #hit_function_id var matches 1 run particle dust_color_transition{from_color:[0.7,0.0,0.7],to_color:[0.0,0.0,0.0],scale:2.2} ^ ^1 ^ 1 1 1 2 10 normal @a
execute if score #hit_function_id var matches 2 run effect give @s glowing 2 0 true
execute if score #hit_function_id var matches 2 run tag @s add is_glowing
execute if score #hit_function_id var matches 2 run particle enchant ~ ~ ~ 2 2 2 0 1 normal @a
execute if score #hit_function_id var matches 3 run damage @s 10 magic at ^ ^ ^5
execute if score #hit_function_id var matches 3 run effect give @s slowness 5 1 true
execute if score #hit_function_id var matches 3 run scoreboard players set @p[tag=chain_hunter,tag=teleporting] jug_kit_cooldown 30
execute if score #hit_function_id var matches 4 run execute at @p[tag=chain_hunter,tag=teleporting] run particle witch ~ ~0.5 ~ 1.5 1.5 1.5 0 200 force
execute if score #hit_function_id var matches 4 run execute positioned ~ ~0.5 ~ run tp @p[tag=chain_hunter,tag=teleporting] @s
execute if score #hit_function_id var matches 4 run particle flame ~ ~0.5 ~ 1.5 1.5 1.5 0 100 force
execute if score #hit_function_id var matches 4 run scoreboard players set @p[tag=chain_hunter,tag=teleporting] jug_kit_cooldown_2 30
