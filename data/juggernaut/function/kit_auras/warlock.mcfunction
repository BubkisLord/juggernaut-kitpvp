execute unless entity @e[type=armor_stand,tag=warlock_aura_manager,tag=kill_on_end_game] run summon armor_stand ~ ~ ~ {Tags:["warlock_aura_manager","kill_on_end_game"],Invisible:1b,NoGravity:1b,CustomNameVisible:0b,Silent:1b,Glowing:0b,Small:1b}
execute as @e[type=armor_stand,tag=warlock_aura_manager,tag=kill_on_end_game] at @s run tp @s @p[tag=warlock]
execute as @e[type=armor_stand,tag=warlock_aura_manager,tag=kill_on_end_game] at @s run tp @s ~ ~ ~ ~ ~0.2
execute as @e[type=armor_stand,tag=warlock_aura_manager,tag=kill_on_end_game] at @s run particle dust{color:[95, 31, 122], scale:0.8} ^ ^ ^0.14 0.01 0.05 0.01 0.2 1 force