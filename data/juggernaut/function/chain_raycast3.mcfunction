# Apply effects or particles as needed before recursion
execute as @s at @s anchored eyes positioned ~ ~ ~ unless entity @e[type=armor_stand,tag=chain_raycast_tracker_3] run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["chain_raycast_tracker_3","kill_on_end_game"]}

execute if entity @a[tag=runner,distance=..10] if score @n[type=armor_stand,tag=portal_tether_3] current_raycast_depth <= @n[type=armor_stand,tag=portal_tether_3] raycast_limit as @s at @s anchored eyes positioned ~ ~ ~ run tp @n[tag=chain_raycast_tracker_3] ^ ^ ^0.5 facing ^ ^ ^1
execute if entity @a[tag=runner,distance=..10] if score @n[type=armor_stand,tag=portal_tether_3] current_raycast_depth <= @n[type=armor_stand,tag=portal_tether_3] raycast_limit as @s at @s anchored eyes positioned ~ ~ ~ run particle dust{color:[0.3,0.3,0.3],scale:0.4} ^ ^1 ^ 0.1 0.1 0.1 0.4 3 force @a
execute if entity @a[tag=runner,distance=..10] if score @n[type=armor_stand,tag=portal_tether_3] current_raycast_depth <= @n[type=armor_stand,tag=portal_tether_3] raycast_limit as @s at @s anchored eyes positioned ~ ~ ~ run particle dust{color:[0.7,0.7,0.7],scale:0.4} ^ ^1 ^ 0.1 0.1 0.1 0.4 3 force @a
execute if entity @a[tag=runner,distance=..10] if score @n[type=armor_stand,tag=portal_tether_3] current_raycast_depth <= @n[type=armor_stand,tag=portal_tether_3] raycast_limit as @s run scoreboard players add @n[type=armor_stand,tag=portal_tether_3] current_raycast_depth 1

execute as @n[tag=chain_raycast_tracker_3] at @s anchored eyes positioned ^ ^ ^0.5 if entity @e[distance=..1.5,tag=runner] run damage @n[distance=..1.5,tag=runner] 1
execute as @n[tag=chain_raycast_tracker_3] at @s anchored eyes positioned ^ ^ ^0.5 if entity @e[distance=..1.5,tag=runner] run effect give @n[tag=runner,distance=..1.5] slowness 1 255 true

execute as @n[type=armor_stand,tag=portal_tether_3] at @s if entity @n[tag=runner,distance=..10] run tp @s ~ ~ ~ facing entity @n[tag=runner] feet

# Check 1 block ahead, continue if air is found
execute if score @n[type=armor_stand,tag=portal_tether_3] current_raycast_depth <= @n[type=armor_stand,tag=portal_tether_3] raycast_limit as @n[tag=chain_raycast_tracker_3] at @s anchored eyes positioned ^ ^ ^0.5 if block ~ ~ ~ air unless entity @n[tag=runner,distance=..1.5] run function juggernaut:chain_raycast3
execute if score @n[type=armor_stand,tag=portal_tether_3] current_raycast_depth <= @n[type=armor_stand,tag=portal_tether_3] raycast_limit as @n[tag=chain_raycast_tracker_3] at @s anchored eyes positioned ^ ^ ^0.5 if block ~ ~ ~ water unless entity @n[tag=runner,distance=..1.5] run function juggernaut:chain_raycast3
