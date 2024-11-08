# Apply effects or particles as needed before recursion
execute as @s at @s anchored eyes positioned ~ ~ ~ unless entity @e[type=armor_stand,tag=blinker_raycast_tracker] run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["blinker_raycast_tracker","kill_on_end_game"]}
execute as @s at @s anchored eyes positioned ~ ~ ~ run tp @n[tag=blinker_raycast_tracker] ^ ^ ^0.5 facing ^ ^ ^1
execute as @n[tag=blinker_raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 if entity @e[distance=..5,tag=blinker_remnant] run effect give @e[distance=..1,tag=blinker_remnant] glowing 1 0 true
execute as @n[tag=blinker_raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 if entity @e[distance=..5,tag=blinker_remnant] as @e[distance=..1,tag=blinker_remnant] at @s run particle dust{color:[140,40,100],scale:2} ~ ~0.5 ~ 0.5 2 0.5 0.4 4 force @a
execute as @n[tag=blinker_raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 if entity @e[distance=..5,tag=blinker_remnant] run tag @n[distance=..1,tag=blinker_remnant] add blinker_teleporting

# Check 1 block ahead, continue if air is found
execute as @n[tag=blinker_raycast_tracker] at @s anchored eyes positioned ^ ^ ^0.5 run function juggernaut:raycasts/blinker_teleport_raycast
