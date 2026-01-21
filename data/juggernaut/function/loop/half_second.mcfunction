# Healing Particles (for the player being healed when self-healing)
execute as @a[tag=is_healing,tag=is_being_healed] at @s run particle heart ~ ~0.5 ~ 0.3 1.5 0.3 0 1 force @s

# Effect mechanics
# This doesn't change the attributes as this could potentially mess with the player's stats. (and kit effects)
execute as @a[tag=is_hindered] run effect give @s slowness 1 4 true
execute as @a[tag=is_hindered] run effect give @s speed 1 11 true

# Effect particles
execute as @a[tag=is_undetectable] at @s run particle dust{color:[0,0,0],scale:1} ~ ~0.5 ~ 0.3 1 0.3 0 10 force @s
execute as @a[tag=is_hindered] at @s run particle dust{color:[0.6,0.6,1.0],scale:1} ~ ~0.5 ~ 0.3 1 0.3 0 10 force @s
execute as @a[tag=is_hemorrhaged] at @s run particle dust{color:[0.4,0.0,0.0],scale:1} ~ ~0.5 ~ 0.3 1 0.3 0 10 force @s
execute as @a[tag=is_mangled] at @s run particle dust{color:[1.0,0.4,0.4],scale:1} ~ ~0.5 ~ 0.3 1 0.3 0 10 force @s
execute as @a[tag=is_exposed] at @s run particle dust{color:[0.8,0.0,0.0],scale:1} ~ ~0.5 ~ 0.3 1 0.3 0 10 force @s

# Display replenishment progress.
execute if score #game_state var matches 11 run function juggernaut:replenishment_management/display_replenishment_progress

# Give respawn time effect
execute as @a[tag=has_respawn_time] run effect give @s weakness 1 255 true
execute as @a[tag=has_respawn_time] run tag @s remove in_chase

# Predator footsteps sound effect
execute as @a[tag=predator] at @s unless entity @s[tag=in_chase] as @n[type=armor_stand,tag=predator_footstep_sound] at @s at @s run playsound block.grass.step master @p[tag=predator] ^ ^ ^1 3 1 1