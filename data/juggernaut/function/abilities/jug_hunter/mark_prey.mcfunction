tag @p[tag=runner,distance=..12] add has_hunters_mark
execute unless entity @a[tag=runner,distance=..12] run scoreboard players set @s jug_kit_cooldown 8
execute unless entity @a[tag=runner,distance=..12] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force