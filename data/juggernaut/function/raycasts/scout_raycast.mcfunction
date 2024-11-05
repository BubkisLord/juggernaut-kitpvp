# Apply effects or particles as needed before recursion
execute as @s at @s anchored eyes positioned ~ ~ ~ unless entity @e[type=armor_stand,tag=raycast_tracker] run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["raycast_tracker","kill_on_end_game"]}
execute as @s at @s anchored eyes positioned ~ ~ ~ run tp @n[tag=raycast_tracker] ^ ^ ^0.5 facing ^ ^ ^1
execute as @n[tag=raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 if entity @e[distance=..5,tag=juggernaut] run effect give @e[distance=..6,tag=juggernaut] glowing 1 0 true
execute as @n[tag=raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 if entity @e[distance=..5,tag=juggernaut] run tag @e[distance=..6,tag=juggernaut] add is_glowing

# Check 1 block ahead, continue if air is found
execute as @n[tag=raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 if block ~ ~ ~ air run function juggernaut:raycasts/scout_raycast
