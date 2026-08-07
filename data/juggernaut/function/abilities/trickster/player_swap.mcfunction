# If there are no players to swap with, fall back on teleporting to the closest replenishment station.
execute unless entity @a[tag=runner,distance=0.1..] run tp @s @n[type=armor_stand,tag=replenishment.station]
execute at @s unless entity @a[tag=runner,distance=0.1..] run return fail

# Handle selection of runner target.
tag @s add swapping
tag @a remove trickster_swap
execute as @p[tag=runner,tag=in_chase,tag=!swapping] run tag @s add trickster_swap
execute unless entity @a[tag=trickster_swap] as @a[tag=runner,sort=furthest,limit=1] run tag @s add trickster_swap
tag @s remove swapping

# Spawn appropriate armor stands and swap players.
execute as @p[tag=trickster_swap] at @s run summon armor_stand ~ ~ ~ {Tags:["trickster_swap_target", "kill_on_end_game"],Invisible:1b,Invulnerable:1b,Marker:1b,NoGravity:1b}
execute as @s at @s run summon armor_stand ~ ~ ~ {Tags:["trickster_swap_origin", "kill_on_end_game"],Invisible:1b,Invulnerable:1b,Marker:1b,NoGravity:1b}

tp @s @n[type=armor_stand,tag=trickster_swap_target]
execute as @p[tag=trickster_swap] run tp @s @n[type=armor_stand,tag=trickster_swap_origin]

# Clean up armor stands after swap.
kill @e[type=armor_stand,tag=trickster_swap_origin]
kill @e[type=armor_stand,tag=trickster_swap_target]

# Clean up tags after swap.
tag @a remove trickster_swap