# Guide
# Guidance (Passive)
execute as @a[tag=guide,scores={is_sprinting=1..}] at @s if entity @a[tag=runner,distance=1..8,scores={is_sprinting=1..}] run effect give @a[tag=runner,distance=..8] speed 1 0 true
