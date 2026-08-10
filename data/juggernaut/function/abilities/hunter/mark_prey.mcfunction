execute unless entity @a[tag=runner,distance=..12] run scoreboard players set @s ability_cooldown0 8000
execute unless entity @a[tag=runner,distance=..12] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force

tag @p[tag=runner,distance=..12] add has_hunters_mark