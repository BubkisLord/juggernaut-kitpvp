# Apply effects or particles as needed before recursion
execute as @s at @s anchored eyes positioned ~ ~ ~ unless entity @e[type=armor_stand,tag=medusa_raycast_tracker] run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["medusa_raycast_tracker","kill_on_end_game"]}
execute if score @p[tag=dragon] current_raycast_depth <= @p[tag=dragon] raycast_limit as @s at @s anchored eyes positioned ~ ~ ~ run tp @n[tag=medusa_raycast_tracker] ^ ^ ^0.5 facing ^ ^ ^1
execute if score @p[tag=dragon] current_raycast_depth <= @p[tag=dragon] raycast_limit as @s at @s anchored eyes positioned ~ ~ ~ run particle dust{color:[0,100,0],scale:2} ^ ^1 ^ 0.1 0.1 0.1 0.4 4 normal @a[tag=runner]
execute if score @p[tag=dragon] current_raycast_depth <= @p[tag=dragon] raycast_limit as @s at @s anchored eyes positioned ~ ~ ~ run particle dust{color:[0,100,0],scale:0.2} ^ ^1 ^ 0.1 0.1 0.1 0.4 4 normal @a[tag=juggernaut]
execute if score @p[tag=dragon] current_raycast_depth <= @p[tag=dragon] raycast_limit as @s run scoreboard players add @p[tag=dragon] current_raycast_depth 1
# execute as @n[tag=medusa_raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 if entity @e[distance=..1.5,tag=runner] run effect give @e[distance=..1.5,tag=runner] poison 1 0 true
execute as @n[tag=medusa_raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 if entity @e[distance=..1.5,tag=runner] run damage @n[tag=runner,distance=..1.5] 1 dragon_breath
execute as @n[tag=medusa_raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 if entity @e[distance=..1.5,tag=runner,nbt={active_effects:[{Id:10,Ambient:false}]}] run scoreboard players add @p[tag=dragon] points 1
execute as @n[tag=medusa_raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 if entity @e[distance=..1.5,tag=runner] run effect clear @n[tag=runner,distance=..1.5] regeneration

# Check 1 block ahead, continue if air is found
execute if score @p[tag=dragon] current_raycast_depth <= @p[tag=dragon] raycast_limit as @n[tag=medusa_raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 if block ~ ~ ~ air run function juggernaut:medusa_raycast
execute if score @p[tag=dragon] current_raycast_depth <= @p[tag=dragon] raycast_limit as @n[tag=medusa_raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 if block ~ ~ ~ water run function juggernaut:medusa_raycast