execute if score #game_state var matches 10..19 run tag @p[tag=runner,distance=..12] add has_hunters_mark
execute if score #game_state var matches 10..19 unless entity @a[tag=runner,distance=..12] run scoreboard players set @s ability_cooldown0 8000
execute if score #game_state var matches 10..19 unless entity @a[tag=runner,distance=..12] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force