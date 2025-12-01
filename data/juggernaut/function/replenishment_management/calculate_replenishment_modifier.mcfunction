scoreboard players set @s replenish_speed 100
execute if entity @a[tag=using_overwhelming_presence,distance=..15] run scoreboard players remove @s replenish_speed 15
execute if entity @a[tag=using_bane_of_solidarity] unless entity @a[tag=runner,distance=0.5..8] run scoreboard players remove @s replenish_speed 5
execute if entity @s[tag=beacon_of_hope_active] run scoreboard players add @s replenish_speed 2000