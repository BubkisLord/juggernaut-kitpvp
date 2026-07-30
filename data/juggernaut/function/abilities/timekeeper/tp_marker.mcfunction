execute unless entity @e[tag=temporal_marker] run tellraw @s [{"text":"No marker placed.","color":"red"}]
execute unless entity @e[tag=temporal_marker] run playsound block.note_block.didgeridoo ui @s ~ ~ ~ 1.2
execute unless entity @e[tag=temporal_marker] run particle angry_villager ~ ~ ~ 0.3 0.5 0.3 0 10
# Set cooldown to 4 seconds
execute unless entity @e[tag=temporal_marker] run scoreboard players set @s ability_cooldown4 8000
execute unless entity @e[tag=temporal_marker] run return fail

particle portal ~ ~0.5 ~ 0.3 0.5 0.3 1 600 force
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1
execute at @e[tag=temporal_marker] run tp @s ~ ~ ~
execute at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1
execute at @s run particle reverse_portal ~ ~0.5 ~ 0.3 0.5 0.3 1 600 force