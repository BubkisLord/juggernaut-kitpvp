# Instantly make runners/juggernauts leave chase if they are outside of 40 blocks of each other.
execute as @a[tag=runner,tag=in_chase] at @s unless entity @a[tag=juggernaut,tag=in_chase,distance=..40] run scoreboard players set @s chase_timeout 0
execute as @a[tag=juggernaut,tag=in_chase] at @s unless entity @a[tag=runner,tag=in_chase,distance=..40] run scoreboard players set @s chase_timeout 0

# If chase timeout is 0, remove the player from chase.
execute as @a[tag=juggernaut,tag=in_chase,scores={chase_timeout=..0}] run function juggernaut:hooks/jug_left_chase
execute as @a[tag=runner,tag=in_chase,scores={chase_timeout=..0}] run function juggernaut:hooks/runner_left_chase
execute as @a[tag=in_chase,scores={chase_timeout=..0}] run tag @s remove in_chase

# Check whether the juggernaut/runner should be eligible for chase.
execute as @a[tag=juggernaut,predicate=!is_sneaking,tag=!shapeshifting] at @s anchored eyes positioned ^ ^ ^10 if entity @a[tag=runner,distance=..14,tag=!has_respawn_protection,predicate=!is_sneaking] run tag @s add chase_eligible
execute as @a[tag=juggernaut,predicate=!is_sneaking,tag=!shapeshifting] at @s anchored eyes positioned ^ ^ ^10 as @a[tag=runner,distance=..14,tag=!has_respawn_protection,predicate=!is_sneaking] run tag @s add chase_eligible

execute as @a[tag=juggernaut,predicate=!is_sneaking,tag=!shapeshifting] at @s anchored eyes positioned ^ ^ ^12 if entity @a[tag=runner,distance=..18,tag=!has_respawn_protection,predicate=is_sprinting] run tag @s add chase_eligible
execute as @a[tag=juggernaut,predicate=!is_sneaking,tag=!shapeshifting] at @s anchored eyes positioned ^ ^ ^12 as @a[tag=runner,distance=..18,tag=!has_respawn_protection,predicate=is_sprinting] run tag @s add chase_eligible

# If the runner is using determination, they should always be eligible for chase.
execute as @a[tag=juggernaut,tag=!shapeshifting] at @s if entity @a[tag=runner,distance=..10,predicate=!is_sneaking,tag=using_determination] run tag @s add chase_eligible
execute as @a[tag=juggernaut,tag=!shapeshifting] at @s as @a[tag=runner,distance=..10,predicate=!is_sneaking,tag=using_determination] run tag @s add chase_eligible

# For each player that is eligible for chase, set 3 seconds for their chase timeout.
execute as @a[tag=chase_eligible] run scoreboard players set @s chase_timeout 60

# If the juggernaut has the unyielding wrath perk, double their chase timeout.
execute as @a[tag=chase_eligible,tag=using_unyielding_wrath] run scoreboard players add @s chase_timeout 60

# If the juggernaut has the waiting game perk, double their chase timeout.
execute as @a[tag=chase_eligible,tag=using_waiting_game] run scoreboard players add @s chase_timeout 60

# Clean up the chase_eligible tag for all players. (to avoid infinite chase timeout)
execute as @a[tag=chase_eligible] run tag @s remove chase_eligible

# If the juggernaut/runner is about to enter chase, run the appropriate hook function.
execute as @a[tag=juggernaut,tag=!in_chase,scores={chase_timeout=1..}] run function juggernaut:hooks/jug_entered_chase
execute as @a[tag=runner,tag=!in_chase,scores={chase_timeout=1..}] run function juggernaut:hooks/runner_entered_chase

# If the chase timeout is greater than 0, ensure they are tagged as in_chase.
execute as @a[scores={chase_timeout=1..}] run tag @s add in_chase

# If the juggernaut/runner is in chase, decrement their chase timeout by 1.
execute as @a[scores={chase_timeout=1..}] run scoreboard players remove @s chase_timeout 1

# Display soul fire particles to players in chase if debug mode is enabled.
execute if score #juggernaut_customisation debug_mode matches 1 as @a[tag=in_chase] at @s run particle soul_fire_flame ~ ~0.2 ~ 0.2 0.07 0.2 0 3 force @s

# For every runner in chase, try to replenish at the highest replenishment station.
execute as @a[tag=runner,tag=in_chase] at @n[type=armor_stand,tag=replenishment.station,tag=highest_station] run function juggernaut:replenishment_management/try_replenish