execute as @a[tag=runner] if score @s health < @s max_health run scoreboard players operation @s healing_progress = @s healing_needed
execute as @a[tag=runner] at @s if score @s health < @s max_health run particle heart ~ ~0.5 ~ 0.2 1.5 0.2 0 150 force
damage @s 10