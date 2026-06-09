execute if score #game_state var matches 10..19 run tag @p[tag=runner,distance=..12] add has_hunters_mark
execute if score #game_state var matches 10..19 unless entity @a[tag=runner,distance=..12] run scoreboard players set @s jug_kit_cooldown 8
execute if score #game_state var matches 10..19 unless entity @a[tag=runner,distance=..12] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force

execute if score #game_state var matches 40..49 run tag @p[distance=0.5..12] add has_hunters_mark
execute if score #game_state var matches 40..49 unless entity @a[distance=0.5..12] run scoreboard players set @s jug_kit_cooldown 8
execute if score #game_state var matches 40..49 unless entity @a[distance=0.5..12] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force