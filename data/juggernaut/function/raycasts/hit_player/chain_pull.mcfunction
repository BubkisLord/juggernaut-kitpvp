scoreboard players set @p[tag=chain_hunter,tag=teleporting] jug_kit_cooldown 30
execute at @p[tag=chain_hunter,tag=teleporting] run particle witch ~ ~0.5 ~ 1.5 1.5 1.5 0 200 force
execute positioned ~ ~0.5 ~ run tp @p[tag=chain_hunter,tag=teleporting] @s
particle flame ~ ~0.5 ~ 1.5 1.5 1.5 0 100 force
scoreboard players set @p[tag=chain_hunter,tag=teleporting] jug_kit_cooldown_2 30