# Predator Functionality
execute as @a[tag=predator] at @s unless entity @s[scores={is_sneaking=1}] run particle white_ash ~ ~0.5 ~ 3 3 3 0.0001 30 force @a[tag=!predator,distance=..20]
execute as @a[tag=predator] at @s unless entity @s[scores={is_sneaking=1}] run particle ash ~ ~1 ~ 0.25 0.5 0.25 0.0001 100 force @a[tag=!predator,distance=..20]

# Predator footsteps management
execute at @a[tag=predator] unless entity @n[type=armor_stand,tag=predator_footstep_sound,distance=..3] run summon armor_stand ~ ~ ~ {Tags:["predator_footstep_sound","kill_on_end_game"],Invisible:1b,Marker:1b,NoGravity:1b,Silent:1b,Small:1b}
execute at @a[tag=predator] run tp @n[type=armor_stand,tag=predator_footstep_sound] ~ ~ ~ facing entity @p[tag=runner]
execute as @a[tag=predator] at @s run kill @e[type=armor_stand,tag=predator_footstep_sound,distance=3..]
execute as @a[tag=predator] run effect give @s invisibility 2 0 true