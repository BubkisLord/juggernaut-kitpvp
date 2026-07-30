# Healing Particles (for the player being healed when self-healing)
execute as @a[tag=is_healing] at @s run particle heart ~ ~0.5 ~ 0.3 1.5 0.3 0 1 force @s

# Effect particles
execute as @a[tag=undetectable] at @s run particle dust{color:[0,0,0],scale:1} ~ ~0.5 ~ 0.3 1 0.3 0 10 force @s

# Give respawn time effect
execute as @a[tag=has_respawn_time] run effect give @s weakness 1 255 true
execute as @a[tag=has_respawn_time] run tag @s remove in_chase

# Predator footsteps sound effect
# execute as @a[tag=predator] at @s unless entity @s[tag=in_chase] as @n[type=armor_stand,tag=predator_footstep_sound] at @s at @s run playsound block.grass.step master @p[tag=predator] ^ ^ ^1 3 1 1