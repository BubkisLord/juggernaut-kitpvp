execute as @a[distance=..8,tag=runner] if score @s health < @s max_health run scoreboard players operation @s healing_progress = @s healing_needed
execute as @a[distance=..8,tag=runner] at @s if score @s health < @s max_health run particle heart ~ ~0.5 ~ 0.2 1.5 0.2 0 300 force
damage @s 10