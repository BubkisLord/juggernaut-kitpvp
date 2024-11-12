execute store result score #hit_function_id var run data get storage juggernaut:raycasts/hit hit_function_id
execute if score #hit_function_id var matches 1 run damage @s 4 dragon_breath by @p[tag=dragon]
execute if score #hit_function_id var matches 1 run particle dust_color_transition{from_color:[0.7,0.0,0.7],to_color:[0.0,0.0,0.0],scale:2.2} ^ ^1 ^ 1 1 1 2 10 normal @a
execute if score #hit_function_id var matches 2 run effect give @s glowing 2 0 true
execute if score #hit_function_id var matches 2 run tag @s add is_glowing
execute if score #hit_function_id var matches 2 run particle enchant ~ ~ ~ 2 2 2 0 1 normal @a
