# Predator Functionality
execute as @a[tag=predator] at @s unless entity @s[scores={is_sneaking=1}] run particle white_ash ~ ~0.5 ~ 3 3 3 0.0001 30 force @a[tag=!predator,distance=..20]
execute as @a[tag=predator] at @s unless entity @s[scores={is_sneaking=1}] run particle ash ~ ~1 ~ 0.25 0.5 0.25 0.0001 100 force @a[tag=!predator,distance=..20]
