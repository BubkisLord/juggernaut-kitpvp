execute store result score #move_function_id var run data get storage juggernaut:raycast/move move_function_id
execute if score #move_function_id var matches 1 run particle dust{color:[0,100,0],scale:2} ^ ^1 ^ 0.1 0.1 0.1 0.4 4 normal @a[tag=runner]
execute if score #move_function_id var matches 1 run particle dust{color:[0,100,0],scale:0.2} ^ ^1 ^ 0.1 0.1 0.1 0.4 4 normal @a[tag=!runner]