scoreboard players set @p[tag=eclipse_stalker,tag=teleporting] shadow_mark_cooldown 30
execute at @p[tag=eclipse_stalker,tag=teleporting] run particle witch ~ ~0.5 ~ 1.5 1.5 1.5 0 200 force
execute positioned ~ ~0.5 ~ run tp @p[tag=eclipse_stalker,tag=teleporting] @s
particle flame ~ ~0.5 ~ 1.5 1.5 1.5 0 100 force