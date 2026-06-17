# Runs once per tick while @s is dashing (called from the il_krusher kit loop).

# Crush any runner caught in the charge, dealing damage and knockback (once each per dash).
execute at @s run damage @a[tag=runner,distance=..2.5,tag=!il_krusher_crushed] 7 minecraft:player_attack by @s
execute at @s run tag @a[tag=runner,distance=..2.5] add il_krusher_crushed

# Trail particles for the charge.
particle minecraft:crit ~ ~1 ~ 0.3 0.6 0.3 0.1 12 force
particle minecraft:cloud ~ ~0.2 ~ 0.35 0.05 0.35 0.02 6 force

# Stop the dash if a wall blocks the path ahead (check feet and head height).
execute rotated ~ 0 positioned ^ ^ ^0.85 unless block ~ ~ ~ #juggernaut:raycast_permeable run scoreboard players set @s il_krusher_dash_ticks 0
execute rotated ~ 0 positioned ^ ^ ^0.85 unless block ~ ~1 ~ #juggernaut:raycast_permeable run scoreboard players set @s il_krusher_dash_ticks 0

# Glide forward horizontally (ignores look pitch) while the path is clear.
execute if score @s il_krusher_dash_ticks matches 1.. rotated ~ 0 run tp @s ^ ^ ^0.85

# Count down; end the dash and clear markers when finished or blocked.
scoreboard players remove @s il_krusher_dash_ticks 1
execute if score @s il_krusher_dash_ticks matches ..0 run tag @s remove il_krusher_dashing
execute if score @s il_krusher_dash_ticks matches ..0 run tag @a[tag=runner] remove il_krusher_crushed
