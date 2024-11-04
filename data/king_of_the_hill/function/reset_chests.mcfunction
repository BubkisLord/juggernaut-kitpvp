execute as @e[tag=survival_chest_indicator] at @s run setblock ~ ~ ~ air replace
execute as @e[tag=survival_chest_indicator] at @s run kill @e[type=item,distance=..1]
execute as @e[tag=survival_chest_indicator] run tag @s remove common
execute as @e[tag=survival_chest_indicator] run tag @s remove uncommon
execute as @e[tag=survival_chest_indicator] run tag @s remove rare
execute as @e[tag=survival_chest_indicator] run tag @s remove legendary
execute as @e[tag=survival_chest_indicator,limit=12,sort=random] at @s run setblock ~ ~ ~ chest{LootTable:"king_of_the_hill:chests/common"} replace
execute as @e[tag=survival_chest_indicator] at @s if block ~ ~ ~ chest{LootTable:"king_of_the_hill:chests/common"} run tag @s add common
execute as @e[tag=survival_chest_indicator,limit=11,sort=random,tag=!common] at @s run setblock ~ ~ ~ chest{LootTable:"king_of_the_hill:chests/uncommon"} replace
execute as @e[tag=survival_chest_indicator] at @s if block ~ ~ ~ chest{LootTable:"king_of_the_hill:chests/uncommon"} run tag @s add uncommon
execute as @e[tag=survival_chest_indicator,limit=10,sort=random,tag=!common,tag=!uncommon] at @s run setblock ~ ~ ~ chest{LootTable:"king_of_the_hill:chests/rare"} replace
execute as @e[tag=survival_chest_indicator] at @s if block ~ ~ ~ chest{LootTable:"king_of_the_hill:chests/rare"} run tag @s add rare
execute if score #king_of_the_hill_customisation has_legendaries matches 1 as @a run function king_of_the_hill:set_legendary