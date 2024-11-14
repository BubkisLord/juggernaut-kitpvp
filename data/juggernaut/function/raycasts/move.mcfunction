execute store result score #move_function_id var run data get storage juggernaut:raycasts/move move_function_id
execute if score #move_function_id var matches 1 run particle dust_color_transition{from_color:[1.0,0.0,1.0],to_color:[0.2,0.0,0.2],scale:2.2} ^ ^1 ^ 0.1 0.1 0.1 0.4 4 normal @a
execute if score #move_function_id var matches 2 run particle dust{color:[100,0,0],scale:1} ~ ~ ~ 0.1 0.1 0.1 0.4 4 normal
execute if score #move_function_id var matches 3 run particle dust_color_transition{from_color:[0.7,0.7,0.7],to_color:[0.1,0.2,0.1],scale:2.2} ^ ^1 ^ 0.1 0.1 0.1 0.4 4 normal @a