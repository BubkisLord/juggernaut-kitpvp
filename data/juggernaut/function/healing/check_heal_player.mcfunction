scoreboard players set @s healing_modifier 100

execute at @s if entity @a[tag=using_overwhelming_presence] run scoreboard players remove @s healing_modifier 10
execute at @s if entity @a[tag=using_oppression] run scoreboard players remove @s healing_modifier 70

execute if entity @s[tag=using_healer] run scoreboard players add @s healing_modifier 250
execute if entity @s[tag=using_no_caution] run scoreboard players set @s healing_modifier 0

tag @s add is_healer