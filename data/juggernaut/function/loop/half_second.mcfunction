# Healing Particles (for the player being healed when self-healing)
execute as @a[tag=is_healing,tag=is_being_healed] at @s run particle heart ~ ~0.5 ~ 0.3 1.5 0.3 0 1 force @s

# Effect mechanics
# This doesn't change the attributes as this could potentially mess with the player's stats. (and kit effects)
execute as @a[tag=is_hindered] run effect give @s slowness 1 4 true
execute as @a[tag=is_hindered] run effect give @s speed 1 11 true

execute as @a[tag=is_undetectable] at @s run particle smoke ~ ~0.5 ~ 0.3 1 0.3 0 3 force @s